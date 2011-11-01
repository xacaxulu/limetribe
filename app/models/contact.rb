class Contact < ActiveRecord::Base
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  has_many :tweets
end
