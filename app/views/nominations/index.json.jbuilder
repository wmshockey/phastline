json.array!(@nominations) do |nomination|
  json.extract! nomination, :id, :name, :description, :nom_date, :period, :pipeline_id, :vol_unit, :total_volume
  json.url nomination_url(nomination, format: :json)
end
