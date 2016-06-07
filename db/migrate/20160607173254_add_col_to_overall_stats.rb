class AddColToOverallStats < ActiveRecord::Migration
  def change
    add_reference :overall_stats, :player, index: true, foreign_key: true
  end
end
