$(document).ready(() => {

    if ($("#form_name").text() == "pump"){

  	  $('.unit_field_flow').on('change', event => {
  		  var number_headpoints = Number(headpoints.innerText);
  		  if (number_headpoints > 0) {
  		    alert('Warning: There are existing head points for this pump.  Changing the flow units will require re-entry of this data.');	
  		  }	  
  	  });

  	  $('.unit_field_head').on('change', event => {
  		  var number_headpoints = Number(headpoints.innerText);
  		  if (number_headpoints > 0) {
  		    alert('Warning: There are existing head points for this pump.  Changing the head units will require re-entry of this data.');	
  		  }	  
  	  });
	  
  	  $('.unit_field_vaporpres').on('change', event => {
  		  var number_headpoints = Number(headpoints.innerText);
  		  if (number_headpoints > 0) {
  		    alert('Warning: There are existing head points for this pump.  Changing the vapor pressure units will require re-entry of this data.');	
  		  }	  
  	  }); 

    };

});


