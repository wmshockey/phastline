class AddScheduleIdIndexToActivities < ActiveRecord::Migration
  def change
    add_index :activities, :schedule_id
  end
end
