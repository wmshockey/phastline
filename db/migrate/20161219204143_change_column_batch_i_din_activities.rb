class ChangeColumnBatchIDinActivities < ActiveRecord::Migration
  def change
    change_column :activities, :batch_id, :string
  end
end
