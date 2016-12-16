class AddPipelineRefToStations < ActiveRecord::Migration
  def change
    add_reference :stations, :pipeline, index: true, foreign_key: true
  end
end
