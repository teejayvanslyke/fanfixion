class Status < ActiveRecord::Base
  belongs_to :trend
  belongs_to :pivot

  named_scope :recent, :order => 'created_at DESC'

  named_scope :today, lambda { 
    { :conditions => [ 'created_at > ?', 1.day.ago ] } 
  }

  named_scope :in_last_hour, lambda {
    { :conditions => [ 'created_at > ?', 1.hour.ago ] }
  }

  def self.random
    find(:first, :order => 'rand()')
  end

  def self.clean_text(text)
    text.
      gsub(/(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?/ix, '').
      gsub(/[\.\!\;\:\#\@]/, '').
      strip
  end
end
