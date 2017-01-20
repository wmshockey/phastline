json.array!(@simulations) do |simulation|
  json.extract! simulation, :id, :name, :description, :pipeline_id, :nomination_id, :schedule_id, :max_flowrate, :max_batchsize
  json.url simulation_url(simulation, format: :json)
end
