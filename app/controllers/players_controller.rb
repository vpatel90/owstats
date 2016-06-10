class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def fetch_data
    battle_tag = convert_pound(params.fetch(:tag))
    response = get_stats(battle_tag)
    if response[:message] == "Success"
      render js: "window.location = '/players/#{@player.id}'"
    else
      render json: response
    end
  end

  private

  def get_stats(tag)
    response = HTTParty.get("https://owapi.net/api/v1/u/#{tag}/stats")
    player = Player.find_by(tag: tag)
    if response["battletag"]
      player = create_new_player(tag) unless player
      player.store_data(response)
      player.store_player_hero_data
      @player = player
      {message: "Success"}
    else
      {message: "Invalid Battletag", status: :unprocessable_entity}
    end
  end

  def create_new_player(tag)
    Player.create(tag: tag)
  end

  def convert_pound(tag)
    tag.sub(/[#]/, '-')
  end
end
