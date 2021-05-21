<%-- 
    Document   : viewImg
    Created on : 4 Apr, 2021, 11:29:18 PM
    Author     : Shaiv
--%>
<!--https://www.roseindia.net/tutorial/java/jsp/jspdisplayblob.html-->
<%@page import="newpackage.User"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html>
    <head>
        <title>Image</title>
    </head>
    <body>

<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);

Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try {

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

stmt = con.createStatement();

rs = stmt.executeQuery("select image from question where qid = "+no+"");

if (rs.next()) {

image = rs.getBlob("image");

imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}

// display the image

response.setContentType("image/jpg");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

}

%>

    </body>
</html>
