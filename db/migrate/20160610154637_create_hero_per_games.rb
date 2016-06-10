class CreateHeroPerGames < ActiveRecord::Migration
  def change
    create_table :hero_per_games do |t|
      t.belongs_to :player_hero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
