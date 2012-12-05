class Tweet < ActiveRecord::Base
  attr_accessible :tweetContent
  belongs_to :user
end
