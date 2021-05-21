
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
        String mid = request.getParameter("mid");
       // String mname = request.getParameter("mname");
       // String qty = request.getParameter("qty");
       // String date = request.getParameter("date");
       // String price = request.getParameter("price");
        String ID = session.getAttribute("ID").toString() ;
        String shop_no = session.getAttribute("shop_no").toString();
        // database connection settings
        String mname="",date="";
        String price="",qty=""; 
            
            Connection con=null;
            
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			ResultSet rs= stat.executeQuery("SELECT * FROM INVENTORY WHERE MED_ID='"+mid+"'");
                        session.setAttribute("ID",ID);
                        session.setAttribute("shop_no",shop_no);
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
                       session.setAttribute("user","PHARMACIST");
       
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
                        
<!--FORM-->
<form style="background-color: #ffffff" method="post" action="update_Med">
        <br/><br/>
        <table style="width:100%">
            <style>table, th, td {border:0px solid black; width: 100px; height: 50px;}
            </style>
            <tr align="center">
                <th colspan="3" style="font-size:3vw;">UPDATE MEDICINE DETAIL</th>
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
                            
                            <%   while(rs.next()){
                             mname=rs.getString(3);
                             date=(rs.getDate(4)).toString();
                             price =Integer.toString(rs.getInt(5));
                             qty=Integer.toString(rs.getInt(6));
                        %>    
                   
                            
                            <tr  >
                                <td align=center>Shop No:</td>
                                <td > <input type="text" name="shop_no" readonly style="width:100%; height:30px;" value=" <% out.print( shop_no);%>" > </td>
                                <td></td>
                            </tr>
                            <tr>
				<td align=center>Medicine ID:</td>
                                <td ><input type="text" readonly name="mid" style="width:100%; height:30px;" value=" <% out.print( mid);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr align=center>
				<td> Medicine name:</td>
                                <td ><input type="text" name="mname" readonly style="width:100%; height:30px;" value="<% out.print( mname);%>" >  </td>
                                <td></td>
                            </tr>
                            <tr align=center>
				<td>Expiry Date:</td>
                                <td ><input type="date" id="date" name="date" style="width:100%; height:30px;" value="<% out.print( date.toString());%>" required> </td>
                                <td>    
                                    <button type="button" onclick="document.getElementById('date').value ='dd-mm-yyyy'">Edit</button>
                                </td>
                            </tr>
                            
                            <tr align=center>
                                
				<td> Quantity</td>
                                <td ><input type="number" name="qty" min="0" id="qty" style="width:100%; height:30px;" value="<%out.print(qty);%>" required >
                                </td>
                                <td>   
                                    <button type="button" onclick="document.getElementById('qty').value =''">Edit</button>
                                </td>
                               
                            </tr>
                            <tr align=center>
				<td>Unit price</td>
                                <td ><input type="number" name="price" min="0" id="price" style="width:100%; height:30px;" value="<% out.print(price);%>" required >  </td>
                                <td>    <button type="button" onclick="document.getElementById('price').value=''">Edit</button>
                                </td>
                            </tr>
                            <tr align=center>	
                                <td colspan="3" >
                                    <%session.setAttribute("ID",ID);
                                     
                                      session.setAttribute("shop_no",shop_no);%>
                                    <button type="submit" onclick="#" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff">Update</button>
                                            <button type="button" style="border-radius: 50px ;border: none ;width: 250px;
                                                    background-color: #0c8195; padding: 12px 28px;color: #ffffff" ><a style="color: #ffffff" href="inventory.jsp"> Back</a></button></td>
                            </tr>
                        </table>
                </td>
                <td></td>
            </tr>
            <tr><td colspan="3"></td></tr>
            <%     }
                }
                catch(Exception e){
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