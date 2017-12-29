class AddNumberSegmentsToPipelines < ActiveRecord::Migration
  def change
    add_column :pipelines, :number_segments, :integer
    add_column :pipelines, :number_elevations, :integer
    add_column :pipelines, :number_temperatures, :integer
    add_column :pipelines, :number_dras, :integer
  end
end
