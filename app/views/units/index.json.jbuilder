json.array!(@units) do |unit|
  json.extract! unit, :id, :station_id, :pump_id, :unit_row, :unit_column
  json.url unit_url(unit, format: :json)
end
