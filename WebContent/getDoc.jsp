<%-- 
    Document   : getDoc
    Created on : 7 Apr, 2021, 11:01:01 PM
    Author     : Shaiv
--%>
<%@page import="newpackage.User"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% User user = (User) session.getAttribute("logUser");
if(user==null){
        response.sendRedirect("patientLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/templatemo-digital-trend.css">
                <link rel="stylesheet" href="paybill/paybill.css">
                
        <title>JSP Page</title>
    </head>
    <body style="margin:5%;">
        <style>
            select {
  margin: 50px;
  width: 480px;
  padding: 5px 35px 5px 5px;
  font-size: 16px;
  border: 1px solid #ccc;
  height: 45px;

}
        </style>
 <%String string = request.getParameter("dateselected");
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern(" d MMMM yyyy", Locale.ENGLISH);
   LocalDate date = LocalDate.parse(string, formatter);
    
  
   String week=request.getParameter("weeksel");
   Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
   Statement st=con.createStatement();
   int depid=Integer.parseInt(request.getParameter("dype")); 
  // ResultSet rs=st.executeQuery("SELECT d.doc_id,concat(r.f_name,' ',r.l_name) as fullname from uhms.doctor d left join uhms.reg_user r on d.email=r.email  where d.dept_id="+depid+" and d.doc_id=(select doc_id from uhms.scheduler where weekday='"+week+"' and count_p < 30);");
  ResultSet rs=st.executeQuery("select d.doc_id, concat (r.f_name,' ',r.l_name) as fullname, s.time, d.fees from uhms.reg_user r right join uhms.doctor d on d.email=r.email right join uhms.scheduler s on d.doc_id=s.doc_id where d.doc_id=(select doc_id from uhms.scheduler where weekday='"+week+"' and count_p < 30) and d.dept_id="+depid+"");

  boolean s=rs.next();
   
    %>    

  
<% 
    if ((s)==false){out.print("<h1 class=\"title\">No doctor available on this date</h1>");}
    else{
        out.print("<center><form action=\"pay_bill.jsp\" method=\"post\" ><div ><h1 class=\"title\">Select Doctor </h1><h3><select id=\"docid\">");
        while(s)
            {
            String dtype = rs.getString("fullname");
            String time = rs.getString("time");
            int did=rs.getInt("doc_id");
            int fees=rs.getInt("fees");
            out.print("<option value="+did+">Doctor Name: "+dtype+" ;   Fee: Rs"+fees+" ;      Time: ["+time+"]</option>");

            s=(rs.next());
            }

            out.print("</select></div><span hidden>");
            out.print("<input id=\"result\" value=\"\" name=\"did\">");
            
        //    out.print("<input id=\"result1\" value=\"\" name=\"dname\">"); 
            out.print("<input  value="+date+" name=\"apdate\">"); 
            out.print("</span></div>");
            out.print("<div><input type=\"submit\" class=\"btn btn-red text-center mt-4\" onclick=\"GetSelectedValue()\"></h3></div></form></center>");
        }
%>
<script>

    function GetSelectedValue(){
    var e = document.getElementById("docid");
    var result = e.options[e.selectedIndex].value;
    document.getElementById("result").value = result;
    var d = document.getElementById("docid");
    var result1 = d.options[d.selectedIndex].text;
    document.getElementById("result1").value = result1;
    } 
</script>

    </body>
</html>
