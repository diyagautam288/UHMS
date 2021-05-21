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
        <link rel="stylesheet" href="cssAdminLogin/main.css">
        <link rel="stylesheet" href="cssAdminLogin/manage.css">
        <link rel="stylesheet" href="cssAdminLogin/addtxt.css">
        <style>
            .Input{
                border:1px solid #057a8d;
                padding:5px;
                margin-left:-50%;
                margin-top:-5px;
            }
            .Input:hover{
                border:1px solid #171819;
            }
        </style>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">
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
                        <a href="adminMain.html" class="nav-link smoothScroll">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="department.jsp" class="nav-link smoothScroll">Department</a>
                    </li>
                    <li class="nav-item">
                        <div class="nav-patient" style="margin-top: 4px;">
                            <button class="nav-patientbtn" style="font-size: 14px;">Doctor
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="nav-patient-content">
                                <a href="doctorM.jsp">Manage Doctor</a>
                                <a href="scheduleM.jsp">Manage Schedule</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-patient" style="margin-top: 4px;">
                            <button class="nav-patientbtn" style="font-size: 14px;">Other Employees
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="nav-patient-content">
                                <a href="pharmacistM.jsp">Pharmacist</a>
                                <a href="LabM.jsp">Lab Specialist</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="PatientM.jsp" class="nav-link smoothScroll">Patient</a>
                    </li>
                    <li class="nav-item">
                        <a href="appoint.jsp" class="nav-link smoothScroll">Appointment</a>
                    </li>
                    <li class="nav-item">
                        <a href="adminProfile.html" class="nav-link smoothScroll">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container emp-profile">
        <center><h2 style="margin-bottom:20px;">UPDATE PHARMACIST</h2></center>
        <div>
            <%
                String id = request.getParameter("email");
                PreparedStatement ps = null;
                ResultSet resultSet = null;
            %>
            <%
                try {
                    
                    Connection con = null;
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                    //Class.forName("oracle.jdbc.driver.OracleDriver");
                    //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                    String sql = "select EMAIL,PHONE_NO,SECRET from REG_USER where EMAIL= ?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, id);
                    resultSet = ps.executeQuery();
                    while (resultSet.next()) {
            %>
            <form method="POST" action="updatePharma3.jsp">												
                <h3>EMAIL: <input readonly name="email" value="<%=resultSet.getString("EMAIL")%>"></h3>						
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6" style="margin-bottom:20px;">
                                PHONE NUMBER:
                            </div>
                            <div class="col-md-4" style="margin-bottom:20px;">
                                <input class="Input" type="text" name="phone_number" value="<%=resultSet.getString("PHONE_NO")%>">
                                <br></div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6" style="margin-bottom:20px;">
                                SECRET:
                            </div>
                            <div class="col-md-6" style="margin-bottom:20px;">
                                <input class="Input" type="text" name="secret" value="<%=resultSet.getString("SECRET")%>">
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <input class="empMbutton" type="submit" value="SUBMIT" style="width:20%;">
                </center>
            </form>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>		
        </div>           	 		
    </div>
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

</body>
</html>