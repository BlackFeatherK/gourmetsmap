class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend +1 ☺"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Whoops! I don't think you have friends..."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:alert] = "Friend -1 ☹"
    redirect_back(fallback_location: root_path)
  end
end
