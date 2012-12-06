class TweetsController < ApplicationController
  before_filter :authenticate_user!,  :except => [:show, :index]

  def index
    @user = User.find(params[:user_id])
    @tweets = @user.tweets

  end

  def new
      @user = User.find(params[:user_id])
      @tweet = @user.tweets.new
  end

  def show
      @user = User.find(params[:user_id])
      @tweet = @user.tweets.find(params[:id])
  end
  def create
      @user = User.find(params[:user_id])
      @tweet = @user.tweets.new(params[:tweet]) 
         
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

  

    @tweetlist.sort!{ |a,b| b.created_at <=> a.created_at } 
      if @tweet.save
        respond_to do |format|
        format.html { redirect_to(user_dashboard_path) }
        format.js
        end 
      else
        render :action => 'new'
      end
  end

  def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update_attributes(params[:tweet])
        flash[:notice] = "Successfully updated tweet"
      else
        render :action => 'edit'
      end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to(user_path(current_user))
  end

  def edit
      @tweet = tweet.find(params[:id])
  end

 
end
