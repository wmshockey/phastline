class ProgressBar {
	constructor(elem, url) {
		this.elem = $(elem);
		this.url = url;
		this.message = this.elem.find('.message');
		this.bar = this.elem.find('.progress-bar');
	}
	
	start() {
		var othis = this;
		$.ajax({
			url: this.url,
			dataType: 'json',
			success: function(data) {			
				var percent;
				othis.message.html(data.message);
				percent = data.percent + "%";
				othis.bar.css('width', percent).html(percent);
				if (!((data.message.substring(0, 10) === "Successful") || 
					  (data.message.substring(0, 6) === "Failed"))) {
				              setTimeout(othis.start.bind(othis), 1000);
						  	 }
							 else { $('.progress').css("visibility", "hidden");}	
				}
			})
		}			
}

			
			