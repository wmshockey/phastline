json.array!(@temperatures) do |temperature|
  json.extract! temperature, :id, :name, :kmp
  json.url temperature_url(temperature, format: :json)
end
