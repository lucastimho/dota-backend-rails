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
      
    )
  end
end
