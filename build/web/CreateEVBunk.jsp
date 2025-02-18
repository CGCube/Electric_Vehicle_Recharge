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
      <li><a href="AdminHome.jsp"><strong>Home</strong></a></li>
      <li class="active"><a href="CreateEVBunk.jsp"><strong>CREATE EV BUNK</strong></a></li>
      <li><a href="ManageBunkDetails.jsp"><strong>MANAGE BUNK DETAILS</strong></a></li>
      <li><a href="ManageRechargeSlot.jsp"><strong>MANAGE RECHARGE SLOTS</strong></a></li>
      <li><a href="Admin.jsp"><strong>LOGOUT</strong></a></li>
      
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
       <%String username=(String)session.getAttribute("username");%>
  </div>
</div>
 <div id="homepage" class="clear">
       <center>
            
            <h2>CREATE EV BUNK</h2>
            <form action="EVAction.jsp" method="post">
                <table>
                    <tr><th>Buck Location</th><td><input type="text" name="location" required=""></td></tr>
                    <tr><th>Buck Area</th><td><input type="text" name="area" required=""></td></tr>
                    <tr><th>No.of Slots</th><td><input type="text" name="slots" required=""></td></tr>
                    <tr><th>Mobile</th><td><input type="number" name="mobile" required=""></td></tr>
                     <tr><th>Slots Capacity</th><td><input type="text" name="capacity" required=""></td></tr>
                    <tr><th>Min Charge Time</th><td><input type="text" name="mctime" required=""></td></tr>
                       <tr><th></th><td><input type="submit" value="Add Bunk" required=""></td></tr>
                  
                </table>
            
            </form>
            
        </center>
        
        
        
    </div>
       </div>
</div>


</body>
</html>