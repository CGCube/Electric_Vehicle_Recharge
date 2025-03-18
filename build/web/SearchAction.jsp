<%-- 
    Document   : Admin
    Created on : 9 Feb, 2021, 10:18:25 PM
    Author     : KishanVenky
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Electric_Vehicle_Recharge</title>

<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<link rel="stylesheet" href="table.css" type="text/css" />
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
    var markers = [];

    function initMap() {
        var initialLocation = { lat:19.076, lng: 72.877 }; // Default location
        map = new google.maps.Map(document.getElementById('map'), {
            center: initialLocation,
            zoom: 8
        });

        <% 
        String location = request.getParameter("location");
        ResultSet r = Queries.getExecuteQuery("select * from bunk where location='" + location + "'");
        while (r.next()) {
            double lat = r.getDouble("latitude");
            double lng = r.getDouble("longitude");
        %>
            var location = { lat: <%= lat %>, lng: <%= lng %> };
            var marker = new google.maps.Marker({
                position: location,
                map: map,
                title: '<%= r.getString("location") %>'
            });
            markers.push(marker);
        <% 
        }
        %>
    }
</script>
</head>
<body id="top" onload="initMap()">
<div class="wrapper row1">
  <div id="topnav">
    <ul>
      <li><a href="UserHome.jsp"><strong>Home</strong></a></li>
      <li class="active"><a href="SearchBunk.jsp"><strong>SEARCH BUNKS</strong></a></li>
      <li><a href="user.jsp"><strong>LOGOUT</strong></a></li>
      
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
<div id="homepage" class="clear">
    <center>
        <% String username = (String) session.getAttribute("username"); %>
        
        <% String Location = request.getParameter("location"); %>
        <h2>SEARCH RESULT</h2>
        <div id="map" style="height: 500px; width: 100%; margin-bottom: 20px;"></div>
        <TABLE>
            <TR>
                <TH>LOCATION</TH> <TH>AREA</TH><TH>MOBILE</TH><TH>SLOT VACANCY</TH><TH>VIEW ON MAP</TH>
            </TR>
            <%
            ResultSet R = null;
            try {
                r = Queries.getExecuteQuery("select * from bunk where location='" + location + "'");
                while (r.next()) {
            %>
               <tr>
                   <td><%= r.getString("location") %></td>
                    <td><%= r.getString("area") %></td>
                       <td><%= r.getString("mobile") %></td>
                           <td><a href="SlotsVacancy.jsp?id=<%= r.getString("id") %>">VIEW</a></td>
                           <td><a href="https://www.google.com/maps/search/?api=1&query=<%= r.getString("latitude") %>,<%= r.getString("longitude") %>" target="_blank">VIEW ON MAP</a></td>
               </tr>
            <%
                }
            } catch (Exception e) {
                out.println(e);
            } finally {
                if (r != null) {
                    try { r.close(); } catch (Exception e) { /* ignored */ }
                }
            }
            %>
        </TABLE>
    </center>
</div>
</body>
</html>