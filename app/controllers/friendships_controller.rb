class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @inverse_friendships = current_user.inverse_friendships.build(user_id: params[:friend_id])

    if @friendship.save && @inverse_friendships.save
      flash[:notice] = "Friend +1 ☺ Yehhhhhh~~"

      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @inverse_friendships = current_user.inverse_friendships.find_by(user_id: params[:id])

    @friendship.destroy
    @inverse_friendships.destroy
    flash[:alert] = "NOOOOOOO!!!!! Friend -1 ☹"
    redirect_back(fallback_location: root_path)
  end

end
