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
      if @tweet.save
        redirect_to(user_dashboard_path)
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
    flash[:notice] = "Successfully destroyed tweet."
  end

  def edit
      @tweet = tweet.find(params[:id])
  end

 
end
