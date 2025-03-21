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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdOZaSG5I6LNpjg7Bf8JD-IC3ETKQvIUE"></script>
<script>
    var map;
    var marker;
    var infowindow;

    function initMap() {
        var initialLocation = { lat: 19.076, lng: 72.877 }; // Default location
        map = new google.maps.Map(document.getElementById('map'), {
            center: initialLocation,
            zoom: 8
        });

        infowindow = new google.maps.InfoWindow();

        google.maps.event.addListener(map, 'click', function(event) {
            placeMarker(event.latLng);
        });
    }

    function placeMarker(location) {
        if (marker) {
            marker.setPosition(location);
        } else {
            marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }

        document.getElementById('latitude').value = location.lat();
        document.getElementById('longitude').value = location.lng();

        infowindow.setContent('Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng());
        infowindow.open(map, marker);
    }
</script>
</head>
<body id="top" onload="initMap()">
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
            <div id="map" style="height: 500px; width: 100%;"></div>
            <form action="EVAction.jsp" method="post">
                <table>
                    <tr><th>Buck Location</th><td><input type="text" name="location" required=""></td></tr>
                    <tr><th>Buck Area</th><td><input type="text" name="area" required=""></td></tr>
                    <tr><th>No.of Slots</th><td><input type="text" name="slots" required=""></td></tr>
                    <tr><th>Mobile</th><td><input type="number" name="mobile" required=""></td></tr>
                     <tr><th>Slots Capacity</th><td><input type="text" name="capacity" required=""></td></tr>
                    <tr><th>Min Charge Time</th><td><input type="text" name="mctime" required=""></td></tr>
                    <tr><th>Latitude</th><td><input type="text" id="latitude" name="latitude" readonly></td></tr>
                    <tr><th>Longitude</th><td><input type="text" id="longitude" name="longitude" readonly></td></tr>
                    <tr><th></th><td><input type="submit" value="Add Bunk" required=""></td></tr>
                  
                </table>
            
            </form>
            
        </center>
        
        
        
    </div>
       </div>
</div>


</body>
</html>