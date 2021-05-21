<%-- 
    Document   : deleteM_search
    Created on : 5 Mar, 2021, 4:44:13 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Healthcare</title>
    </head>
    <body>
        <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #ddd;}
        </style>
    
        <%  
            String ID = session.getAttribute("ID").toString();
            String shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("ID", ID);
            session.setAttribute("shop_no", shop_no);
            String choice = (request.getParameter("choice"));

            // database connection settings
            
            Connection con=null;
            ResultSet rs=null ;
            String pwd="";
            	try{
            		Class.forName("oracle.jdbc.driver.OracleDriver");
                	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
                        Statement stat2 = con.createStatement();
                        stat.executeUpdate("DELETE FROM DETAIL WHERE BILL_NO NOT IN (SELECT BILL_NO FROM MED_BILL)");
                        
                        if(choice.equals("Unseen"))
                            rs= stat.executeQuery("SELECT * FROM MED_ORDER WHERE SHOP_NO="+shop_no+" AND STATUS='UNSEEN'");
                        if(choice.equals("Accepted"))
                            rs= stat.executeQuery("SELECT * FROM MED_ORDER WHERE SHOP_NO="+shop_no+" AND STATUS='ACCEPTED'");
                        if(choice.equals("will be delivered soon"))
                            rs= stat.executeQuery("SELECT * FROM MED_ORDER WHERE SHOP_NO="+shop_no+" AND STATUS!='UNSEEN' AND STATUS!='ACCEPTED' ORDER BY DATE DESC");
                        
                        if(!rs.next()){
    %>
                            <center> 
                                <h3>    <strong>No order found.</strong></h3><br/>
                                <strong style="color:black;">Click <a href="pharMain.jsp">here </a> to go to main page.</strong><br/>
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
                                <th style="text-align:center"><strong >ORDER ID</strong></th>
                                <th style="text-align:center"><strong>ORDER TYPE</strong></th>
                                <th style="text-align:center"><strong>PATIENT ID</strong></th>
                                <th style="text-align:center"><strong>STATUS</strong></th>
                                <th style="text-align:center"><strong>ORDER DATE</strong></th>
                                <%--td> <input type="text" id="hello" style=" border: 0px" readonly <%out.print("heloo"); %>></td--%>
                              </tr>
                              
                       <%   while(rs.next()){
                            String a, b, c, d, e;
                                a = rs.getString(1);
                                b = rs.getString(3);
                                c = rs.getString(4);
                                d = rs.getString(6);
                                e = rs.getString(7);
                           
       %>
                           
       <tr align="center" style="color: #000" >
                                <td align="center"><% out.print(a); %> </td>
                                <td align="center"><% out.print(b); %></td>
                                <td align="center"><% out.print(c); %></td>
                                <td align="center"><% out.print(d); %></td>
                                <td align="center"><% out.print(e); %></td>
                                
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
                         var type=this.cells[1].innerHTML;
                         var ch = "<%=choice%>"
                         
                        if(ch=="Accepted"){
                            if(type=="WITH PRESCRIPTION"){
                                var outString = "bill_withP.jsp?oid="+ this.cells[0].innerHTML;
                                location.href = outString
                            }
                            else{
                                var outString = "bill_withoutP.jsp?oid="+ this.cells[0].innerHTML;
                                location.href = outString
                            }
                        }
                        else{
                            if(type=="WITH PRESCRIPTION"){
                                var outString = "view_withP.jsp?oid="+ this.cells[0].innerHTML;
                                location.href = outString
                            }
                            else{
                                var outString = "view_withoutP.jsp?oid="+ this.cells[0].innerHTML;
                                location.href = outString
                            }
                        }
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
