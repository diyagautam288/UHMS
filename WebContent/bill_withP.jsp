<%-- 
    Document   : bill_withP
    Created on : 21 Mar, 2021, 10:23:33 AM
    Author     : user
--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>University Healthcare</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        <!--FORM-->

        <%
            String oid = request.getParameter("oid");
            String ID = session.getAttribute("ID").toString();
            String shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("ID", ID);
            session.setAttribute("shop_no", shop_no);
            session.setAttribute("user", "PHARMACIST");

            session.setAttribute("OID", oid);
            // database connection settings

            String pid = "", address = "", pname = "";
            
            Connection con = null;

            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
                ResultSet rs = stat.executeQuery("select PRESC_ID,ADDRESS FROM WITH_PRESC,MED_ORDER where MED_ORDER.ORDER_ID=" + oid + " AND WITH_PRESC.ORDER_ID=" + oid);
                rs.next();
                pid = rs.getString(1);
                session.setAttribute("pid",pid);
                address = rs.getString(2);
                session.setAttribute("address",address);
                Statement stmt = con.createStatement();
                ResultSet r = stmt.executeQuery("select F_name from reg_user,patient where reg_user.EMAIL=patient.EMAIL and patient.PID=(select PID from med_order where ORDER_ID=" + oid + ");");
                r.next();
                pname = r.getString(1);
                session.setAttribute("pname",pname); 


        %>

    <center><h2>BILL GENERATION</h2>
        Search medicine and select it to add to bill. To view final bill detail and change quantity click on "View"
    </center>
    <div class="row">
        <div class="col">
            <br/><br/>
            <center><img src="view_presc.jsp?pid=<%=pid%>" width=" 600px"/></center>
        </div>
        <div class="col">
            <br/><br/>
            <center> 
                <div> 
                    <br/><br/>
                    <h2>Enter Medicine Name</h2> 
                    <input placeholder="Search" 
                           type="text" 
                           id="user_input" size="50%" required/> 

                    <button type="Submit" id="sub"> 
                        Search 
                    </button>
                    <br/><br/><br/>
                </div> 
            </center>
            <div class="box_1" id="msg"> 
                <script type="text/javascript" 
                        src= 
                        "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js">
                </script> 

                <script src="jquery-3.2.1.js"></script> 
                <script>
            $(document).ready(function () {
                $("#sub").click(function () {
                    var fn = $("#user_input").val();
                    $.post("bill_list.jsp", {
                        mname: fn
                    }, function (data) {
                        $("#msg").html(data);
                    });

                });
            });
                </script> 
            </div>
            
            <center>
        <button type="button"><a href="bill_view.jsp">VIEW</a> </button>
        <br/><br/>
    </center>



        </div>

    </div>


    <%
        } catch (Exception e) {
            out.print(e);
        }
    %> 
    <!-- TESTIMONIAL -->
    <%
        //int bno=Integer.parseInt(session.getAttribute("bid").toString());
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat2 = con.createStatement();
                ResultSet rs2 = stat2.executeQuery("SELECT MAX(BILL_NO) FROM MED_BILL");
                rs2.next();
                int bid;
                bid = rs2.getInt(1);

                if (bid >= 10001) {
                    bid= bid + 1;
                } else {
                    bid = 10001;
                }
                session.setAttribute("bid", bid);
                con.close();
                con=null;
                
            } catch (Exception e) {
                out.print(e);
            }
    %>

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
    <script src="js/custom.js"></script>

</body>
</html>   
