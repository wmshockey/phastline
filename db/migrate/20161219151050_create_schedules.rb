class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.integer :period
      t.integer :simulation_id
      t.string :sched_type

      t.timestamps null: false
    end
  end
end
