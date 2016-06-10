class CreatePlayerHeros < ActiveRecord::Migration
  def change
    create_table :player_heros do |t|
      t.belongs_to :hero, index: true, foreign_key: true
      t.belongs_to :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
