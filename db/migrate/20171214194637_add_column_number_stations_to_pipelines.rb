class AddColumnNumberStationsToPipelines < ActiveRecord::Migration
  def change
    add_column :pipelines, :number_stations, :integer
  end
end
