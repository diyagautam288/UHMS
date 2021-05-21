<%-- 
    Document   : deleteM_search
    Created on : 5 Mar, 2021, 4:44:13 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Healthcare</title>
    </head>
    <body>
        <% String ID = session.getAttribute("ID").toString();
        session.setAttribute("user","PHARMACIST");
       
            String shop_no = session.getAttribute("shop_no").toString();
            String choice = (request.getParameter("choice"));
        %>

    <center> 
        <div> 
            <br/><br/>
            <h2>Enter <%out.print(choice);%></h2> 
            <input placeholder="Search" 
                   type="text" 
                   id="user_input" size="50%" /> 
            <button type="Submit" id="sub"> 
                Search 
            </button>
            <br/><br/><br/>
        </div> 
    </center> 
    <% session.setAttribute("ID", ID);
       session.setAttribute("choice",choice);
       session.setAttribute("shop_no", shop_no);%>


    <div class="box_1" id="msg"> 
        <script type="text/javascript" 
                src= 
                "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"> 
        </script> 

        <script src="jquery-3.2.1.js"></script> 
        <script> 
            $(document).ready(function() { 
                $("#sub").click(function() { 
                    var fn = $("#user_input").val();
                    $.post("deleteM_search2.jsp", {
                                mname: fn 
                            }, function (data) {
                                $("#msg").html(data);
                            });

                        });
                    });
        </script> 
    </div>
</body>
</html>
