<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String pwd=request.getParameter("mess"); 
	Connection con=null;
	try{
		    
            //Connection con = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
		String sql = "UPDATE REG_USER SET password = ? WHERE  EMAIL='admin@banasthali.in'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.executeUpdate();
		con.close(); 
	}
	catch(Exception e)
	{
		System.out.println(e);
	} 
%>
<script type="text/JavaScript">
      setTimeout("location.href = 'adminLogin.jsp';",0000);
</script>
</body>
</html>