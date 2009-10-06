class Status < ActiveRecord::Base
  validates_uniqueness_of :twitter_id
  belongs_to :trend

  def self.random
    find(:first, :order => 'rand()')
  end
end
