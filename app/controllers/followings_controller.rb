class FollowingsController < ApplicationController
  def show
    render json: User.find_by(id: current_user.id).players
  end
  def create
    following = Following.new(
      user_id: current_user.id,
      player_id: params[:player_id]
    )
    if following.save
      render json: {message: "Added player to follow list!"}
    end
  end
  def update
    following = Following.find_by(id: params[:id])
    following.user_id = current_user.id
    following.player_id = params[:player_id] || following.player_id
    if following.save
      render json: {message: "Added player to follow list!"}
    end
  end
  def destroy
    Following.destroy_by(id: params[:id])
  end
end
