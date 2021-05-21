<%-- 
    Document   : pay_bill
    Created on : 5 Apr, 2021, 10:56:17 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/templatemo-digital-trend.css">

        <title>University Healthcare</title>

        <style>
            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 100px;
            }

            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }
        </style>

    </head>
    <body>

        <%
            String bid = session.getAttribute("bid").toString();
            session.setAttribute("bid",bid);
            String total = request.getParameter("total");
            String ID = session.getAttribute("ID").toString();
            session.setAttribute("ID", ID);

        %>
        <form method="post" action="bill_pay"><center>
                <h1>Payment</h1>
                <div class="icon-container">
                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                </div>
                <table>
                    <tr>    
                        <td >Amount</td>
                        <td><input type="text" readonly id="amt" name="amt" value="<%=total%>"></td>
                    </tr>
                    <tr>
                        <td >Name on Card</td>
                        <td><input type="text" required id="cname" name="cardname" placeholder="John More Doe">
                        </td>
                    <tr/>
                    <tr>
                        <td >Credit card number</td>
                        <td><input type="number" required id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                        </td>
                    <tr/>
                    <tr>
                        <td >Exp Month</td>
                        <td><input type="text" required id="expmonth" name="expmonth" placeholder="September">
                        </td>
                    <tr/>
                    <tr>
                        <td >Exp Year</td>
                        <td>   <input type="number" required id="expyear" name="expyear" placeholder="2018">
                        </td>
                    <tr/>
                    <tr>
                        <td>CVV</td>
                        <td>    <input type="number" required id="cvv" name="cvv" placeholder="352">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" href="unpaid.jsp">Cancle</a></button>
                                    
                                            <button type="submit" style="  border: none; border-radius: 50px ;width: 250px; 
                                            background-color: #0c8195; padding: 12px 28px; color: #ffffff"><a style="color: #ffffff" >Pay</a></button>
                                    
                        </td>
                    </tr>
                </table> 

            </center></form>


    </body>
</html>
