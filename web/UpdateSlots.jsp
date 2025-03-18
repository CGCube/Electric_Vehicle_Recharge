<%-- 
    Document   : updateSlots
    Created on : 25 Feb, 2025, 07:02:22 AM
    Author     : CGCube
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Update Slots - Electric Vehicle Recharge</title>

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
    var marker;

    function initMap() {
        var initialLocation = { lat: 19.0760, lng: 72.8777 }; // Default location (Mumbai)
        map = new google.maps.Map(document.getElementById('map'), {
            center: initialLocation,
            zoom: 10
        });

        <% 
        String bunkIdMap = request.getParameter("id");
        ResultSet mapResultSet = Queries.getExecuteQuery("select * from bunk where id='" + bunkIdMap + "'");
        if (mapResultSet.next()) {
            double lat = mapResultSet.getDouble("latitude");
            double lng = mapResultSet.getDouble("longitude");
        %>
            var location = { lat: <%= lat %>, lng: <%= lng %> };
            marker = new google.maps.Marker({
                position: location,
                map: map,
                draggable: true,
                title: '<%= mapResultSet.getString("location") %>'
            });

            google.maps.event.addListener(marker, 'dragend', function(evt){
                document.getElementById('latitude').value = evt.latLng.lat().toFixed(6);
                document.getElementById('longitude').value = evt.latLng.lng().toFixed(6);
            });

            google.maps.event.addListener(map, 'click', function(event) {
                placeMarker(event.latLng);
            });

            function placeMarker(location) {
                marker.setPosition(location);
                document.getElementById('latitude').value = location.lat().toFixed(6);
                document.getElementById('longitude').value = location.lng().toFixed(6);
            }

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
      <li><a href="SearchBunk.jsp"><strong>SEARCH BUNKS</strong></a></li>
      <li><a href="user.jsp"><strong>LOGOUT</strong></a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row2">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="#">Electric Vehicle Recharge</a></h1>
      <p>System</p>
    </div>
  </div>
</div>
<div id="homepage" class="clear">
    <center>
        <% String username = (String) session.getAttribute("username"); %>
        
        <% String bunkId = request.getParameter("id"); %>
        <h2>UPDATE SLOTS</h2>
        <div id="map" style="height: 500px; width: 100%; margin-bottom: 20px;"></div>
        <TABLE>
            <TR>
                <TH>LOCATION</TH> <TH>AREA</TH><TH>CAPACITY</TH><TH>SLOTS</TH><TH>LATITUDE</TH><TH>LONGITUDE</TH><TH>UPDATE</TH>
            </TR>
            <%
            ResultSet r = null;
            try {
                r = Queries.getExecuteQuery("select * from bunk where id='" + bunkId + "'");
                if (r.next()) {
            %>
               <tr>
                   <form method="post">
                   <td><%= r.getString("location") %></td>
                   <td><%= r.getString("area") %></td>
                   <td><%= r.getString("capacity") %></td>
                   <td><input type="text" name="slots" value="<%= r.getString("slots") %>"></td>
                   <td><input type="text" id="latitude" name="latitude" value="<%= r.getString("latitude") %>" readonly></td>
                   <td><input type="text" id="longitude" name="longitude" value="<%= r.getString("longitude") %>" readonly></td>
                   <td>
                       <input type="hidden" name="id" value="<%= r.getString("id") %>">
                       <input type="submit" value="Update">
                   </td>
                   </form>
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

        <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String id = request.getParameter("id");
            String slots = request.getParameter("slots");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/electric_vehicle", "root", "mshetty05");

                String sql = "UPDATE bunk SET slots = ?, latitude = ?, longitude = ? WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, slots);
                pstmt.setString(2, latitude);
                pstmt.setString(3, longitude);
                pstmt.setString(4, id);

                int updated = pstmt.executeUpdate();
                if (updated > 0) {
                    out.println("<h2>Slots and coordinates updated successfully!</h2>");
                } else {
                    out.println("<h2>Error updating slots and coordinates. Please try again.</h2>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            } finally {
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        %>
    </center>
</div>
</body>
</html>