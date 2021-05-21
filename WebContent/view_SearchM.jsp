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

     <meta name="viewport"
          content="width=device-width,  
                   initial-scale=1.0">
     
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
       session.setAttribute("user","PHARMACIST");
       
       String mname=(request.getParameter("mname")).toUpperCase();
       if(mname.equals("ALL")){
           // database connection settings
            
            Connection con=null;
            String pwd="";
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			ResultSet rs= stat.executeQuery("SELECT * FROM INVENTORY WHERE SHOP_NO="+shop_no);
                        if(!rs.next()){
    %>
                            <center> 
                                <h3>    <strong>Medicine not found.</strong></h3><br/>
                                 <strong style="color:black;">  Following might be the cause:</strong><br/>
                                 Spelling entered is wrong.<br/>
                                 OR<br/>
                                 Medicine detail has not been added in list<br/>
                            </center>
                            <br/><br/><br/>
    
                       <% }
                        else{
                            rs.previous();
                            session.setAttribute("ID",ID);
                            session.setAttribute("shop_no",shop_no);
                         %>
                         <br/>
                         <div>   
                             <h2 style=" text-align: center">MEDICINE DETAILS</h2>
<form style="background-color: #ffffff" method="post" action="#">
        <table style="width:100%; background-color: #ffffff">
            <style>table, th, td {border:1px solid black; height: 25px;
                }
                
            </style>
            <tr> <td colspan="3"></td></tr>
            <tr>
                <td></td>
                <td  style="background-color: #ffffff"> 
                    <table style="width:100%" id="table">
                            <style>
                            table, th, td {width: "50%"; border: 1px #000}
                            th, td {padding: 5px;}
                              
                            </style>
                            <tr  >
                                <th style="text-align:center"><strong >MEDICINE ID</strong></th>
                                <th style="text-align:center"><strong>MEDICINE NAME</strong></th>
                                <th style="text-align:center"><strong>EXPIRY DATE</strong></th>
                                <th style="text-align:center"><strong>UNIT PRICE</strong></th>
                                <th style="text-align:center"><strong>QUANTITY</strong></th>
                                <%--td> <input type="text" id="hello" style=" border: 0px" readonly <%out.print("heloo"); %>></td--%>
                              </tr>
                              
                       <%   while(rs.next()){
                            String a, b, c, d, e;
                                a = rs.getString(1);
                                b = rs.getString(3);
                                c = rs.getString(4);
                                d = rs.getString(5);
                                e = rs.getString(6);
                           
       %>
                           
                            <tr align="center" style="color: #000" >
                                <td align="center"><% out.print(a); %> </td>
                                <td align="center"><% out.print(b); %></td>
                                <td align="center"><% out.print(c); %></td>
                                <td align="center"><% out.print(d); %></td>
                                <td align="center"><% out.print(e); %></td>
                                
                            </tr>
                            <%  }  %>
                 
                        </table>
                </td>
                <td></td>
            </tr>
            
            
    </table>
                            <br/><br/>
            
               
</form>
                         </div>
                <% }
            }

            catch(Exception e){
                out.print(e);
            }
}
       else{
       %>
 
       <!-- FORM -->
     <center> 
        <div> 
            <br/><br/>
            <h2>Enter Medicine Name</h2> 
            <input placeholder="Search" 
                   type="text" 
                   id="user_input" size="50%" /> 
            
            <button type="Submit" id="sub"> 
              Search 
          </button>
            <br/><br/><br/>
        </div> 
    </center> 
   <% session.setAttribute("ID",ID);
      session.setAttribute("shop_no",shop_no);%>
                    
    
    <div class="box_1" id="msg"> 
        <script type="text/javascript" 
                src= 
"https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"> 
      </script> 
        
        <script src="jquery-3.2.1.js"></script> 
        <script> 
            $(document).ready(function() { 
                $("#sub").click(function() { 
                    var fn = $("#user_input").val(); 
                    $.post("view_SearchMed2.jsp", { 
                        mname: fn 
                    }, function(data) { 
                        $("#msg").html(data); 
                    }); 
  
                }); 
            }); 
        </script> 
    </div>
 <% } %>
     <!-- SCRIPTS -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>

</body>
</html>