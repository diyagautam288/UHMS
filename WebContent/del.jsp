<%-- 
    Document   : del
    Created on : 5 Apr, 2021, 11:53:29 PM
    Author     : Shaiv
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String id=request.getParameter("id");
            int no=Integer.parseInt(id);
            Class.forName("oracle.jdbc.driver.OracleDriver");
        	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            String sql = "Delete from question where qid=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, no);
            
 int row = statement.executeUpdate();  
 if(row>0){
 response.sendRedirect("suggestion.jsp");}
%>
    </body>
</html>
