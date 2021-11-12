class UsersController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      player_id: params[:player_id]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
  def update
    user = User.find_by(id: current_user.id)
    user.email = params[:email] || user.email
    user.password = params[:password] || user.password
    user.password_confirmation = params[:password_confirmation] || user.password_confirmation
    user.player_id = params[:player_id] || user.player_id
    if user.save
      render json: {message: "User updated successfully"}
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
end
