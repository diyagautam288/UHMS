/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$('#password, #confirm_password').on('keyup', function () {
//    if ($('#password').val() === $('#confirm_password').val()) {
//        $('#message').html('Matching').css('color', 'green');
//    } else 
//        $('#message').html('Not Matching').css('color', 'red');
//});

var password = document.getElementById("password")
  , confirm_password = document.getElementById("confirm_password");

function validatePassword(){
  if(password.value !== confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

