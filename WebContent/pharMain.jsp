<%-- 
    Document   : pharMain
    Created on : 26 Feb, 2021, 9:27:40 PM
    Author     : user
--%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <% 
            String ID = session.getAttribute("ID").toString();
            
            int shop_no = 0;
            Connection con = null;
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
                ResultSet rs = stat.executeQuery("SELECT SHOP_NO FROM PHARMACIST where EMAIL='" + ID + "'");
                if (rs.next()) {
                    shop_no = Integer.parseInt(rs.getString(1));
                }
            } catch (Exception e) {
                out.println(e);
            }

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
                            <% 
                                session.setAttribute("user","PHARMACIST");
                                session.setAttribute("ID", ID);
                                session.setAttribute("shop_no", shop_no);
                            %>
                            <a href="inventory.jsp" class="nav-link smoothScroll">Inventory</a>
                        </li>
                        <li class="nav-item">
                            <a href="view_order.jsp" class="nav-link smoothScroll">View order</a>
                        </li>
                        <li class="nav-item">
                        <div class="nav-patient" style="margin-top: 4px;">
                            <button class="nav-patientbtn" style="font-size: 14px;">Bill
                              <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="nav-patient-content">
                                <a href="paid.jsp">Paid</a>
                                <a href="unpaid.jsp">Unpaid</a>
                            </div>
                        </div>
                    </li>
                        <li class="nav-item">
                            <a href="pharmacist_profile.jsp" class="nav-link smoothScroll">Profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- PROJECT -->
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-6" style="height: 100%; margin-top: 8%">
                    <div class="profile-img">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5 style="text-align: center">PHARMACIST</h5>
                    </div><hr>
                    <div>
                        <p>
                            <strong style="color: black">Dashboard:</strong> In this section, pharmacist can view orders, inventory, and bills.
                        </p><br>
                        <p>
                            <strong style="color: black">Order: </strong>In this section, pharmacist can manage orders.
                        </p><br>
                        <p>
                            <strong style="color: black">Inventory: </strong>In this section, pharmacist can manage inventory.
                        </p><br>
                        <p>
                            <strong style="color: black">Bill: </strong>In this section, pharmacist can manage bills.
                        </p><br>

                    </div>
                </div>
            </div>
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