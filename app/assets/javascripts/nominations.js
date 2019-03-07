$(document).ready(() => {

    if ($("#form_name").text() == "nomination"){

  	  $('#unit_vol').on('change', event => {
  		  var number_shipments = Number(shipments.innerText);
  		  if (number_shipments > 0) {
  		    alert('Warning: There are existing shipments for this nomination.  Changing the volume unit will require re-entry of this data.');	
  		  }	  
  	  });

    };

});