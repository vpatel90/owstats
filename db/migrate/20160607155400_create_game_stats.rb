class CreateGameStats < ActiveRecord::Migration
  def change
    create_table :game_stats do |t|
      t.string :name
      t.integer :value
      t.float :average
      t.belongs_to :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
