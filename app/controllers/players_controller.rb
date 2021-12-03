class PlayersController < ApplicationController
  def index 
    response = HTTP.get("https://api.opendota.com/api/proPlayers").parse(:json)
    render json: response.as_json
  end
  def show
    render json: HTTP.get("https://api.opendota.com/api/players/#{params[:account_id]}").parse(:json)
  end
  def create
    response = HTTP.get("https://api.opendota.com/api/players/#{params[:account_id]}").parse(:json)
    player = Player.new(
      account_id: params[:account_id],
      name: response["profile"]["name"],
      person_name: response["profile"]["personaname"],
      avatar_full: response["profile"]["avatarfull"],
      mmr: response["mmr_estimate"]["estimate"],
    )
    if player.save
      render json: player
    else 
      render json: {errors: player.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    response = HTTP.get("https://api.opendota.com/api/players/#{params[:account_id]}").parse(:json)
    player = Player.find_by(id: params[:id])
    player.account_id = params[:account_id] || player.account_id
    player.name = response["profile"]["name"]
    player.person_name = response["profile"]["personaname"]
    player.avatar_full = response["profile"]["avatarfull"]
    player.mmr = response["mmr_estimate"]["estimate"]
    if player.save
      render json: player
    else
      render json: {errors: player.errors.full_messages}, status: 418
    end
  end
end
