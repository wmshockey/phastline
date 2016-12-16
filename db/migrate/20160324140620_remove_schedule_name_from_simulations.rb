class RemoveScheduleNameFromSimulations < ActiveRecord::Migration
  def change
    remove_column :simulations, :schedule_name, :string
    add_column :simulations, :nomination_name, :string
  end
end
