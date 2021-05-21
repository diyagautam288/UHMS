<%-- 
    Document   : SubmissionSuceess
    Created on : 4 Apr, 2021, 10:48:45 PM
    Author     : Shaiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="newpackage.User"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello Doctor</title>
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
        <% User doc = (User) session.getAttribute("logDoc");
        int did = doc.getDocid();
        int q=Integer.parseInt(request.getParameter("no")); 
        String ans = request.getParameter("ans");
         
        
            // connects to the database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
        int row=0;
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("select pid from question where qid="+q+"");
            rs.next();
            int pid=rs.getInt("pid");
            
            // constructs SQL statement
            String sql = "INSERT INTO answer (pid, suggestion, doc_id, qid) values (?, ?, ?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, pid);
            statement.setString(2, ans);
            statement.setInt(3, did);
            statement.setInt(4,q);
            row = statement.executeUpdate();
            
 
            // sends the statement to the database server
            
            if (row > 0) {
              //out.println("accepted");
               
            }
            else{
            out.println("not accepted");
            }
            conn.close();
%>
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
        "<script type="text/javascript">
                alert("Respone submitted succesfully");
                </script>
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
     
