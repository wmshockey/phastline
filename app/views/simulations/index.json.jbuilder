json.array!(@simulations) do |simulation|
  json.extract! simulation, :id, :name, :description, :pipeline_name, :nomination_name, :schedule_name, :max_flowrate, :max_batchsize
  json.url simulation_url(simulation, format: :json)
end
