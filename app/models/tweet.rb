class Tweet < ActiveRecord::Base
 ## validates_uniqueness_of :tweet_id, :on => :create, :message => "must be unique"
  #validates_presence_of :contact_id, :on => :create, :message => "can't be blank"
  validates_presence_of :message, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :message, :on => :create, :message => "must be unique"
  validates_uniqueness_of :message, :scope => :contact_id
  validates_presence_of :tweet_date, :on => :create, :message => "can't be blank"
  validates_presence_of :contact_id, :on => :create, :message => "can't be blank"
  

  belongs_to :contact
  
end
