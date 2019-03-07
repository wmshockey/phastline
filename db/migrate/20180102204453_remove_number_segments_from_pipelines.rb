class RemoveNumberSegmentsFromPipelines < ActiveRecord::Migration
  def change
    remove_column :pipelines, :number_segments, :integer
    remove_column :pipelines, :number_stations, :integer
    remove_column :pipelines, :number_elevations, :integer
    remove_column :pipelines, :number_temperatures, :integer
    remove_column :pipelines, :number_dras, :integer
  end
end
