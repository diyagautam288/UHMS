<%-- 
    Document   : Register
    Created on : 19 Mar, 2021, 8:21:27 PM
    Author     : Shaiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/aos.css">
     <link rel="stylesheet" href="css/owl.carousel.min.css">
     <link rel="stylesheet" href="css/owl.theme.default.min.css">
     <link rel="stylesheet" href="preg/newcss.css">
     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/templatemo-digital-trend.css">
</head>
<body>
<nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.html">
              <i class="fa fa-hospital-o"></i>
             University Health Care
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="index.html" class="nav-link smoothScroll">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="index.html#about" class="nav-link smoothScroll">About Us</a>
                    </li>
                    <li class="nav-item">
                        <div class="login">
                            <button class="loginbtn">Login 
                              <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="login-content">
                              <a href="#">As Doctor</a>
                              <a href="#">As Patient</a>
                              <a href="#">As Pharmacist</a>
                              <a href="#">As Lab Specialist</a>
                              <a href=adminLogin.jsp>As Admin</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="contact.html" class="nav-link contact">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<section class="get-in-touch">
   <h1 class="title">Register Here</h1>
   <form method="POST" action="RegisterServlet" class="contact-form row">
      <div class="form-field col-lg-6">
         <input id="name" class="input-text js-input" name="fname" type="text" required>
         <label class="label" for="name">First Name</label>
      </div>
      <div class="form-field col-lg-6 ">
         <input id="name" class="input-text js-input" name="lname" type="text" required>
         <label class="label" for="name">Last Name</label>
      </div>
      <div class="form-field col-lg-6 ">
         <input id="name" class="input-text js-input" name="scid" type="text" required>
         <label class="label" for="name">Smart Card ID</label>
      </div>
      <div class="form-field col-lg-6 ">
         <input id="myemail" class="input-text js-input" name="email" type="email" pattern=".+@banasthali.in" placeholder="abc@banasthali.in" required>
         <label class="label" for="email">E-mail</label>
      </div>
       <div class="form-field col-lg-6 ">
         <input id="password" class="input-text js-input" name="password" type="password" required>
         <label class="label" for="password">Password</label>
       </div>
       <div class="form-field col-lg-6 ">
          
         <input id="confirm_password" class="input-text js-input" type="password" required>
         
         <label class="label" for="password">Confirm Password</label>
         
       </div><span ></span>
        
       <div class="form-field col-lg-6 ">
          
       <input id="date" class="input-text js-input" name="dob" type="date" required>
       <label class="label" for="dob">Date of Birth</label>
       </div>
             
       <div class="form-field col-lg-6 ">
           
       <select id="gender" name="gender" class="input-text js-input">
    <option value="Female">Female</option>
    <option value="Male">Male</option>
    <option value="Other">Other</option>
  </select>
       
         <label class="label" for="gender">Gender</label>
       </div>
       
       <div class="form-field col-lg-6 ">
           
           <select id="bloodtype" name="bldgrp" class="input-text js-input">
    <option value="A+">A+</option>
    <option value="A-">A-</option>
    <option value="AB+">AB+</option>
    <option value="AB-">AB-</option>
    <option value="B+">B+</option>
    <option value="B-">B-</option>
    <option value="O+">O+</option>
    <option value="O-">O-</option>
  </select>
           <label class="label" for="bldgrp">Blood Group</label>
       </div>
       
       <div class="form-field col-lg-6 ">
          
         <input id="phone" class="input-text js-input" name="phoneno" type="number" required>
         <label class="label" for="phone">Phone number</label>
       </div>
       <div class="form-field col-lg-6 ">
          
         <input id="height" class="input-text js-input" name="height" type="number" required>
         <label class="label" for="height">Height</label>
       </div>
       <div class="form-field col-lg-6 ">
         <input id="weight" class="input-text js-input" name="weight" type="number" required>
         <label class="label" for="phone">Weight</label>
       </div>
      <div class="form-field col-lg-12">
         <input class="submit-btn" type="submit" value="Submit">
      </div>
   </form>
</section>
	<footer class="site-footer">
      <div class="container">
        <div class="row">

          <div class="col-lg-5 mx-lg-auto col-md-8 col-10">
            <h1 class="text-white" data-aos="fade-up" data-aos-delay="100">Your Most Trusted <strong> Health Partner</strong> for Life.</h1>
          </div>
 
          <div class="col-lg-3 col-md-6 col-12" data-aos="fade-up" data-aos-delay="200">
            <h4 class="my-4">Contact Info</h4>

            <p class="mb-1">
              <i class="fa fa-phone mr-2 footer-icon"></i> 
              +99 080 070 4224
            </p>

            <p>
              <a href="#">
                <i class="fa fa-envelope mr-2 footer-icon"></i>
                arogya@banasthali.ac.in
              </a>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 col-12" data-aos="fade-up" data-aos-delay="300">
            <h4 class="my-4">Our Location</h4>

            <p class="mb-1">
              <i class="fa fa-home mr-2 footer-icon"></i> 
              Vanasthali Road, Dist, Vanasthali, Rajasthan 304022
            </p>
          </div>

          <div class="mx-lg-auto text-center col-md-8 col-12 " data-aos="fade-up" data-aos-delay="400">
            <p class="copyright-text">Copyright &copy; 2020 Banasthali Vidyapith
            <br>
            </div>
          <div class="mx-lg-auto text-center col-md-6 col-12" data-aos="fade-up" data-aos-delay="600">
            <ul class="social-icon">
              <li><a href="https://www.instagram.com/banasthali_vidyapith/?hl=en" class="fa fa-instagram"></a></li>
              <li><a href="https://twitter.com/banasthali_vid?lang=en" class="fa fa-twitter"></a></li>
              <li><a href="https://www.facebook.com/banasthali.org/" class="fa fa-facebook"></a></li>
              <li><a href="https://www.linkedin.com/in/banasthali-vidyapith-967816174/?originalSubdomain=in" class="fa fa-linkedin"></a></li>
            </ul>
          </div>

        </div>
      </div>
    </footer>

     <!-- SCRIPTS -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/smoothscroll.js"></script>
     <script src="js/custom.js"></script>
     <script src="patientReg/preg.js"></script>
     <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
     <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script src="preg/reg.js"></script>
    </body>
</html>
