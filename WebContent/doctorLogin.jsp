<%-- 
    Document   : doctorLogin
    Created on : 2 Apr, 2021, 8:12:20 PM
    Author     : Shaiv
--%>
<%@page import="newpackage.User"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="newpackage.UserDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>University Health Care</title>
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

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/templatemo-digital-trend.css">
     <link rel="stylesheet" type="text/css" href="cssAdminLogin/util.css">
	<link rel="stylesheet" type="text/css" href="cssAdminLogin/main.css">
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
                              <a href="doctorLogin.jsp">As Doctor</a>
                              <a href="patientLogin.jsp">As Patient</a>
                              <a href=pharLogin.jsp>As Pharmacist</a>
                              <a href=lab_Login.jsp>As Lab Specialist</a>
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
    
<!--Form-->
     <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="DocLogin" method="post" >
					<h1 class="login100-form-title ">
						DOCTOR LOGIN
					</h1>
					
                                        <div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="email"  name="email">
						<span class="focus-input100" data-placeholder="Username"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" id="myInput" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
                    <input type="checkbox" onclick="myFunction()"><h7 style="color: #666262"> Show Password</h7>
					<div class="container-login100-form-btn" style="margin-top: 1em">
						<button class="login100-form-btn" type="submit" value="Login"style="margin-bottom:1em">
							Login
						</button>
					</div>

							<a href="forgotPass.jsp" class="txt2">
								Forgot Password?
							</a>
					
					
				</form>
			</div>
		</div>
	</div>
    <!--Footer-->
    
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

	
<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
	<script src="jsAdminLogin/main.js"></script>
</body>
</html>
