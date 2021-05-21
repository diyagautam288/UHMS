<%-- 
    Document   : ansQuerry
    Created on : 4 Apr, 2021, 2:02:42 PM
    Author     : Shaiv
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.lang.System.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.User"%>
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
     <link rel="stylesheet" href="tableStyle/table.css">
     
     <script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='sub.jsp?id='+id;
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
                        <a href="index.html" class="nav-link smoothScroll" style="font-size:20px; padding:6px 16px">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="viewAptDoctor.jsp" class="nav-link smoothScroll" style="font-size:20px; padding:6px 16px">View Appointments</a>
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
   Blob image = null;
   byte[ ] imgData = null ;
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from question where date > current_date()-interval 5 day ");
   
 %>    

<center><h1>Questions</h1>
    <h3>
        <form method="post" name="form">
            <table border="1">
               <tr>
                   <th><center>QID</center></th>
            <th><center>PID</center></th>
<th><center>Querry</center></th>
<th><center>Image</center></th>
<th><center>Action</center></th>
               </tr>
                <% while(rs.next()) { %>
                <tr>
                    <td type="number" name="qid" ><%int qid=rs.getInt("qid"); %><%=qid%></td>
                    <td type="number" name="pid"><%int pid=rs.getInt("pid");
//                        request.setAttribute("pid",pid);%><%=pid%></td>
                    <td><%=rs.getString("querry") %></td>
                    <td><% image=rs.getBlob("image");
                        if(image==null){out.print("<h3>No Image Available</h3>");}
                        else{
//                        byte[] imageBytes=image.getBytes(1, (int)image.length());
//                        String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
//                        String image1="data:image/jpg;base64,"+encodedImage;
//                          
//                        out.print("<img src="+image1+" height=190px width=180px>");
                        out.print("<a href=\"#\" class=\"link\" onclick=\"viewImg("+qid+");\">View Image</a>");
                        }
                    %>
<!--                    <a name="name" href="#" class="link" onclick="viewImg(hgjhhfgh);">View Image</a>-->

                    </td>
                    
                    <td><a name="name" href="#"class="link" onclick="editRecord(<%=rs.getInt("qid")%>);">Suggest</a></td>
                </tr>
                 <% }%>
            </table>
        </form>
    </h3>
    </center>
</script>
<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
    </body>
</html>
