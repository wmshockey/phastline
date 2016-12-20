class AddScheduleNameToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :schedule_name, :string
  end
end
