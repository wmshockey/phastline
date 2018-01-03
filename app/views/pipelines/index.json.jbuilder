json.array!(@pipelines) do |pipeline|
  json.extract! pipeline, :id, :name, :description, dist_unit, diam_unit, thick_unit, ruff_unit, pres_unit, elev_unit, temp_unit
  json.url pipeline_url(pipeline, format: :json)
end
