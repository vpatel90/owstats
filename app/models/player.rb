class Player < ActiveRecord::Base
  has_many :game_stats, dependent: :destroy
  has_one :overall_stat, dependent: :destroy

  after_create :create_init_stats

  STATS = ["final blows", "eliminations", "kpd", "deaths", "damage", "healing", "medals"]

  validates :tag, presence: true, uniqueness: {case_sensitive: false}

  def store_data(response)
    new_gs = response["game_stats"]
    new_os = response["overall_stats"]
    new_gs.each do |stat|
      game_stats.find_by(name: stat["name"]).update(average: stat["avg"], value: stat["value"])
    end
    overall_stat.update(games: new_os['games'],
                        wins: new_os['wins'],
                        losses: new_os['losses'],
                        win_rate: new_os['win_rate'])

  end

  def create_init_stats
    OverallStat.create(player_id: self.id)
    STATS.each do |stat|
      game_stats.create(name: stat)
    end
  end

  def display_name
    self.tag.sub(/[-]/, '#')
  end
end
