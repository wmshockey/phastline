class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
      t.string :name
      t.string :description
      t.string :pipeline_name
      t.string :schedule_name
      t.float :flowrate

      t.timestamps null: false
    end
  end
end
