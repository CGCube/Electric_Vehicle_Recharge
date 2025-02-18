<%-- 
    Document   : Admin
    Created on : 9 Feb, 2021, 10:18:25 PM
    Author     : KishanVenky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Electric_Vehicle_Recharge</title>

<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<!-- Featured Slider  -->
<script type="text/javascript" src="layout/scripts/jquery-s3slider.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#featured_slide_").s3Slider({
		timeOut:10000 
	});
});
</script>
<!-- / Featured Slider -->
</head>
<body id="top">
<div class="wrapper row1">
  <div id="topnav">
    <ul>
      <li><a href="index.html"><strong>Home</strong></a></li>
      <li class="active"><a href="Admin.jsp"><strong>ADMIN</strong></a></li>
      <li><a href="user.jsp"><strong>USER</strong></a></li>
      
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row2">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="#">Electric_Vehicle_Recharge</a></h1>
      <p>System</p>
    </div>
    
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row3">
  <div id="featured_slide_">
    <ul id="featured_slide_Content">
      <li class="featured_slide_Image"><a href="#"><img src="images/abc.jpeg" alt="" /></a>
        <div class="introtext">
          <h2>Abstract</h2>
          <p align='justify'>
             This Project examines various issues related to electric vehicle supply equipment (EVSE) or charging stations related to. The proposed system of EV Charging mobile app to provide EV owner the convenience of locating charging stations on google map, vacancy of  charging slots, getting updates on charging, recommendations on time-of-day use. Help increase the life of batteries and ensure smooth journeys long distance
 
          </p>
        </div>
      </li>
       <li class="featured_slide_Image"><a href="#"><img src="images/abc.jpeg" alt="" /></a>
        <div class="introtext">
          <h2>Abstract</h2>
          <p align='justify'>
                 This Project examines various issues related to electric vehicle supply equipment (EVSE) or charging stations related to. The proposed system of EV Charging mobile app to provide EV owner the convenience of locating charging stations on google map, vacancy of  charging slots, getting updates on charging, recommendations on time-of-day use. Help increase the life of batteries and ensure smooth journeys long distance
 
          </p>
        </div>
      </li>
       <li class="featured_slide_Image"><a href="#"><img src="images/abc.jpeg" alt="" /></a>
        <div class="introtext">
          <h2>Abstract</h2>
          <p align='justify'>
                 This Project examines various issues related to electric vehicle supply equipment (EVSE) or charging stations related to. The proposed system of EV Charging mobile app to provide EV owner the convenience of locating charging stations on google map, vacancy of  charging slots, getting updates on charging, recommendations on time-of-day use. Help increase the life of batteries and ensure smooth journeys long distance
 
          </p>  
        </div>
      </li>
      <li class="clear featured_slide_Image"><!-- Important - Leave This Empty --></li>
    </ul>
  </div>
  
</div>
<div class="wrapper row5">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="homepage" class="clear">
       <center>
            
            <h2>ADMIN LOGIN</h2>
           <form action="AdminLAction.jsp" method="post">
          <table>
              <tr><th>UserName</th><td><input type="text" name="uname" required=""></tD></tr>
              <tr><th>Password</th><td><input type="password" name="pass" required=""></tD></tr>
              <tr><th></th><td><input type="submit" value="Login">
                  
                      <a href="AdminRegister.jsp">Register</a>
                  </tD></tr>
          </table>
      </form>
            
            
            
        </center>
        
        
        
    </div>
       </div>
</div>


</body>
</html>