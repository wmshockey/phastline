class AddIndexToUnits < ActiveRecord::Migration
  def change
    add_index :units, :station_id
  end
end
