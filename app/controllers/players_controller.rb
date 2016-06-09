class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def fetch_data
    response = get_stats
    if response[:message] == "Success"
      render js: "window.location = '/players/#{@player.id}'"
    else
      render json: response
    end
  end

  private

  def get_stats
    response = HTTParty.get("https://owapi.net/api/v1/u/#{params[:tag]}/stats")
    player = Player.find_by(tag: params[:tag])
    if response["battletag"]
      player = create_new_player unless player
      player.store_data(response)
      @player = player
      {message: "Success"}
    else
      {message: "Invalid Battletag", status: :unprocessable_entity}
    end
  end

  def create_new_player
    Player.create(tag: params[:tag])
  end
end
