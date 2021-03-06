class Player < ActiveRecord::Base
  has_many :game_stats, dependent: :destroy
  has_one :overall_stat, dependent: :destroy
  has_many :player_heros, dependent: :destroy

  after_create :create_init_stats, :create_init_player_heroes

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

  def store_player_hero_data
    player_heros.each do |player_hero|
      response = HTTParty.get("https://owapi.net/api/v1/u/#{self.tag}/heroes/#{player_hero.hero.id}")
      player_hero.store_stats(response["stats"]) unless response["stats"].empty?
    end

  end

  def create_init_stats
    OverallStat.create(player_id: self.id)
    STATS.each do |stat|
      game_stats.create(name: stat)
    end
  end

  def create_init_player_heroes
    Hero.all.each do |hero|
      player_heros.create(hero_id: hero.id)
    end
  end

  def display_name
    self.tag.sub(/[-]/, '#')
  end

  def avg_medals
    self.game_stats[6].average
  end

  def avg_elims
    self.game_stats[1].average
  end

  def avg_kills
    self.game_stats[0].average
  end

  def avg_deaths
    self.game_stats[3].average
  end

  def avg_healing
    self.game_stats[5].average
  end

  def avg_damage
    self.game_stats[4].average
  end
end
