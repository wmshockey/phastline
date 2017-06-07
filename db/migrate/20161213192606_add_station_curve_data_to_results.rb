class AddStationCurveDataToResults < ActiveRecord::Migration
  def change
    add_column :results, :station_curve_data, :text
  end
end
