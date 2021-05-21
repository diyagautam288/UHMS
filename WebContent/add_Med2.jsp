<%-- 
    Document   : add_Med2
    Created on : 28 Feb, 2021, 11:13:57 PM
    Author     : user
--%>

<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>University Healthcare</title>
    </head>
    <body>
        <% String m_name=(request.getParameter("name")).toUpperCase();
           String date=request.getParameter("date");
           String qty=request.getParameter("qty");
           String price=request.getParameter("price");
            // database connection settings
            
            Connection con=null;
            String pwd="";
            String ID=session.getAttribute("ID").toString();
            String shop_no=session.getAttribute("shop_no").toString();
            String MID=session.getAttribute("MID").toString();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			stat.executeUpdate("INSERT INTO INVENTORY VALUES ('"+MID+"',"+shop_no+",'"+m_name+"','"+date+"',"+price+","+qty+")");
			con.close(); 
                        
		}
		catch(Exception e)
		{
			out.println(e);
		} 
                session.setAttribute("ID",ID);
                session.setAttribute("shop_no",shop_no);
                response.sendRedirect("successful.jsp?ID="+ID+"&shop_no="+shop_no);
                           %>
                           
    </body>
</html>
