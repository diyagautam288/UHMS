
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

        <%
            String oid = request.getParameter("oid");
            String ID = session.getAttribute("ID").toString();
            String shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("ID",ID);
            session.setAttribute("shop_no",shop_no);
            session.setAttribute("oid",oid);
            session.setAttribute("user","PHARMACIST");
            String status="";
            // database connection settings
            String mid = "", mname = "";
            String qty = "", address = "";
            
            Connection con = null;

            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
                ResultSet rs = stat.executeQuery("select without_presc.MED_ID, without_presc.QTY, med_order.ADDRESS,med_order.STATUS from without_presc,med_order where med_order.ORDER_ID=" + oid + " and without_presc.ORDER_ID=" + oid);

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
        <form style="background-color: #ffffff" method="post" action="order_Details">
            <br/><br/>
            <table style="width:100%">
                <style>table, th, td {border:0px solid black; width: 100px; height: 50px;}
                </style>
                <tr align="center">
                    <th colspan="3" style="font-size:3vw;">ORDER DETAIL</th>
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
                                mid = rs.getString(1);
                                qty = rs.getString(2);
                                address = rs.getString(3);
                                status=rs.getString(4);
                                rs.previous();

                            %>    


                            <tr  >
                                <td align=center>Order ID:</td>
                                <td > <input type="text" name="oid" readonly style="width:100%; height:30px;" value=" <% out.print(oid);%>" > </td>

                            </tr>
                            <tr>
                                <td align=center>Address:</td>
                                <td ><input type="text" readonly name="address" style="width:100%; height:30px;" value=" <% out.print(address);%>" >  </td>

                            </tr>
                            <tr>
                                <td style="text-align: center"><strong>MEDICINE NAME</strong></td>
                                <td><strong>QUANTITY</strong></td>

                            </tr>
                            <%
                                while (rs.next()) {
                                    mid = rs.getString(1);
                                    qty = rs.getString(2);
                                    Statement stat2 = con.createStatement();
                                    ResultSet rs2 = stat2.executeQuery("SELECT MED_NAME FROM INVENTORY WHERE MED_ID='" + mid + "'");
                                    rs2.next();
                                    mname = rs2.getString(1);

                            %>
                            <tr>
                                <td style="text-align: center; background-color: #ffffff"><%out.print(mname);%></td>
                                <td style=" background-color: #ffffff"><%out.print(qty);%></td>

                            </tr>
                            <%
                                }
                            %>

                            <tr align=center>	
                                <td colspan="2" >
                                    <%
                                        if(status.equals("UNSEEN")){
                                    %>
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="order_status?status=ACCEPTED">Accept</a></button>
                                    <button type="button" style="border-radius: 50px ;border: none ;width: 250px;
                                            background-color: #0c8195; padding: 12px 28px;color: #ffffff" ><a style="color: #ffffff" href="order_status?status=REJECTED">Reject</a></button></td>
                                    <%
                                        }else{
                                            
                                    %>
                                 <button type="button" style="border-radius: 50px ;border: none ;width: 250px;
                                            background-color: #0c8195; padding: 12px 28px;color: #ffffff" ><a style="color: #ffffff" href="view_order.jsp">Okay</a></button></td>
                                   
                                <%
                                    }
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
