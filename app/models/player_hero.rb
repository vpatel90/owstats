class PlayerHero < ActiveRecord::Base
  belongs_to :hero
  belongs_to :player
  has_one :best_game, dependent: :destroy
  has_one :best_life, dependent: :destroy
  has_one :hero_per_game, dependent: :destroy
  has_one :hero_total, dependent: :destroy
  has_one :specific_stat, dependent: :destroy

  after_create :create_init_stat_containers

  def create_init_stat_containers
    BestGame.create(player_hero_id: self.id)
    BestLife.create(player_hero_id: self.id)
    HeroPerGame.create(player_hero_id: self.id)
    HeroTotal.create(player_hero_id: self.id)
    SpecificStat.create(player_hero_id: self.id)
  end
end
