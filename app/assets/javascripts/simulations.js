// simulations Javascript file


$(document).ready(() => {
	
  $('.copyright').on('mouseenter', event => {
    $(event.currentTarget).css({color: 'red'})
  });
	
  $('.copyright').on('mouseleave', event => {
  	$(event.currentTarget).css({color: 'black'})
  });

  $('nav li').on('mouseenter', event => {
	  $(event.currentTarget).css({fontWeight: 'bolder'})	 
  });
	
  $('nav li').on('mouseleave', event => {
	  $(event.currentTarget).css({fontWeight: ''})
  })
  
  $('#runSim').click(function() {
	  $("#simulation").removeClass("hidden")
  })
  
  $('#showResults').click(function() {
	  $('#simulation').addClass("hidden")
  })
  
  $('[data-toggle="tooltip"]').tooltip();
  
  $('#max_flowrate, #max_batchsize, #max_steptime, #simulation_nomination_id, #simulation_pipeline_id').on("change", function(){
      check_steps();
  })
  
  $('#estimate_steps').click(function() {
	  check_steps();
	  var max_flowrate = $("#max_flowrate").val();
	  var max_batchsize = $("#max_batchsize").val();
	  var max_steptime = $("#max_steptime").val();
	  var volume = Number(total_volume.innerText);	  
	  if (max_batchsize > 0) {
		var number_batches = Math.round(volume/max_batchsize);
	  };
	  $("#number_batches").text(number_batches);	  
	  var stations = Number(number_stations.innerText);
	  if ((max_flowrate > 0) && (max_steptime > 0)) {
			var nsteps1 = Math.round((volume / max_flowrate)/max_steptime)}
	  else {
			var nsteps1 = 0;
	  };
	  var nsteps2 = stations * number_batches;
	  var nsteps = Math.max(nsteps1, nsteps2);
	  $("#number_steps").text(nsteps);
	  var message = "Total nominated volume is "+volume+".\  Number of pipeline stations is "+stations+".\  Number of batches is "+number_batches+".";
	  if (nsteps > 3000) {
		  message = message+"Warning: The estimated number of steps is over 3000.  Running this simulation will take several minutes to complete.   \
		  You can reduce the number of steps by increasing the maximum step time, increasing maximum flowrate or decreasing the total volume of shipments in the nomination.";
	  };
	  $("#warning_message").text(message);	  
  })

  if ($("#simulation_nomination_id").length > 0){
	  $(function() {
		  check_steps();
	  })
  }
  
  function check_steps() {
	  var nom = $("#simulation_nomination_id :selected").val();
	  var pline = $("#simulation_pipeline_id :selected").val();
	  
	  $.ajax({
		  url: "/nominations/"+nom,
		  dataType: 'json',
	      success: function(data) {
			var volume = data.total_volume;
			$("#total_volume").text(volume);
	    }
	  });
	  $.ajax({
		  url: "/pipelines/"+pline,
		  dataType: 'json',
		  success: function(data) {
			  var nstations = data.number_stations;
			  $("#number_stations").text(nstations);		
		  }
	  }); 
  
  }
 
}); 

  