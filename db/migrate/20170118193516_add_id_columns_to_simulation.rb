class AddIdColumnsToSimulation < ActiveRecord::Migration
  def change
    add_column :simulations, :pipeline_id, :integer
    add_column :simulations, :schedule_id, :integer
    add_column :simulations, :nomination_id, :integer
  end
end
