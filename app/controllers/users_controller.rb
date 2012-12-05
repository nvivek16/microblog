class UsersController < ApplicationController
 before_filter :authenticate_user!
def index
	@users = User.find(:all, :conditions => ["id != ?", current_user.id])
	@friends = current_user.friendships
	@friendlist = []
	@friends.each do |friend|
		@friendlist << friend.friend_id 
	end
end

def show
	@user = User.find(params[:id])
end

def dashboard
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new
    @friends = current_user.friendships
    @friendlist = []
	@friends.each do |friend|
		@friendlist << friend.friend_id 
	end

    @users = User.all

    @tweetlist = []
    @users.each do |user|
=begin        if @friendlist.include?user.id do
        	user.tweets.each do |tweet|
        		@tweetlist << tweet
        	end

        end
=end
    end

end

def following
	@user = User.find(params[:user_id])
end

def followers
	@user = User.find(params[:user_id])
end
end
