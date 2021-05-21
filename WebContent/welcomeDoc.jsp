<%-- 
    Document   : welcomeDoc
    Created on : 4 Apr, 2021, 11:09:39 AM
    Author     : Shaiv
--%>

<%@page import="newpackage.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% User doc = (User) session.getAttribute("logDoc");
//            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
//            response.setHeader("Pragma","no-cache");
//            response.setHeader("Expires","0");
    if(doc==null){
        response.sendRedirect("doctorLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome user</title>
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
                        <a href="viewAptDoctor.jsp" class="nav-link smoothScroll" style="font-size:15px; padding:6px 16px">View Appointments</a>
                    </li>                     
                      <li class="nav-item">
                        <a href="ansQuerry.jsp" class="nav-link smoothScroll" style="font-size:15px; padding:6px 16px">View Queries</a>
                    </li> 
                    <li class="nav-item"><a href="LogoutServlet" class="nav-link contact">Log Out</a></button></li>
                </ul>
            </div>
        </div>
    </nav>
<h1 class="title">
    
 Welcome, <%= doc.getfName() %> <%= doc.getlName() %></h1>
<h3>
Your Doctor ID: <%= doc.getDocid() %> </h3>
<h3>
Your Email: <%= doc.getEmail() %> </h3>

<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
    </body>
</html>
