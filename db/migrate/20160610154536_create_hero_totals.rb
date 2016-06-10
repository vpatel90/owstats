class CreateHeroTotals < ActiveRecord::Migration
  def change
    create_table :hero_totals do |t|
      t.belongs_to :player_hero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
