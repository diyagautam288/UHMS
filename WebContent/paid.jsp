<%-- 
    Document   : deleteM_search
    Created on : 5 Mar, 2021, 4:44:13 PM
    Author     : user
--%>
<%@page import="newpackage.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
            User u = (User) session.getAttribute("logUser");
            String user="",ID="";
            if(u==null){
                ID = session.getAttribute("ID").toString();
                user=session.getAttribute("user").toString();
            }
            else{
                ID=Integer.toString(u.getPid()); 
                user=(u.getutype()).toString();
                 
            }
            session.setAttribute("ID", ID);
            session.setAttribute("user", user);
            session.setAttribute("type","PAID");
            
            String pname="";
            Connection con=null; 
            ResultSet rs=null,r=null ;
            
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="cssAdminLogin/main.css">


    </head>
    <body>
        <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #ddd;}
        </style>
    <%
        if(user.equals("PATIENT")){
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
      <!--BODY -->
    </br></br><Center><h2>
          PAID BILLS 
        </h2></center> </br></br>
        <%  
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
                        Statement stat2 = con.createStatement();
                        r= stat2.executeQuery("SELECT F_NAME FROM REG_USER WHERE EMAIL=(SELECT EMAIL FROM PATIENT WHERE PID="+ID+")");
                        r.next();
                        pname=r.getString(1);
                        rs= stat.executeQuery("SELECT * FROM MED_BILL WHERE PNAME='"+pname+"' AND STATUS IN('PAID','DELIVERED') ORDER BY DATE DESC");
                        
                        if(!rs.next()){
    %>
                            <center> 
                                <h3>    <strong>No bill found.</strong></h3><br/>
                                <strong style="color:black;">Click <a href="welcome.jsp">here </a> to go to main page.</strong><br/>
                            </center>
                            <br/><br/><br/>
    
                       <% }
                        else{
                            rs.previous();
                        %>
                      
<%--form style="background-color: #ffffff" method="post" action="#"--%>
        <table style="width:100%">
            <style>table, th, td {border:1px solid black; width: 100px; height: 25px;}
            </style>
            <tr>
                <td></td>
                <td  style="background-color: #ffffff"> 
                    <table style="width:100%" id="table">
                            <style>
                            table, th, td {width: "50%"; border: 1px #000}
                            th, td {padding: 5px;}
                              
                            </style>
                            <tr  >
                                <th style="text-align:center"><strong >BILL NO</strong></th>
                                <th style="text-align:center"><strong>SHOP NO</strong></th>
                                <th style="text-align:center"><strong>ORDER ID</strong></th>
                                <th style="text-align:center"><strong>BILL DATE</strong></th>
                                <th style="text-align:center"><strong>DELIVERY ADDRESS</strong></th>
                                <th style="text-align:center"><strong>TOTAL AMOUNT</strong></th>
                                <th style="text-align:center"><strong>STATUS</strong></th>
                                
                                <%--td> <input type="text" id="hello" style=" border: 0px" readonly <%out.print("heloo"); %>></td--%>
                              </tr>
                              
                       <%   while(rs.next()){
                            String a, b, c, d, e,f,g;
                                a = rs.getString(1);
                                b = rs.getString(2);
                                c = rs.getString(3);
                                d = rs.getString(4);
                                e = rs.getString(5);
                                f = rs.getString(6);
                                g = rs.getString(7);
                                
       %>
                           
       <tr align="center" style="color: #000" >
                                <td align="center"><% out.print(a); %> </td>
                                <td align="center"><% out.print(b); %></td>
                                <td align="center"><% out.print(c); %></td>
                                <td align="center"><% out.print(d); %></td>
                                <td align="center"><% out.print(e); %></td>
                                <td align="center"><% out.print(f); %></td>
                                <td align="center"><% out.print(g); %></td>
                                
                            </tr>
                            <% 
                                }
                            %>
                 
                        </table>
                </td>
                <td></td>
            </tr>
            
            
    </table>
                            <br/><br/>
            
               
<%--/form--%>
              <script>
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         
                               var outString = "bill_detail.jsp?bid="+ this.cells[0].innerHTML;
                                location.href = outString
                            
                        
                    };
                }  
                      
            
         </script>
                           
     
         <%
                        }
                        con.close(); 
                        
		}
		catch(Exception e)
		{
			out.println(e);
		} 

}else{
String shop_no=session.getAttribute("shop_no").toString();
session.setAttribute("shop_no",shop_no);
%>
    <!-- MENU BAR FOR PHARMACIST -->
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
                                shop_no=session.getAttribute("shop_no").toString();
                                ID=session.getAttribute("ID").toString();
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
                            
   <!--BODY -->
    </br></br><Center><h2>
          PAID BILLS 
        </h2></center> </br></br>
        <%  
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
                        Statement stat2 = con.createStatement();
                        rs= stat.executeQuery("SELECT * FROM MED_BILL WHERE SHOP_NO="+shop_no+" AND STATUS IN('PAID','DELIVERED') ORDER BY DATE DESC");
                        
                        if(!rs.next()){
    %>
                            <center> 
                                <h3>    <strong>No bill found.</strong></h3><br/>
                                <strong style="color:black;">Click <a href="patient_Main.jsp">here </a> to go to main page.</strong><br/>
                            </center>
                            <br/><br/><br/>
    
                       <% }
                        else{
                            rs.previous();
                        %>
                      
<%--form style="background-color: #ffffff" method="post" action="#"--%>
        <table style="width:100%">
            <style>table, th, td {border:1px solid black; width: 100px; height: 25px;}
            </style>
            <tr>
                <td></td>
                <td  style="background-color: #ffffff"> 
                    <table style="width:100%" id="table">
                            <style>
                            table, th, td {width: "50%"; border: 1px #000}
                            th, td {padding: 5px;}
                              
                            </style>
                            <tr  >
                                <th style="text-align:center"><strong >BILL NO</strong></th>
                                <th style="text-align:center"><strong>PATIENT NAME</strong></th>
                                <th style="text-align:center"><strong>ORDER ID</strong></th>
                                <th style="text-align:center"><strong>BILL DATE</strong></th>
                                <th style="text-align:center"><strong>DELIVERY ADDRESS</strong></th>
                                <th style="text-align:center"><strong>TOTAL AMOUNT</strong></th>
                                <th style="text-align:center"><strong>STATUS</strong></th>
                                
                                <%--td> <input type="text" id="hello" style=" border: 0px" readonly <%out.print("heloo"); %>></td--%>
                              </tr>
                              
                       <%   while(rs.next()){
                            String a, b, c, d, e,f,g;
                                a = rs.getString(1);
                                b = rs.getString(8);
                                c = rs.getString(3);
                                d = rs.getString(4);
                                e = rs.getString(5);
                                f = rs.getString(6);
                                g = rs.getString(7);
                           
       %>
                           
       <tr align="center" style="color: #000" >
                                <td align="center"><% out.print(a); %> </td>
                                <td align="center"><% out.print(b); %></td>
                                <td align="center"><% out.print(c); %></td>
                                <td align="center"><% out.print(d); %></td>
                                <td align="center"><% out.print(e); %></td>
                                <td align="center"><% out.print(f); %></td>
                                <td align="center"><% out.print(g); %></td>
                                
                            </tr>
                            <% 
                                }
                            %>
                            <tr>
                                <td align="center" colspan="7">
                                    
                                    <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="pharMain.jsp">Back</a></button>
                                
                                </td>
                            </tr>
                 
                        </table>
                </td>
                <td></td>
            </tr>
            
            
    </table>
                            <br/><br/>
            
               
<%--/form--%>
              <script>
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         
                               var outString = "bill_detail.jsp?bid="+ this.cells[0].innerHTML;
                                location.href = outString
                            
                        
                    };
                }  
                      
            
         </script>
                           
     
         <%
                        }
                        con.close(); 
                        
		}
		catch(Exception e)
		{
			out.println(e);
		} 

    }
%>
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
