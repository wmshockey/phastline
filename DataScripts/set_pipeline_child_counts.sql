update pipelines p set p.number_stations = (select count(*) from stations s where s.pipeline_id = p.id);
update pipelines p set p.number_segments = (select count(*) from segments s where s.pipeline_id = p.id);
update pipelines p set p.number_elevations = (select count(*) from elevations e where e.pipeline_id = p.id);
update pipelines p set p.number_temperatures = (select count(*) from temperatures t where t.pipeline_id = p.id);
update pipelines p set p.number_dras = (select count(*) from dras d where d.pipeline_id = p.id);
