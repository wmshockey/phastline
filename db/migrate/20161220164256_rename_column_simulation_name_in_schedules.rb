class RenameColumnSimulationNameInSchedules < ActiveRecord::Migration
  def change
        rename_column :schedules, :simulation_name, :pipeline_name
        add_column :nominations, :pipeline_name, :string
  end
end
