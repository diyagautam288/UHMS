
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
    String bid = request.getParameter("bid");
    String ID = session.getAttribute("ID").toString();
    session.setAttribute("ID", ID);
    session.setAttribute("bid", bid);
    String user = session.getAttribute("user").toString();
    session.setAttribute("user", user);

    String type = session.getAttribute("type").toString();
    // database connection settings
    String mid = "", mname = "", price = "";
    String qty = "", address = "", shop_no = "";
    int total = 0;
    Connection con = null;

%>


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

        <%    if (user.equals("PATIENT")) {
                try {
                	Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                    Statement stat = con.createStatement();
                    ResultSet rs = stat.executeQuery("select * from detail where BILL_NO=" + bid);

        %> 

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
                        <a href="index.html" class="nav-link smoothScroll" style="font-size:15px; padding:6px 16px">Home</a>
                    </li>
                    
                    <li class="nav-item">
                        <div class="login">
                            <button class="loginbtn">Medical Record
                              <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="login-content">
                              <a href="#">Prescriptions</a>
                              <a href="viewAptPatient.jsp">Appointments</a>
                              <a href="#">Test Report</a>
                              <a href="suggestion.jsp">Suggestion</a>
                            </div>
                        </div>
                        
                    <li class="nav-item">
                        <div class="login">
                            <button class="loginbtn">Need Doctor
                              <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="login-content">
                              <a href="bookAppointment.jsp">Book Appointment</a>
                              <a href="askQuerry.jsp">Get Suggestion</a>
                            </div>
                        </div>
                       
                    </li>
                    <li class="nav-item">
                        <a href="order_history.jsp" class="nav-link smoothScroll">Order History</a>
                    </li>
                    
                    <li class="nav-item">
                        <div class="nav-patient" style="margin-top: 4px;">
                            <button class="nav-patientbtn" style="font-size: 14px;">Order Medicine
                              <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="nav-patient-content">
                                <a href="order_withPresc.jsp">With prescription</a>
                                <a href="order_NoPresc.jsp">Without prescription</a>
                            </div>
                        </div>
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
                    
                    
                    
                    
                    <li class="nav-item"><a href="LogoutServlet" class="nav-link contact">Log Out</a></button></li>
                </ul>
            </div>
        </div>
    </nav>
        <!--FORM-->
        <form style="background-color: #ffffff" method="post" action="pay_bill2.jsp">
            <br/><br/>
            <table style="width:100%">
                <style>table, th, td {border:0px solid black; width: 100px; height: 50px;}
                </style>
                <tr align="center">
                    <th colspan="3" style="font-size:3vw;">BILL DETAIL</th>
                </tr>
                <tr>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td></td>
                    <td  style="background-color: #E6E6FA"> 
                        <table style="width:100%">
                            <style>
                                table, th, td {width: "50%";}
                                input {  width: 100%;  height: 100%;}

                            </style>

                            <%                                rs.next();
                                mid = rs.getString(3);
                                qty = rs.getString(4);

                                shop_no = rs.getString(2);
                                rs.previous();

                            %>    


                            <tr  >
                                <td align=center>Bill No:</td>
                                <td > <input type="text" name="bid" readonly style="width:100%; height:30px;" value=" <% out.print(bid);%>" > </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align=center>Shop No:</td>
                                <td ><input type="text" readonly name="shop_no" style="width:100%; height:30px;" value=" <% out.print(shop_no);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: center"><strong>MEDICINE NAME</strong></td>
                                <td><strong>QUANTITY</strong></td>
                                <td><strong>PRICE</strong></td>
                            </tr>
                            <%
                                while (rs.next()) {
                                    mid = rs.getString(3);
                                    qty = rs.getString(4);
                                    price = rs.getString(5);
                                    total = total + Integer.parseInt(price);
                                    Statement stat2 = con.createStatement();
                                    ResultSet rs2 = stat2.executeQuery("SELECT MED_NAME FROM INVENTORY WHERE MED_ID='" + mid + "'");
                                    rs2.next();
                                    mname = rs2.getString(1);

                            %>
                            <tr>
                                <td style="text-align: center; background-color: #ffffff"><%out.print(mname);%></td>
                                <td style=" background-color: #ffffff"><%out.print(qty);%></td>
                                <td style=" background-color: #ffffff"><%out.print(price);%></td>

                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td align=center>Total amount:</td>
                                <td ><input type="text" readonly name="total" style="width:100%; height:30px;" value=" <% out.print(total);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr align=center>	
                                <td colspan="3" >
                                    <%
                                        if (type.equals("UNPAID")) {
                                    %>
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="unpaid.jsp">Back</a></button>

                                    <button type="submit" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" >Pay</a></button>
                                    <%
                                    } else {  %>
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="paid.jsp">Back</a></button>

                                    <%    }
                                    %>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                    <%
                        } catch (Exception e) {
                            out.print(e);
                        }

                    %>
            </table>
        </form>
        <%} else {

            shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("shop_no", shop_no);
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
                ResultSet rs = stat.executeQuery("select * from detail where BILL_NO=" + bid);

        %>

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
                            <%                                session.setAttribute("user", "PHARMACIST");
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

        <!--FORM-->
        <form style="background-color: #ffffff" method="post" action="deliver">
            <br/><br/>
            <table style="width:100%">
                <style>table, th, td {border:0px solid black; width: 100px; height: 50px;}
                </style>
                <tr align="center">
                    <th colspan="3" style="font-size:3vw;">BILL DETAIL</th>
                </tr>
                <tr>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td></td>
                    <td  style="background-color: #E6E6FA"> 
                        <table style="width:100%">
                            <style>
                                table, th, td {width: "50%";}
                                input {  width: 100%;  height: 100%;}

                            </style>

                            <%
                                rs.next();
                                mid = rs.getString(3);
                                qty = rs.getString(4);

                                shop_no = rs.getString(2);
                                rs.previous();

                            %>    


                            <tr  >
                                <td align=center>Bill No:</td>
                                <td > <input type="text" name="bid" readonly style="width:100%; height:30px;" value=" <% out.print(bid);%>" > </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align=center>Shop No:</td>
                                <td ><input type="text" readonly name="shop_no" style="width:100%; height:30px;" value=" <% out.print(shop_no);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: center"><strong>MEDICINE NAME</strong></td>
                                <td><strong>QUANTITY</strong></td>
                                <td><strong>PRICE</strong></td>
                            </tr>
                            <%
                                while (rs.next()) {
                                    mid = rs.getString(3);
                                    qty = rs.getString(4);
                                    price = rs.getString(5);
                                    total = total + Integer.parseInt(price);
                                    Statement stat2 = con.createStatement();
                                    ResultSet rs2 = stat2.executeQuery("SELECT MED_NAME FROM INVENTORY WHERE MED_ID='" + mid + "'");
                                    rs2.next();
                                    mname = rs2.getString(1);

                            %>
                            <tr>
                                <td style="text-align: center; background-color: #ffffff"><%out.print(mname);%></td>
                                <td style=" background-color: #ffffff"><%out.print(qty);%></td>
                                <td style=" background-color: #ffffff"><%out.print(price);%></td>

                            </tr>
                            <%
                                }
                                String x="";
                                Statement stat2 = con.createStatement();
                                    ResultSet rs2 = stat2.executeQuery("SELECT STATUS FROM MED_BILL WHERE BILL_NO="+bid);
                                    rs2.next();
                                    x = rs2.getString(1);

                            %>
                            <tr>
                                <td align=center>Total amount:</td>
                                <td ><input type="text" readonly name="total" style="width:100%; height:30px;" value=" <% out.print(total);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr align=center>	
                                <td colspan="3" >
                                    <%
                                        if (type.equals("PAID")) {
                                    %>
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="paid.jsp">Back</a></button>
                                            <%if(!x.equals("DELIVERED")){%>
                                    <button type="submit" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" >Deliver</a></button>
                                    <%
                                        }
                                    } else {  %>
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="unpaid.jsp">Back</a></button>

                                    <%    }
                                    %>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                    <%
                        } catch (Exception e) {
                            out.print(e);
                        }


                    %>
            </table>
        </form>

        <%    }
        %>

        <!-- TESTIMONIAL -->
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
        <script src="js/custom.js"></script>

    </body>
</html>   
