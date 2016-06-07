class CreateOverallStats < ActiveRecord::Migration
  def change
    create_table :overall_stats do |t|
      t.integer :games
      t.integer :losses
      t.integer :rank
      t.float :win_rate
      t.integer :wins

      t.timestamps null: false
    end
  end
end
