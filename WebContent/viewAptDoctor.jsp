<%-- 
    Document   : viewAptDoctor
    Created on : 8 Apr, 2021, 7:36:32 PM
    Author     : Shaiv
--%>

<%@page import="newpackage.User"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% User doc = (User) session.getAttribute("logDoc");
    if(doc==null){
        response.sendRedirect("doctorLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Appointments</title>
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
     <link rel="stylesheet" href="tableStyle/table.css">
     
    </head>
        <body>
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
                        <a href="index.html" class="nav-link smoothScroll" style="font-size:20px; padding:6px 16px">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="index.html" class="nav-link smoothScroll" style="font-size:20px; padding:6px 16px">View Appointments</a>
                    </li>                     
                      <li class="nav-item">
                        <a href="ansQuerry.jsp" class="nav-link smoothScroll" style="font-size:20px; padding:6px 16px">View Queries</a>
                    </li> 
                    <li class="nav-item"><a href="LogoutServlet" class="nav-link contact">Log Out</a></button></li>
                </ul>
            </div>
        </div>
    </nav>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
  int did=doc.getDocid();
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("SELECT * from appointment where doc_id="+did+"");
 %>    

        <center><h1 class="title">Appointments</h1>
    <h3>
        <form method="post" name="form">
            <table border="1">
               <tr>
                   <th><center>Appointment Number</center></th>
                    <th><center>Patient ID</center></th>
                    <th><center>Appointment Date</center></th>
               </tr>
                <% while(rs.next()) { %>
                <tr>
                    <td type="number" name="aptnm"><%=rs.getInt("apt_num")%></td>
                    <td type="number" name="pid"><%=rs.getInt("pid")%></td>
                    <td><%=rs.getString("apt_date")%></td>
                 </tr>
                 <% }%>
            </table>
        </form>
    </h3>
    </center>
<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
