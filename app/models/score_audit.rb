class ScoreAudit < ActiveRecord::Base
  self.inheritance_column = 'none'

  named_scope :since, lambda {|time|
    { :conditions => [ 'created_at > ?', time ] }
  }

  belongs_to :pivot

  class << self
    def take_snapshot(type)
      Trend.all.each do |trend|
        trend.emotions.each do |emotion|
          pivot = Pivot.find_or_create_by_emotion_and_trend(emotion, trend)
          create!(:pivot => pivot, :score => pivot.send("#{type}_score"), :type => type.to_s)
        end
      end
    end
  end
end
