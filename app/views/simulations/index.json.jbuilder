json.array!(@simulations) do |simulation|
  json.extract! simulation, :id, :name, :description, :pipeline_id, :nomination_id, :max_flowrate, :max_batchsize, :flow_unit, :vol_unit, 
  :dist_unit, :pres_unit, :energy_unit, :power_unit, :pmphead_unit, :pmpflow_unit
  json.url simulation_url(simulation, format: :json)
end
