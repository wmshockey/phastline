json.array!(@commodities) do |commodity|
  json.extract! commodity, :id, :commodity_id, :commodity_name, :temp1, :visc1, :temp2, :visc2, :density, :density_cf, :vapor
  json.url commodity_url(commodity, format: :json)
end
