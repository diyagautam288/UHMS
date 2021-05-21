<%-- 
    Document   : view_presc
    Created on : 18 Mar, 2021, 5:01:05 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String pid = request.getParameter("pid").toString();
            Blob image = null;
            
            Connection con = null;

            byte imgData[] = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                stmt = con.createStatement();
                rs = stmt.executeQuery("select * from prescription where PRESC_ID ="+pid+";");
                if (rs.next()) {

                    image = rs.getBlob(2);
                    imgData = image.getBytes(1, (int) image.length());
                } else {
                    out.println("Display Blob Example");
                    out.println("image not found for given id>");
                    return;
                }

                // display the image
                response.setContentType("image/gif");
                OutputStream o = response.getOutputStream();
                o.write(imgData);

                o.flush();
                o.close();

            } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                return;
            } finally {
                try {
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        %>
    </body>
</html>
