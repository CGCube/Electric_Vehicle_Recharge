<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try {
    String username = (String) session.getAttribute("username");

    String location = request.getParameter("location");
    String area = request.getParameter("area");
    String slots = request.getParameter("slots");
    String mobile = request.getParameter("mobile");
    String capacity = request.getParameter("capacity");
    String mctime = request.getParameter("mctime");
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");

    String query = "INSERT INTO bunk (username, location, area, slots, capacity, mctime, mobile, latitude, longitude) VALUES ('"
            + username + "', '" + location + "', '" + area + "', '" + slots + "', '" + capacity + "', '" + mctime + "', '"
            + mobile + "', '" + latitude + "', '" + longitude + "')";
    int i = Queries.getExecuteUpdate(query);
    if (i > 0) {
%>
        <script type='text/javascript'>
            window.alert("Successful...!!");
            window.location = "CreateEVBunk.jsp";
        </script>
<%
    } else {
%>
        <script type='text/javascript'>
            window.alert("Registration Failed..!!");
            window.location = "CreateEVBunk.jsp";
        </script>
<%
    }
} catch (Exception e) {
    out.println(e);
}
%>