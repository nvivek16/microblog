class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :tweets
   has_many :friendships
   has_many :friends, :through => :friendships
   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
   has_many :inverse_friends, :through => :inverse_friendships, :source => :user
   has_attached_file :photo, :styles => { :small => "500x500>" }, :default_url => '/system/photos/default_profile_add_photo.png'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :photo, :bio
  # attr_accessible :title, :body
end
