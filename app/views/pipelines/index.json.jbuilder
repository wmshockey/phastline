json.array!(@pipelines) do |pipeline|
  json.extract! pipeline, :id, :name, :description
  json.url pipeline_url(pipeline, format: :json)
end
