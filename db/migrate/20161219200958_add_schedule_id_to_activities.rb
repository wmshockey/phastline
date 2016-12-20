class AddScheduleIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :schedule_id, :integer
  end
end
