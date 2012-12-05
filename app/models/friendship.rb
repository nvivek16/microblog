class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  validates_uniqueness_of :user_id, :scope => [:friend_id]
  belongs_to :user
  belongs_to :friend, :class_name => "User"	
end
