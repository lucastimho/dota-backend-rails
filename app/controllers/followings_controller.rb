class FollowingsController < ApplicationController
  def index
    render json: User.find_by(id: current_user.id).players
  end
  def create
    following = Following.new(
      user_id: current_user.id,
      player_id: Player.find_by(account_id: params[:account_id]).id
    )
    if following.save
      render json: following
    end
  end
  def update
    following = Following.find_by(id: params[:id])
    following.user_id = current_user.id
    following.player_id = params[:player_id] || following.player_id
    if following.save
      render json: following
    else 
      render json: {errors: following.error.full_messages}, status: 418
    end
  end
  def destroy
    Following.destroy_by(user_id: current_user.id, player_id: params[:player_id])
    render json: {message: "Deleted Sucessfully"}
  end
end
