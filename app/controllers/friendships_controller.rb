class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend +1"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Whoops! I think you don't have friends..."
      redirect_back(fallback_location: root_path)
    end

  end
end
