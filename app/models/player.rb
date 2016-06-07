class Player < ActiveRecord::Base
  has_many :game_stats
  has_one :overall_stat

  def get_stats
    response = HTTParty.get("https://owapi.net/api/v1/u/#{self.tag}/stats")
    if response["battletag"]
      store_data(response)
      {message: "Stored Success"}
    else
      {message: "Unable to get a Response due to invalid battletag"}
    end
  end

  def store_data(response)
    # new_gs = response["game_stats"]
    new_os = response["overall_stats"]
    # new_gs.each do |stat|
    #   create(stat)
    # end
    if overall_stat
      overall_stat.update(games: new_os['games'],
                          wins: new_os['wins'],
                          losses: new_os['losses'],
                          win_rate: new_os['win_rate'])
    else
      OverallStat.create(player_id: self.id,
                          games: new_os['games'],
                          wins: new_os['wins'],
                          losses: new_os['losses'],
                          win_rate: new_os['win_rate'])
    end
  end

end
