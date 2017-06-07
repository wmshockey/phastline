class AddSimulationIdIndexToResults < ActiveRecord::Migration
  def change
    add_index :results, :simulation_id
  end
end
