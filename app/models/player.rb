class Player < ActiveRecord::Base
  has_many :game_stats
  has_one :overall_stat

  validates :tag, presence: true, uniqueness: {case_sensitive: false}

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
