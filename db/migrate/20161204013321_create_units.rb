class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :station_id
      t.string :pump_id
      t.integer :unit_row
      t.integer :unit_column

      t.timestamps null: false
    end
  end
end
