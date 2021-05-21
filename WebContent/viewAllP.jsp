<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.time.*" %>
<%@ page import=" java.util.*" %>
<%@ page import=" java.util.Date" %>
<%@ page import=" java.text.*" %>
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
        <link rel="stylesheet" href="cssAdminLogin/horOption.css">
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
        <center><h2 style="margin-bottom:20px;">VIEW PATIENT RECORD</h2></center>            
        <div style="overflow-x:auto;overflow-y:auto">
            <%
                try {
                    
                    Connection con = null;
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                    //Class.forName("oracle.jdbc.driver.OracleDriver");
                    //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select PATIENT.PID,PATIENT.BLOOD_GRP,PATIENT.DOB,PATIENT.HEIGHT,PATIENT.WEIGHT,PATIENT.SMARTCARD_ID,REG_USER.EMAIL,REG_USER.PASSWORD,REG_USER.F_NAME,REG_USER.L_NAME,REG_USER.GENDER,REG_USER.PHONE_NO,REG_USER.USER_TYPE,REG_USER.SECRET from PATIENT INNER JOIN REG_USER ON PATIENT.EMAIL=REG_USER.EMAIL");

            %><table border=1 width="90%" align=center style="text-align:center;padding:5%;margin:3%">
                <thead>
                    <tr>
                        <th>PID</th>			          	
                        <th>EMAIL</th>
                        <th>SMARTCARD_ID</th>
                        <th>F_NAME</th>
                        <th>L_NAME</th>		             
                        <th>GENDER</th>
                        <th>BLOOD_GRP</th>
                        <th>DOB</th>
                        <th>AGE</th>
                        <th>HEIGHT</th>
                        <th>WEIGHT</th>			             
                        <th>PHONE_NUMBER</th>
                        <th>USER_TYPE</th>
                        <th>PASSWORD</th>
                        <th>SECRET</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {
                            String s = rs.getString("DOB");
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            Date d = sdf.parse(s.substring(0, 10));
                            Calendar c = Calendar.getInstance();
                            c.setTime(d);
                            int year = c.get(Calendar.YEAR);
                            int month = c.get(Calendar.MONTH) + 1;
                            int date = c.get(Calendar.DATE);
                            LocalDate l1 = LocalDate.of(year, month, date);
                            LocalDate now1 = LocalDate.now();
                            Period diff1 = Period.between(l1, now1);

                            int age = diff1.getYears();
                    %>
                    <tr>
                        <td><%=rs.getString("PID")%></td>
                        <td><%=rs.getString("EMAIL")%></td>
                        <td><%=rs.getString("SMARTCARD_ID")%></td>
                        <td><%=rs.getString("F_NAME")%></td>
                        <td><%=rs.getString("L_NAME")%></td>			                			                
                        <td><%=rs.getString("GENDER")%></td>
                        <td><%=rs.getString("BLOOD_GRP")%></td>
                        <td><%=rs.getString("DOB")%></td>
                        <td><%=age%></td>
                        <td><%=rs.getString("HEIGHT")%></td>
                        <td><%=rs.getString("WEIGHT")%></td>
                        <td><%=rs.getString("PHONE_NO")%></td>
                        <td><%=rs.getString("USER_TYPE")%></td>
                        <td><%=rs.getString("PASSWORD")%></td>
                        <td><%=rs.getString("SECRET")%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table><br>
            <%
                st.close();
                con.close();
                            } catch (Exception e) {
                out.print(e.getMessage());%><br><%
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