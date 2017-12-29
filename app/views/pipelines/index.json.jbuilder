json.array!(@pipelines) do |pipeline|
  json.extract! pipeline, :id, :name, :description, :number_stations, :number_segments, :number_elevations :number_temperatures, :number_dras, dist_unit, diam_unit, thick_unit, ruff_unit, pres_unit, elev_unit, temp_unit
  json.url pipeline_url(pipeline, format: :json)
end
