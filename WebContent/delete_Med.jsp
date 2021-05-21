<%-- 
    Document   : success
    Created on : 4 Mar, 2021, 4:05:29 PM
    Author     : user
--%>
      
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

     <title>University Healthcare</title>

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

</head>
<body>
    <% String ID=session.getAttribute("ID").toString();
       String shop_no=session.getAttribute("shop_no").toString();
       session.setAttribute("user","PHARMACIST");
       
//  String msg=(request.getAttribute("Message")).toString(); 
         
  
    %>
    
     <!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">
              <i class="fa fa-hospital-o"></i>
             University Health Care
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="pharMain.jsp" class="nav-link smoothScroll">Dashboard</a>
                    </li>
                    <li class="nav-item">
                       <% session.setAttribute("ID",ID);
                          session.setAttribute("shop_no",shop_no);%>
                        <a href="inventory.jsp" class="nav-link smoothScroll">Inventory</a>
                    </li>
                    <li class="nav-item">
                            <a href="view_order.jsp" class="nav-link smoothScroll">View order</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link smoothScroll">Bill</a>
                    </li>
                    <li class="nav-item">
                        <a href="pharmacist_profile.jsp" class="nav-link smoothScroll">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

     <!-- BODY -->
     
     <center>
         <h2>Search By </h2>
         <div >
             <table style="width: 50%" >
                 <tr >
                     <td style="font-size: x-large; text-align: right" >Name</td>
                     <td ><input type="radio" style="height: 25px;
  width: 25px;position: relative;" name="answer" value="Name" /></td>
                     <td style="font-size: x-large;text-align: right">ID</td>
                     <td ><input style="height: 25px;
  width: 25px;position: relative;" type="radio" name="answer" value="ID" /> </td>
                     
                 </tr>
                 
             </table>
             </div>
     </center>

<div class="box_1" id="msg"> 
        <script type="text/javascript" 
                src= 
"https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"> 
      </script> 
        
        <script src="jquery-3.2.1.js"></script> 
        <script> 
            $(document).ready(function() { 
                $("input[type='radio']").change(function() { 
                    var fn = $(this).val();
                  
                    $.post("deleteM_search.jsp",{ 
                        choice: fn 
                        },function(data) { 
                        $("#msg").html(data); 
                      });
                         
                }); 
            }); 
        </script> 
    </div>




<!-- FOOTER -->

    <footer class="site-footer">
      <div class="container">
        <div class="row">

          <div class="col-lg-5 mx-lg-auto col-md-8 col-10">
            <h1 class="text-white" data-aos="fade-up" data-aos-delay="100">Your Most Trusted <strong> Health Partner</strong> for Life.</h1>
          </div>
 
          <div class="col-lg-3 col-md-6 col-12" data-aos="fade-up" data-aos-delay="200">
            <h4 class="my-4">Contact Info</h4>

            <p class="mb-1">
              <i class="fa fa-phone mr-2 footer-icon"></i> 
              +99 080 070 4224
            </p>

            <p>
              <a href="#">
                <i class="fa fa-envelope mr-2 footer-icon"></i>
                arogya@banasthali.ac.in
              </a>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 col-12" data-aos="fade-up" data-aos-delay="300">
            <h4 class="my-4">Our Location</h4>

            <p class="mb-1">
              <i class="fa fa-home mr-2 footer-icon"></i> 
              Vanasthali Road, Dist, Vanasthali, Rajasthan 304022
            </p>
          </div>

          <div class="mx-lg-auto text-center col-md-8 col-12 " data-aos="fade-up" data-aos-delay="400">
            <p class="copyright-text">Copyright &copy; 2020 Banasthali Vidyapith
            <br>
            </div>
          <div class="mx-lg-auto text-center col-md-6 col-12" data-aos="fade-up" data-aos-delay="600">
            <ul class="social-icon">
              <li><a href="https://www.instagram.com/banasthali_vidyapith/?hl=en" class="fa fa-instagram"></a></li>
              <li><a href="https://twitter.com/banasthali_vid?lang=en" class="fa fa-twitter"></a></li>
              <li><a href="https://www.facebook.com/banasthali.org/" class="fa fa-facebook"></a></li>
              <li><a href="https://www.linkedin.com/in/banasthali-vidyapith-967816174/?originalSubdomain=in" class="fa fa-linkedin"></a></li>
            </ul>
          </div>

        </div>
      </div>
    </footer>

    
     <!-- SCRIPTS -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/aos.js"></script>
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/custom.js"></script>

</body>
</html>