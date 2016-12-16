json.array!(@pumps) do |pump|
  json.extract! pump, :id, :pump_id, :description, :flow_units, :head_units, :pressure_units, :minimum_suction, :stages, :impeller_diameter
  json.url pump_url(pump, format: :json)
end
