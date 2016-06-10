class HeroTotal < ActiveRecord::Base
  belongs_to :player_hero
  has_many :stats, as: :statable, dependent: :destroy

end
