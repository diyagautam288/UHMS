<%-- 
    Document   : deleteM_search2
    Created on : 5 Mar, 2021, 4:44:37 PM
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
            String OID = session.getAttribute("OID").toString();
            String address = session.getAttribute("address").toString();
            String mname = (request.getParameter("mname")).toUpperCase();
            String user=session.getAttribute("user").toString();
            session.setAttribute("ID",ID);
            
            session.setAttribute("shop_no",shop_no);
            
            // database connection settings
           
            Connection con = null;
            ResultSet rs = null;

            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                Statement stat = con.createStatement();
                rs = stat.executeQuery("SELECT * FROM INVENTORY WHERE SHOP_NO=" + shop_no + " AND MED_NAME like '" + mname + "%'");

                if (!rs.next()) {
        %>
    <center> 
        <h3>    <strong>Medicine not found.</strong></h3><br/>
        <strong style="color:black;">  Following might be the cause:</strong><br/>
        Information entered is wrong.<br/>
        OR<br/>
        Medicine detail does not exist in list<br/>
    </center>
    <br/><br/><br/>

    <% } else {
        rs.previous();
        session.setAttribute("ID", ID);
        session.setAttribute("shop_no", shop_no);
        session.setAttribute("OID", OID);
        session.setAttribute("address", address);
        session.setAttribute("user",user);
        
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
                        <th style="text-align:center"><strong >MEDICINE ID</strong></th>
                        <th style="text-align:center"><strong>MEDICINE NAME</strong></th>
                        <th style="text-align:center"><strong>UNIT PRICE</strong></th>
                            <%--td> <input type="text" id="hello" style=" border: 0px" readonly <%out.print("heloo"); %>></td--%>
                    </tr>

                    <%   while (rs.next()) {
                            String a, b, c;
                            a = rs.getString(1);
                            b = rs.getString(3);
                            c = rs.getString(5);

                    %>

                    <tr align="center" style="color: #000" >
                        <td align="center"><% out.print(a); %> </td>
                        <td align="center"><% out.print(b); %></td>
                        <td align="center"><% out.print(c); %></td>

                    </tr>
                    <%  }  %>

                </table>
            </td>
            <td></td>
        </tr>


    </table>
    <br/><br/>


    <%--/form--%>
    <script>
        var table = document.getElementById('table');
        
        for (var i = 1; i < table.rows.length; i++)
        {
            table.rows[i].onclick = function ()
            {
                //rIndex = this.rowIndex;
                    alert("Medicine added to order list") ;
                    var outString = "order_List?mid=" + this.cells[0].innerHTML;
                    location.href = outString;
                    
                    
            };
        }


    </script>


    <%
            }
            con.close();

        } catch (Exception e) {
            out.println(e);
        }
    %>


</body>
</html>
