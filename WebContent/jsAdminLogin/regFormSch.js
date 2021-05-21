(function($) {

  $('#reset').on('click', function(){
      $('#register-form').reset();
  });

  $('#register-form').validate({
	  rules : {
	        doc_id: {
	            required: true,
	        },
	        day: {
	            required: true,
	        },
	        time : {
	            required: true
	        },
	        	        
	                               
	    },
	    onfocusout: function(element) {
	        $(element).valid();
	    },
  });
    
});