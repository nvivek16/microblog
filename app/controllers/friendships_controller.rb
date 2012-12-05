class FriendshipsController < ApplicationController
  def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    #flash[:notice] = "Added friend."
    redirect_to user_path(current_user.id), :notice => "u r folowing the user"
  else
    #flash[:error] = "Unable to add friend."
    redirect_to user_path(current_user.id), :notice => "already following"
  end
  end

def destroy
  @friendship = current_user.friendships.find_by_friend_id(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to users_path
end
end


