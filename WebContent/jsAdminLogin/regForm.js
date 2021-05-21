(function($) {

  $('#reset').on('click', function(){
      $('#register-form').reset();
  });

  $('#register-form').validate({
	  rules : {
	        first_name : {
	            required: true,
	        },
	        last_name : {
	            required: true,
	        },
	        Gender : {
	            required: true
	        },
	        email : {
	            required: true,
	            email : true
	        },
	        phone_number : {
	            required: true,
	        },
	        user_type:{
	            required: true,
	        },
	        dept_id:{
	            required: true,
	        },
	        fees:{
	            required: true,
	        },
	        password:{
	            required: true,
	            password: true,
	                               }
	    },
	    onfocusout: function(element) {
	        $(element).valid();
	    },
  });
    
});