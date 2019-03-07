// simulations Javascript file


$(document).ready(() => {

	if ($("#form_name").text() == "pipeline"){
	
		  $('.unit_field_dist').on('change', event => {
			  var number_stations = Number(stations.innerText);
			  var number_segments = Number(segments.innerText);
			  var number_elevations = Number(elevations.innerText);
			  var number_temperatures = Number(temperatures.innerText);
			  var number_dras = Number(dras.innerText);
			  if ((number_segments > 0) || (number_elevations > 0) || (number_temperatures > 0) || (number_stations > 0) || (number_dras > 0)){
			    alert('Warning: There are existing station, segment, elevation, temperature or dra records for this pipeline.  Changing the distance units will require re-entry of this data.');	
			  }	  
		  });
  
		  $('.unit_field_diam').on('change', event => {
			  var number_segments = Number(segments.innerText);
			  if (number_segments > 0) {
			  	alert('Warning: There are existing segment records for this pipeline.  Changing the units for diameters will require re-entry of this data.')
			  }
		  });
  
		  $('.unit_field_thick').on('change', event => {
			  var number_segments = Number(segments.innerText);
			  if (number_segments > 0) {
			  	alert('Warning: There are existing segment records for this pipeline.  Changing the units for wall thickness will require re-entry of this data.')
			  }
		  });
  
		  $('.unit_field_ruff').on('change', event => {
			  var number_segments = Number(segments.innerText);
			  if (number_segments > 0) {
			  	alert('Warning: There are existing segment records for this pipeline.  Changing the units for pipe roughness will require re-entry of this data.')
			  }
		  });
  
		  $('.unit_field_pres').on('change', event => {
			  var number_segments = Number(segments.innerText);
			  if (number_segments > 0) {
			  	alert('Warning: There are existing segment records for this pipeline.  Changing the units for MAWP pressures will require re-entry of this data.')
			  }
		  });
  
		  $('.unit_field_elev').on('change', event => {
			  var number_elevations = Number(elevations.innerText);
			  if (number_elevations > 0) {
			  	alert('Warning: There are existing elevation records for this pipeline.  Changing the units for elevations will require re-entry of this data.')
			  }
		  });
  
		  $('.unit_field_temp').on('change', event => {
			  var number_temperatures = Number(temperatures.innerText);
			  if (number_temperatures > 0) {
			  	alert('Warning: There are existing temperature records for this pipeline.  Changing the units for temperatures will require re-entry of this data.')
			  }
		  });

	  };

});
