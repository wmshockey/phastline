json.array!(@headpoints) do |headpoint|
  json.extract! headpoint, :id, :pump_id, :flow, :head
  json.url headpoint_url(headpoint, format: :json)
end
