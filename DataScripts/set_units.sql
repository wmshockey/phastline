update simulations set flow_unit="m3/hr", vol_unit="m3", dist_unit="km", pres_unit="kpa", energy_unit="kwh", power_unit="kw", pmphead_unit="m", pmpflow_unit="m3/hr";
update pipelines set dist_unit="km", diam_unit="m", thick_unit="m", ruff_unit="m", pres_unit="kpa", elev_unit="m", temp_unit="C";
update commodities set visc_unit="cst", dens_unit="kg/m3", temp_unit="C", pres_unit="kpa";
update pumps set flow_units="gal/min", head_units="ft", pressure_units="psi";
update nominations set vol_unit="m3"; 
