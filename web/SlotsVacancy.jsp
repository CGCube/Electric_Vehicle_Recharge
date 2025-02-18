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
</head>
<body id="top">
<div class="wrapper row1">
  <div id="topnav">
    <ul>
      <li class="active"><a href="UserHome.jsp"><strong>Home</strong></a></li>
      <li><a href="SearchBunk.jsp"><strong>SEARCH BUNKS</strong></a></li>
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
            <%String username=(String)session.getAttribute("username");%>
            
            <%String location=request.getParameter("location");%>
           <h2>Slots Vacancy</h2>
            <FORM ACTION="VacancySlotAction.jsp" method="post">
            <TABLE>
              
                <%
                    String id=request.getParameter("id");
                try{
                    ResultSet r=Queries.getExecuteQuery("select * from bunk where id='"+id+"'");
                    if(r.next()){
                   %>
                   
                      <tr><td>Id</td><td><input type="text" name="id" value="<%=id%>" readonly=""></td>
                
                   
                   <tr><td>Available Slots</td><td><input type="text" name="slots" value="<%=r.getString("slots")%>" required=""></td>
                   <tr><td>Enter no.of Slots you wants</td><td><input type="text" name="slotno"  required=""></td>
                     <tr>
                         <th><input type="submit" value="Book"></th>
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