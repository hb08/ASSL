$(document).ready(function(){
 
 // Change panel width  
  $("#switchSize").click(function(e){
  	e.preventDefault();
  	// Toggle Full Class
  	$('#overlay').toggleClass('full');
  	// If this is full sized
  	if($('#overlay').hasClass('full')){
  		$message = 'Small';	
  	}else{
  		$message = 'Large';
  	}
  	$('#switchSize').html($message);
  });  
}); // End jQuery