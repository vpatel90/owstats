class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :name
      t.float :value
      t.integer :statable_id
      t.string :statable_type

      t.timestamps null: false
    end
  end
end
