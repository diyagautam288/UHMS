<%-- 
    Document   : pay_bill
    Created on : 5 Apr, 2021, 10:56:17 AM
    Author     : user
--%>

<%@page import="newpackage.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("patientLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <link rel="stylesheet" href="paybill/paybill.css">
        <title>University Healthcare</title>
    </head>
    <body>
    <form action="BookApt" method="post" >
        <div class="container-fluid px-1 px-md-2 px-lg-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-sm-11">
            <div class="card border-0">
                <div class="row justify-content-center">
                    <h3 class="mb-4">Credit Card Payment</h3>
                </div>
                <div class="row">
                    <div class="col-sm-7 border-line pb-3">
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Name on the card</p> <input type="text" name="name" placeholder="Name" size="15" required>
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Card Number</p>
                            <div class="row px-3"> <input type="text" name="card-num" placeholder="0000 0000 0000 0000" size="18" id="cr_no" minlength="19" maxlength="19" required>
                                <p class="mb-0 ml-3">/</p> <img class="image ml-1" src="https://i.imgur.com/WIAP9Ku.jpg">
                            </div>
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Expiry date</p> <input type="text" name="exp" placeholder="MM/YY" size="6" id="exp" minlength="5" maxlength="5" required>
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">CVV/CVC</p> <input type="password" name="cvv" placeholder="000" size="1" minlength="3" maxlength="3" required>
                        </div>
                        
                    </div>
                     <%
                     Class.forName("oracle.jdbc.driver.OracleDriver");
                 Connection	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
   Statement st=con.createStatement();
   int did=Integer.parseInt(request.getParameter("did"));
  
   String apdate=request.getParameter("apdate");
   ResultSet rs=st.executeQuery("SELECT fees from doctor where doc_id="+did+"");
   rs.next();
    %>    
    
                    <div class="col-sm-5 text-sm-center justify-content-center pt-4 pb-4"> <small class="text-sm text-muted">Doctor ID</small>
                        <h5 class="mb-5"><%=did%></h5> <small class="text-sm text-muted">Payment amount</small>
                        <div class="row px-3 justify-content-sm-center">
                            <h2 class=""><span class="text-md font-weight-bold mr-2">Rs.</span><span class="text-danger"><%=rs.getInt("fees")%></span></h2>
                            <span hidden>
                                <input name="did" value="<%=did%>">
                                <input name="fees" value="<%=rs.getInt("fees")%>">
                                <input name="pid" value="<%=user.getPid()%>">
                                <input name="apdate" value="<%=apdate%>">
                            </span>
                        </div> <input type="submit" class="btn btn-red text-center mt-4" value="PAY">
                        
                       </div>
                </div>
                            
            </div>
        </div>
    </div>
</div>

    </form>
        
    </body>
    
</html>
