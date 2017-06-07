class RemoveColumnStationIdFromStations < ActiveRecord::Migration
  def change
    remove_column :stations, :station_id
    remove_column :stations, :station_id_id
  end
end
