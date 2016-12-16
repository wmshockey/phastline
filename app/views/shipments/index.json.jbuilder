json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :start_location, :end_location, :shipper, :commodity_id, :volume
  json.url shipment_url(shipment, format: :json)
end
