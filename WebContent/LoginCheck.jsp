<%-- 
    Document   : LoginCheck
    Created on : 26 Feb, 2021, 6:04:30 PM
    Author     : user
--%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String username=request.getParameter("username");
           String password=request.getParameter("pass");
           
            // database connection settings
            
            Connection con=null;
		String pwd="";
                String type="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

			Statement stat = con.createStatement();
			ResultSet rs = stat.executeQuery("SELECT PASSWORD,USER_TYPE FROM REG_USER where EMAIL='"+username+"'");
			 if(rs.next())
                         {
                                pwd=rs.getString(1);
                                type=rs.getString(2);
                                if((password.equals(pwd)))
                                { 
                //session.setAttribute("username",username);
                                session.setAttribute("ID",username);
                                if(type.equals("PHARMACIST"))
                                    response.sendRedirect("pharMain.jsp");
                                if(type.equals("LAB INCHARGE"))
                                    response.sendRedirect("lab_Main.jsp");
                                }
                                else
                                { 
                           %>
                           <script language="javascript">
                               alert("Incorrect password");
                               window.location.replace("index.html")//Java Script alert message
                           </script>

                            <%  }
                
                         }
                         else
                         { %>
                             <script language="javascript">
                               alert("Incorrect username");
                               window.location.replace("index.html")
                               //Java Script alert message
                           </script>
                         
                         
                   <%    }
			 con.close(); 
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>
           
           
                
                <script>
                        function demo() {
                            alert("Incorrect password or user");
                        }
                </script>
                
    </body>
</html>
