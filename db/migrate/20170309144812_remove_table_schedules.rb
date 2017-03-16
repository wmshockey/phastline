class RemoveTableSchedules < ActiveRecord::Migration
  def change
    drop_table :activities
    drop_table :schedules
  end
end
