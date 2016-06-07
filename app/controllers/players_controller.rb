class PlayersController < ApplicationController
  def fetch_data
    r = get_stats
  end

  private

  def get_stats
    response = HTTParty.get("https://owapi.net/api/v1/u/#{params[:tag]}/stats")
    player = Player.find_by(tag: params[:tag])
    if response["battletag"]
      player = create_new_player unless player
      player.store_data(response)
      {message: "Stored Success"}
    else
      {message: "Unable to get a Response due to invalid battletag"}
    end
  end

  def create_new_player
    Player.create(tag: params[:tag])
  end
end
