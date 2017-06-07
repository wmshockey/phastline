class RemoveColumnsFromSimulations < ActiveRecord::Migration
  def change
    remove_column :simulations, :pipeline_name
    remove_column :simulations, :schedule_name
    remove_column :simulations, :nomination_name
  end
end
