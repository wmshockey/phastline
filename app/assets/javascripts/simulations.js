// simulations Javascript file


$(document).ready(() => {
	
  $('.copyright').on('mouseenter', event => {
    $(event.currentTarget).css({color: 'red'})
  });
	
  $('.copyright').on('mouseleave', event => {
  	$(event.currentTarget).css({color: 'black'})
  });

  $('li').on('mouseenter', event => {
	  $(event.currentTarget).css({fontWeight: 'bolder'})
	 
  });
	
  $('li').on('mouseleave', event => {
	  $(event.currentTarget).css({fontWeight: ''})
 
  })
  
}); 
