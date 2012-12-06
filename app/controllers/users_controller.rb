class UsersController < ApplicationController
 before_filter :authenticate_user! ,:except => [:show]
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
	 @tweets = @user.tweets
	 @friends = @user.friendships
	 @current_friends = current_user.friendships
	 @following = @friends.size
	 @inverse_friends = @user.inverse_friends
	 @followers = @inverse_friends.size
	 @flag = true
end

def dashboard
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new
    @friends = current_user.friendships
    @friendlist = [@user.id]
	@friends.each do |friend|
		@friendlist << friend.friend_id 
	end

    @users = User.all

    @tweetlist = []
    @users.each do |user|
        if @friendlist.include?user.id 
        	user.tweets.each do |tweet|
        		@tweetlist << tweet
        	end

        end

    end

    @tweetlist.sort!{ |a,b| b.created_at <=> a.created_at  }

end

def following
	@user = User.find(params[:user_id])
end

def followers
	@user = User.find(params[:user_id])
end

end
