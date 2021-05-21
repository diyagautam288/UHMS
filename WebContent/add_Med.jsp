<%-- 
    Document   : inventory
    Created on : 27 Feb, 2021, 7:40:39 PM
    Author     : user
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

     <title>University Healthcare</title>

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
    <% String ID=session.getAttribute("ID").toString();
       String shop_no=session.getAttribute("shop_no").toString();
       // database connection settings
           
            Connection con=null;
            String temp="";
            String MID="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			ResultSet rs = stat.executeQuery("SELECT MED_ID FROM INVENTORY WHERE SHOP_NO="+shop_no+" ORDER BY MED_ID;");
                        if(!rs.next())
                            MID=shop_no.concat("MED1001");
                        else{
                            temp=rs.getString(1);
                            
                            while(rs.next()){
                                temp="";
                                temp=rs.getString(1);
                            }
                            temp=temp.substring(4);
                            
                            int num=Integer.parseInt(temp)+1;
                            temp="M".concat(Integer.toString(num));
                            MID=shop_no.concat(temp);
                        }
                }
                catch(Exception e){
                    out.println(e);
                }
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
                       <% session.setAttribute("ID",ID);
                          session.setAttribute("shop_no",shop_no);%>
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

    


     <!-- FORM -->
     <form style="background-color: #ffffff" method="post" action="add_Med2.jsp">
        <br/><br/>
        <table style="width:100%">
            <style>table, th, td {border:0px solid black; width: 100px; height: 50px;}
            </style>
            <tr align="center">
                <th colspan="3" style="font-size:3vw;">ADD MEDICINE</th>
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
                            <tr  >
                                <td align=center> <label for="shop_no">Shop No:</label></td>
                                <td > <label style="color: #000;"> <% out.print( shop_no);%> </label></td>
                            </tr>
                            <tr>
				<td align=center> <label for="med_id">Medicine ID:</label></td>
                                <td >  <label style="color: #000" > <% out.print(MID);%> </label></td>
                            </tr>
                            <tr align=center>
				<td> <label for="name">Medicine name:</label></td>
                                <td > <input type="text" name="name"  style="width:100%; height:30px;" placeholder="Medicine name" required ></td>
                            </tr>
                            <tr align=center>
				<td> <label for="date">Expiry Date</label></td>
                                <td > <input type="date" id="date" name="date"  style="width:100%; height:30px;" placeholder="Expiry date" required ></td>
                            </tr>
                            
                            <tr align=center>
                                
				<td> <label for="quan">Quantity</label></td>
                                <td >
                                    <input type="number" min="0" name="qty" placeholder="Quantity" required></td>
                            </tr>
                            <tr align=center>
				<td> <label for="rate">Unit price</label></td>
                                <td > <input type="number" min="0" name="price" placeholder="Unit price" required></td>
                            
                            <tr align=center>	
                                <td colspan="2" >
                                    <%session.setAttribute("ID",ID);
                                      session.setAttribute("MID",MID);
                                      session.setAttribute("shop_no",shop_no);%>
                                    <button type="submit" onclick="add_Med2.jsp" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff">Add</button>
                                            <button type="button" style="border-radius: 50px ;border: none ;width: 250px;
                                                    background-color: #0c8195; padding: 12px 28px;color: #ffffff" ><a style="color: #ffffff" href="inventory.jsp"> Back</a></button></td>
                            </tr>
                        </table>
                </td>
                <td></td>
            </tr>
            <tr><td colspan="3"></td></tr>
            
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