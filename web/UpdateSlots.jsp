<%-- 
    Document   : Admin
    Created on : 9 Feb, 2021, 10:18:25 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
</head>
<body id="top">
<div class="wrapper row1">
  <div id="topnav">
    <ul>
      <li><a href="AdminHome.jsp"><strong>Home</strong></a></li>
      <li><a href="CreateEVBunk.jsp"><strong>CREATE EV BUNK</strong></a></li>
      <li><a href="ManageBunkDetails.jsp"><strong>MANAGE BUNK DETAILS</strong></a></li>
      <li class="active"><a href="ManageRechargeSlot.jsp"><strong>MANAGE RECHARGE SLOTS</strong></a></li>
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
 <div id="homepage">
       <center>
            
            <h2>MANAGE SLOTS DETAILS</h2>
            <FORM ACTION="ManageSlotAction.jsp" method="post">
            <TABLE>
              
                <%
                    String id=request.getParameter("id");
                try{
                    ResultSet r=Queries.getExecuteQuery("select * from bunk where id='"+id+"'");
                    if(r.next()){
                   %>
                   
                      <tr><td>Id</td><td><input type="text" name="id" value="<%=id%>" readonly=""></td>
                
                   
                   <tr><td>No.Of Slots</td><td><input type="text" name="slots" value="<%=r.getString("slots")%>" required=""></td>
                           <tr><td>Slot Capacity</td><td><input type="text" name="capacity" value="<%=r.getString("capacity")%>" required=""></td>
                     <tr><td>Minimum Time To Charge</td><td><input type="text" name="mctime" value="<%=r.getString("mctime")%>" required=""></td>
                     <tr>
                         <th><input type="submit" value="Update"></th>
                   </tr>
                   
                   <%
                    }
                }catch(Exception e){
                    out.println(e);
                }
                
                
                
                %>
            </TABLE>
       </FORM>
        </center>
        
        
        
    </div>
       </div>
</div>


</body>
</html>