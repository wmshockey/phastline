class AddPipelineIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :pipeline_id, :integer
  end
end
