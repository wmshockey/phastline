class ProgressBar {
	constructor(elem, url) {
		this.elem = $(elem);
		this.url = url;
		this.message = this.elem.find('.message');
		this.bar = this.elem.find('.progress-bar');
		$(".panel").removeClass("panel-danger").addClass("panel-success")	
	}
	
	start() {
		var othis = this;
		$("#results").css("visibility", "hidden");
		$.ajax({
			url: this.url,
			dataType: 'json',
			success: function(data) {			
				var percent;
				othis.message.html(data.message);
				percent = data.percent + "%";
				othis.bar.css('width', percent).html(percent);
				if (data.message.substring(0,10) === "Successful") {
					$(".panel").removeClass("panel-danger").addClass("panel-success strong");
					$('.progress').css("visibility", "hidden")
				}
				else if (data.message.substring(0,6) === "Failed") {
					$(".panel").removeClass("panel-success").addClass("panel-danger strong");
					$('.progress').css("visibility", "hidden")
				}
				else if (data.message.substring(0,6) === "Queued") {
					 othis.message.html("Simulation server is not responding.  Please contact support.");
					 $(".panel").removeClass("panel-success").addClass("panel-danger strong");
					 $('.progress').css("visibility", "hidden")
				}
				else {
					setTimeout(othis.start.bind(othis), 1000);
				}
				},
			error: function (jqXHR, exception) {
				othis.message.html("Simulation server unavailable.  Please contact support.");
				$(".panel").removeClass("panel-success").addClass("panel-danger strong")
			}
		})}					
}
