class PlayerHero < ActiveRecord::Base
  belongs_to :hero
  belongs_to :player
  has_one :specific_stat, dependent: :destroy
  has_one :hero_total, dependent: :destroy
  has_one :hero_per_game, dependent: :destroy
  has_one :best_game, dependent: :destroy
  has_one :best_life, dependent: :destroy

  after_create :create_init_stat_containers

  def create_init_stat_containers
    BestGame.create(player_hero_id: self.id)
    BestLife.create(player_hero_id: self.id)
    HeroPerGame.create(player_hero_id: self.id)
    HeroTotal.create(player_hero_id: self.id)
    SpecificStat.create(player_hero_id: self.id)
  end

  def store_stats(stats_array)
    update_or_create(specific_stat, stats_array[0]["stats"])
    update_or_create(hero_total, stats_array[1]["stats"])
    update_or_create(hero_per_game, stats_array[2]["stats"])
    update_or_create(best_game, stats_array[3]["stats"])
    update_or_create(best_life, stats_array[4]["stats"])
  end

  def update_or_create(stat_container, stats)
    stats.each do |stat|
      if stat_container.stats.exists?(name: stat["name"])
        stat_container.stats.udpate(value: stat["value"])
      else
        stat_container.stats.create(name: stat["name"], value: stat["value"])
      end
    end
  end
end
