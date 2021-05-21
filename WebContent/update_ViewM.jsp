<%-- 
    Document   : update_ViewM
    Created on : 3 Mar, 2021, 3:55:07 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html> 
    <meta name="viewport"
          content="width=device-width,  
                   initial-scale=1.0">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
<body>
    <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #ddd;}
        </style>
    <% String ID=session.getAttribute("ID").toString();
       String shop_no=session.getAttribute("shop_no").toString();
       String mname=(request.getParameter("mname")).toUpperCase();
       // database connection settings
            
            Connection con=null;
            String pwd="";
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			ResultSet rs= stat.executeQuery("SELECT * FROM INVENTORY WHERE SHOP_NO="+shop_no+" AND MED_NAME like '"+mname+"%'");
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
            
               
<%--/form--%>
              <script>
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         var outString = "update_Med.jsp?mid="+ this.cells[0].innerHTML;
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
%>
         
        
 
</body> 
  
</html>