class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :simulation_id
      t.string :simulation_name
      t.integer :step
      t.float :timestamp
      t.float :kmp
      t.references :station_id
      t.string :stat
      t.float :flow
      t.float :pumped_volume
      t.string :upstream_batch
      t.string :downstream_batch
      t.float :hold
      t.float :suct
      t.float :head
      t.float :casep
      t.float :disc
      t.float :max_disc_pressure
      t.float :min_pressure_violation
      t.float :min_pressure_point
      t.float :max_pressure_violation
      t.float :max_pressure_point
      t.float :total_static_loss
      t.float :total_dynamic_loss

      t.timestamps null: false
    end
  end
end
