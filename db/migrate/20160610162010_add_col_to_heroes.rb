class AddColToHeroes < ActiveRecord::Migration
  def change
    add_column :heros, :api_id, :integer
  end
end
