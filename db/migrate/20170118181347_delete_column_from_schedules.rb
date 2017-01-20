class DeleteColumnFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :pipeline_name
  end
end
