<%-- 
    Document   : seggestion
    Created on : 5 Apr, 2021, 9:57:46 PM
    Author     : Shaiv
--%>

<%@page import="java.sql.*"%>
<%@page import="newpackage.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("patientLogin.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor suggested</title>
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
     <script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='del.jsp?id='+id;
    f.submit();
}
function viewImg(id){
    var f=document.form;
    f.method="post";
    f.action='viewImg.jsp?id='+id;
    f.submit();
}
</script>
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
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
   Blob image = null;
   byte[ ] imgData = null ;
   Statement st=con.createStatement();
   int pid=user.getPid();
   ResultSet rs=st.executeQuery("SELECT q.qid,q.pid,a.suggestion,q.querry,q.image,a.doc_id FROM uhms.question q left join uhms.answer a on a.qid=q.qid and q.pid="+pid+"");
 %>    

<center><h1>Suggestionss</h1>
    <h3>
        <form method="post" name="form">
            <table border="1">
               <tr>
                   <th width="30%"><center>Your Querry</center></th>
            <th><center>Doctor ID</center></th>
<th width="30%"><center>Suggestion</center></th>
<th><center>Image</center></th>

<th><center>Action</center></th>
               </tr>
                <% while(rs.next()) { %>
                <tr>
                    <td><%=rs.getString("querry") %></td>
                    <td type="number" name="did"><%int did=rs.getInt("doc_id");%><%=did%></td>
                    <td><%=rs.getString("suggestion") %></td>
                    <td><% image=rs.getBlob("image");
                        if(image==null){out.print("<h3>No Image Available</h3>");}
                        else{ int no=rs.getInt("qid");
//                        byte[] imageBytes=image.getBytes(1, (int)image.length());
//                        String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
//                        String image1="data:image/jpg;base64,"+encodedImage;
//                        out.print("<img src="+image1+" height=190px width=180px>");}
                        out.print("<a href=\"#\"class=\"link\" onclick=\"viewImg("+no+");\">View Image</a>"); } %>
                    </td>
                    
                    <td><a name="name" href="#"class="link" onclick="editRecord(<%=rs.getInt("qid")%>);">Delete</a></td>
                </tr>
                 <% }%>
            </table>
        </form>
    </h3>
    </center>
<h1 class="title">
    
 Welcome, <%= user.getfName() %> <%= user.getlName() %></h1>
<h3>
Your Patient ID: <%= user.getPid() %> </h3>
<h3>
Your Email: <%= user.getEmail() %> </h3>

<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
    </body>
</html>


