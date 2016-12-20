json.array!(@activities) do |activity|
  json.extract! activity, :id, :batch_id, :start_time, :end_time, :activity_type, :volume, :source_location, :destination_location, :destination_facility, :shipper, :nomination_name
  json.url activity_url(activity, format: :json)
end
