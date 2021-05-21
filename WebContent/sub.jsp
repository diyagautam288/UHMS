<%-- 
    Document   : sub
    Created on : 4 Apr, 2021, 10:11:54 PM
    Author     : Shaiv
--%>
<!--https://www.roseindia.net/answers/viewqa/JSP-Servlet/26866-How-to-get-table-row-contents-into-next-jsp-page.html-->
<%@page import="newpackage.User"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<% User doc = (User) session.getAttribute("logDoc");
    if(doc==null){
        response.sendRedirect("doctorLogin.jsp");
    }
String num=request.getParameter("id");
%>


<html>
    <head>
        <title>Your Suggestion</title>
       <link rel="stylesheet" type="text/css" href="askquerry/css/util.css">
	<link rel="stylesheet" type="text/css" href="askquerry/css/main.css">
        <script language="javascript">
function editRecord(no){
    var f=document.form;
    f.method="post";
    f.action='SubmissionSuceess.jsp?no='+no;
    f.submit();
}
        </script>
    </head>
    <body style="margin:5%;">
        <form method="post" class="contact100-form validate-form" name="form">
            <span class="contact100-form-title">
                <center>Your Suggestion</center>
            </span>
            <div class="input100">
                <span class="contact100-form">Your Name :   <%=doc.getfName() %> <%=doc.getlName()%></span>
                <span class="contact100-form">QID : <%=num%></span>
				</div>
     <div class="wrap-input100 validate-input" data-validate = "Message is required">
					<span class="label-input100">Suggestion</span>
                                        <textarea class="input100" name="ans" placeholder="Write answer here..." required></textarea>
					<span class="focus-input100"></span>
				</div>
     <div class="container-contact100-form-btn">
                                    <button class="contact100-form-btn" onclick="editRecord(<%=num%>);">
						<span>
							Submit
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
				</div>
         
            </form>
           
</body>
</html>