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
    </head>
    <body>
        <!-- MENU BAR -->
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


    <!--Forgot-->
    <div id="highlighted" class="hl-basic hidden-xs">
        <div class="container-fluid">
            <div >
                <div>
                    <h1 style="margin:1em; margin-bottom:-0.1em">Forgot Password</h1>
                </div>
            </div>
        </div>
    </div>
    <div id="content" class="interior-page">
        <div class="container-fluid">
            <div >
                <!--Content-->
                <div class="col-sm-9 col-md-9 col-lg-10 content equal-height">
                    <div class="content-area-right">
                        <div class="row">
                            <div class="col-md-5 forgot-form">
                                <p style="margin-left:1.5em">Please enter your email and secret below and we will lead you to your profile.</p> 
                                <!------------>
                                <form name="Secret_form">
                                    <label class="label-default" style="margin-left:1.5em">Your Email</label>
                                    <input  id="email_addy" type="text" autocomplete="off" name="username">
                                    <label class="label-default" style="margin-left:1.5em">Your Secret</label>
                                    <input  id="email_addy" type="text" autocomplete="off" name="sec">
                                    <div>
                                        <button class="btn btn-primary" onclick=" checkSec(this.form)" value="Secret">
                                            That's My Secret
                                        </button>
                                    </div>
                                </form>
                                <!---------->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--footer-->
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

    <% Connection con=null;
            String secret="";
            try{
                       
                        //Connection con = null;
                        Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                
                    Statement stat = con.createStatement();
                    ResultSet rs = stat.executeQuery("SELECT SECRET FROM REG_USER where EMAIL='admin@banasthali.in'");
                     while(rs.next()){
                      secret=rs.getString(1);
                   } 
                     con.close(); 
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
    %>
    <script type="text/javascript">
        var secret = "<%=secret%>"
        function checkSec(form) {/*function to check userid & password*/  /*the following code checkes whether the entered userid and password are matching*/
            if (form.username.value == "admin@banasthali.in" && form.sec.value == secret) {
                window.open('editProfile.html')/*opens the target page while Id & password matches*/
            } else {
                alert("Error Secret")/*displays error message*/
            }
        }
    </script>
    <!-- SCRIPTS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/custom.js"></script><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src=jsAdminLogin/main.js></script>

</body>
</html>