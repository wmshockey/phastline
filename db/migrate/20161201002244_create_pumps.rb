class CreatePumps < ActiveRecord::Migration
  def change
    create_table :pumps do |t|
      t.string :pump_id
      t.string :description_text
      t.string :flow_units
      t.string :head_units
      t.string :pressure_units
      t.float :minimum_suction
      t.integer :stages
      t.float :impeller_diameter

      t.timestamps null: false
    end
  end
end
