class FriendshipsController < ApplicationController
  
  def create
    @friendship = Friendship.create(user_id:current_user.id, friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend +1 ☺ Yehhhhhh~~"

      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.inverse_friendships.where(user_id: params[:id]).first || current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:alert] = "NOOOOOOO!!!!! Friend -1 ☹"
    redirect_back(fallback_location: root_path)
  end

end
