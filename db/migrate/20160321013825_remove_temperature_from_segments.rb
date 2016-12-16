class RemoveTemperatureFromSegments < ActiveRecord::Migration
  def change
    remove_column :segments, :Temperature, :float
  end
end
