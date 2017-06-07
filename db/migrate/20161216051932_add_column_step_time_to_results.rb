class AddColumnStepTimeToResults < ActiveRecord::Migration
  def change
        add_column :results, :step_time, :float
  end
end
