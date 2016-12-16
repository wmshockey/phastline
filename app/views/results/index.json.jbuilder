json.array!(@results) do |result|
  json.extract! result, :id, :simulation_id, :simulation_name, :step, :timestamp, :kmp, :station_id, :stat, :flow, :pumped_volume, :upstream_batch, :downstream_batch, :hold, :suct, :head, :casep, :disc, :max_disc_pressure, :min_pressure_violation, :min_pressure_point, :max_pressure_violation, :max_pressure_point, :total_static_loss, :total_dynamic_loss
  json.url result_url(result, format: :json)
end
