class ScoreAudit < ActiveRecord::Base

  belongs_to :emotion
  belongs_to :trend


  class << self
    def take_snapshot(type)
      Trend.all.each do |trend|
        trend.emotions.each do |emotion|
          pivot = Pivot.find_or_create(:emotion => emotion, :trend => trend)
          create!(:pivot => pivot, :score => pivot.send("#{type}_score"), :type => type)
        end
      end
    end
  end
end
