class BestGame < ActiveRecord::Base
  belongs_to :player_hero
  has_many :stats
  
end
