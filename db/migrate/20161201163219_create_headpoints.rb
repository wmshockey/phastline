class CreateHeadpoints < ActiveRecord::Migration
  def change
    create_table :headpoints do |t|
      t.string :pump_id
      t.float :flow
      t.float :head

      t.timestamps null: false
    end
    add_index :headpoints, :pump_id
  end
end
