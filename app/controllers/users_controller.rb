class UsersController < ApplicationController
  def show
    render json: User.find_by(id: current_user.id)
  end
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      account_id: params[:account_id]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def update
    user = User.find_by(id: current_user.id)
    user.email = params[:email] || user.email
    user.account_id = params[:account_id] || user.account_id
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end
  def recent
    response = HTTP.get("https://api.opendota.com/api/players/#{current_user.account_id}/recentMatches")
    render json: response
  end
end
