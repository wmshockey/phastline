class ChangeTimestampInResults < ActiveRecord::Migration
  def change
    change_column :results, :timestamp, :datetime
  end
end
