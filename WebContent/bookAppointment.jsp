<%-- 
    Document   : bookAppoitment
    Created on : 5 Apr, 2021, 7:17:01 PM
    Author     : Shaiv
--%>

<%@page import="java.sql.*"%>
<%@page import="newpackage.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("patientLogin.jsp");
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
        <style>
            select {
  margin: 50px;
  width: 280px;
  padding: 5px 35px 5px 5px;
  font-size: 16px;
  border: 1px solid #ccc;
  height: 45px;

}</style>
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
   Statement st=con.createStatement();
   int pid=user.getPid();
   ResultSet rs=st.executeQuery("SELECT * from department");
 %>    
 <form method="post" action="getDoc.jsp" style="margin: 5%">
     <h1 class="title"> Select your preferences</h1>
 <div >Choose Doctor Type : <select id="dtype">
    <%
while(rs.next())
{
String dtype = rs.getString("dept_name"); 
%>
<option value="<%=rs.getInt("dept_id")%>"><%=dtype%></option>
<%
}
%>

</select></div>
<div id="container"></div>
<div><span hidden>
    	Appointment date:<input id="result" value="" name="datesel">
        Appointment day:<input id="weekd" value="" name="weeksel">
        Appointment date:<input id="datepart" value="" name="dateselected">
        Doctor type:<input id="result1" value="" name="dype">
<!--        <a href="#" id="generate" onclick="GetSelectedValue()" >Set Date</a>-->
    </span></div>
<div><input type="submit" onclick="GetSelectedValue()" style="
    padding: 8px 25px;
    border-radius: 50px;
    font-size: 18px;
    letter-spacing: 2px;
    border: 2px solid #eeff"></div>
    </form>
<script language="javascript">
	function GetDates(startDate, daysToAdd) {
    var aryDates = [];

    for (var i = 1; i <= daysToAdd; i++) {
        var currentDate = new Date();
        currentDate.setDate(startDate.getDate() + i);
        aryDates.push(DayAsString(currentDate.getDay()) + ", " + currentDate.getDate() + " " + MonthAsString(currentDate.getMonth()) + " " + currentDate.getFullYear());
    }

    return aryDates;
}

function MonthAsString(monthIndex) {
    var d = new Date();
    var month = new Array();
    month[0] = "January";
    month[1] = "February";
    month[2] = "March";
    month[3] = "April";
    month[4] = "May";
    month[5] = "June";
    month[6] = "July";
    month[7] = "August";
    month[8] = "September";
    month[9] = "October";
    month[10] = "November";
    month[11] = "December";

    return month[monthIndex];
}

function DayAsString(dayIndex) {
    var weekdays = new Array(7);
    weekdays[0] = "Sunday";
    weekdays[1] = "Monday";
    weekdays[2] = "Tuesday";
    weekdays[3] = "Wednesday";
    weekdays[4] = "Thursday";
    weekdays[5] = "Friday";
    weekdays[6] = "Saturday";

    return weekdays[dayIndex];
}



 var startDate = new Date();
var values = GetDates(startDate, 7);
 
  var select = document.createElement("select");
  select.name = "datep";
  select.id = "datep"
 
  for (const val of values) {
    var option = document.createElement("option");
    option.value = val;
    option.text = val.charAt(0).toUpperCase() + val.slice(1);
    select.appendChild(option);
  }
 
  var label = document.createElement("label");
  label.innerHTML = "Choose Your Date: "
  label.htmlFor = "datep";
 
  document.getElementById("container").appendChild(label).appendChild(select);

</script>

<script>

            function GetSelectedValue(){
                var e = document.getElementById("datep");
                var result = e.options[e.selectedIndex].value;
                var d = document.getElementById("dtype");
                var result1 = d.options[d.selectedIndex].value;
               
		var weekd   = result.substring(0, result.lastIndexOf(","));
		var datepart = result.substring(result.lastIndexOf(",") +1);

		document.getElementById("datepart").value= datepart;   
		document.getElementById("weekd").value= weekd; 
                // document.getElementById("result").innerHTML = result;
                document.getElementById("result").value = result;
                document.getElementById("result1").value = result1;
            }

            function GetSelectedText(){
                var e = document.getElementById("datep");
                var result = e.options[e.selectedIndex].text;
                
                document.getElementById("result").innerHTML = result;
            }
            
        </script>
<script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>
    </body>
</html>
