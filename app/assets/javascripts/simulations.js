// simulations Javascript file


$(document).ready(() => {
	
	  if (document.getElementById("header")) {
		  var header = document.getElementById("header").innerHTML;
	  }
	
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
		  $("#simulation").removeClass("hidden");
		  $("#simulation_status").text("Simulation started! 0");
	/* Check every 1 second to see status of simulation. */
		  id = document.getElementById("simulation_id").innerHTML;
			setInterval(function() {	
				$.ajax({
					url: "/simulations/"+id+"/query",
					dataType: 'json',
					success: function(data) {
						var status_msg = data.status;
						$("#simulation_status").text(status_msg);
						var msg_arr = status_msg.split(" ");
						var pct = msg_arr[msg_arr.length-1]+"%";
						progress_bar = document.getElementById("progressbar");
						progress_bar.style.width = pct;
						progress_bar.innerHTML = pct;			
					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert('ajax error: ' + textStatus + ': ' + errorThrown);
					}
				});					
			}, 1000);
	  })
  
	  $('#showResults').click(function() {
		  $('#simulation').addClass("hidden")
	  })
  
	  $('[data-toggle="tooltip"]').tooltip();
  
	  $('#max_flowrate, #max_batchsize, #max_steptime, #simulation_nomination_id, #simulation_pipeline_id').on("change", function(){
	      get_step_info(calc_steps);
	  })

      if ($("#form_name").text() == "simulation"){
		  get_step_info();
    	  $('#vol_unit').on('change', event => {
  		  var maxbatchsize = $("#max_batchsize").val();
    	  if ( !(maxbatchsize == "") ) {
    		    alert('Warning: There is a value entered for the max batchsize already on this form.  Changing volume units will require re-entry of this value.');	
    		  }	  
    	  });
    	  $('#flow_unit').on('change', event => {
  		  var maxflowrate = $("#max_flowrate").val();
    	  if ( !(maxflowrate == "") ) {
    		    alert('Warning: There is a value entered for the max flowrate already on this form.  Changing flow rate units will require re-entry of this value.');	
    		  }	  
    	  });
      };
  
  $('#estimate_steps').click(function() {
	  calc_steps();
  });	  

	  
  function calc_steps() {
	  get_step_info();
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
	  var message = "Total nominated volume is "+volume+".  Number of pipeline stations is "+stations+".  Number of batches is "+number_batches+".";
	  if (nsteps > 3000) {
		  message = message+" Warning: The estimated number of steps is over 3000.  Running this simulation will take several minutes to complete.   \
		  You can reduce the number of steps by increasing the maximum step time, increasing maximum flowrate or decreasing the total volume of shipments in the nomination.";
	  };
	  $("#warning_message").text(message);	  
  }
  
  function get_step_info() {
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
		  url: "/pipelines/"+pline+"/stations",
		  dataType: 'json',
		  success: function(data) {
			  var nstations = data.length;
			  $("#number_stations").text(nstations);		
		  }
	  });
  
  }
 
});

  