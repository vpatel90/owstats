class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :account_type
      t.string :tag
      t.string :region

      t.timestamps null: false
    end
  end
end
