class PlayerHero < ActiveRecord::Base
  belongs_to :hero
  belongs_to :player
end
