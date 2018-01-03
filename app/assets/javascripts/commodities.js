$(document).ready(() => {

    if ($("#form_name").text() == "commodity"){

  	  $('#visc_unit, #dens_unit, #temp_unit, #pres_unit').on('change', event => {
  		  var visc1 = $("#visc1").val();
		  var visc2 = $("#visc2").val();
		  var temp1 = $("#temp1").val();
		  var temp2 = $("#temp2").val();
		  var dens  = $("#dens").val();
		  var vapor = $("#vapor").val();
  		  if ( !(visc1 == "") || !(visc2 == "") || !(temp1 == "") || !(temp2 == "") || !(dens == "") || !(vapor == "") ) {
  		    alert('Warning: There are data values entered for fields on this form.  Changing units may require re-entry of this data.');	
  		  }	  
  	  });

    };

});