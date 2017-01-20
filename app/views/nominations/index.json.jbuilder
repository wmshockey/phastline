json.array!(@nominations) do |nomination|
  json.extract! nomination, :id, :name, :description, :nom_date, :period, :pipeline_id
  json.url nomination_url(nomination, format: :json)
end
