json.array!(@elevations) do |elevation|
  json.extract! elevation, :id, :name, :kmp
  json.url elevation_url(elevation, format: :json)
end
