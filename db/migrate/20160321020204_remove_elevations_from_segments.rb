class RemoveElevationsFromSegments < ActiveRecord::Migration
  def change
    remove_column :segments, :start_elev, :float
    remove_column :segments, :end_elev, :float
  end
end
