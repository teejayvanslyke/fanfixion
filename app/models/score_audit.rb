class ScoreAudit < ActiveRecord::Base

  belongs_to :emotion
  belongs_to :trend


  class << self
    def take_snapshot(type)
      Trend.all.each do |trend|
        trend.emotions.each do |emotion|
          pivot = Pivot.new(:emotion => emotion, :trend => trend)
          create!(:emotion => emotion, :trend => trend, :score => pivot.score(type), :type => type)
        end
      end
    end
  end
end
