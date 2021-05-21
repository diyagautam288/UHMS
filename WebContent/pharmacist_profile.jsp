<%-- 
    Document   : pharMain
    Created on : 26 Feb, 2021, 9:27:40 PM
    Author     : user
--%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <% String ID=session.getAttribute("ID").toString();
       String shop_no=(session.getAttribute("shop_no")).toString();
       session.setAttribute("user","PHARMACIST");
       
    %>
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

</head>
<body>

     <!-- MENU BAR -->
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
                        <a href="pharMain.jsp" class="nav-link smoothScroll">Dashboard</a>
                    </li>
                    <li class="nav-item">
                       <% session.setAttribute("ID",ID);
                           session.setAttribute("shop_no", shop_no);%>
                        <a href="inventory.jsp" class="nav-link smoothScroll">Inventory</a>
                    </li>
                    <li class="nav-item">
                            <a href="view_order.jsp" class="nav-link smoothScroll">View order</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link smoothScroll">Bill</a>
                    </li>
                    <li class="nav-item">
                        <a href="pharmacist_profile.jsp" class="nav-link smoothScroll">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

     <!-- BODY -->
    <!--BODY-->
    
    
    <div class="container emp-profile">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
    <%
        session.setAttribute("ID",ID);
                          
             
        
        String name = "";
        Connection con = null;
        String pwd = "";
        String pn = "";
    
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM REG_USER WHERE EMAIL='" + ID + "'");
            if (rs.next()) {
                name = rs.getString(2) + " " + rs.getString(3);
                pn =Long.toString(rs.getLong(7));
            }
    %>
    
                        <div class="profile-head">
                                    <h5>
                                        <% out.print(name);%>
                                    </h5>
                                    
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <p class="nav-link active" id="home-tab" >About</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <input id="editbttn" type="button" class="profile-edit-btn" style="margin-bottom: 5em" name="btnAddMore" value="Change PassWord" onclick="editProfile.html"/>
                        <script>
                           document.getElementById("editbttn").addEventListener("click", myFunction);
                           function myFunction() {
                             window.location.href="editProfile.html";
                           }
                        </script>
                    </div>
                </div>
                    <div style="margin-left: 35%;margin-top: -2em">
                        <div class="col-md-8">
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>User Id</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p><%out.print(ID);%></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Name</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p><% out.print(name);%></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p><%out.print(ID);%></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Phone</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p><%out.print(pn);%></p>
                                                </div>
                                                                                        <%
        }
        catch (Exception e) {
            out.println(e);
        }

    %>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Profession</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p>Pharmacist</p>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </form>
        
                <p>
                    <a href="pharLogin.jsp" class="btn btn-info btn-lg" style="margin-left: 5.5em;margin-top: -5em;">
                    <span class="glyphicon glyphicon-log-out"></span> Log out
                    </a>
                </p> 
        </div>

    
     <!-- TESTIMONIAL -->

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