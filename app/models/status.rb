class Status < ActiveRecord::Base
  validates_uniqueness_of :twitter_id

  def self.random
    find(:first, :order => 'rand()')
  end
end
