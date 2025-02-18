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
            <%String username=(String)session.getAttribute("username");%>
            
            <%String location=request.getParameter("location");%>
            <h2>SEARCH RESULT</h2>
          <TABLE>
                <TR>
                    <TH>LOCATION</TH> <TH>AREA</TH><TH>MOBILE</TH><TH>SLOT VACANCY</TH>
                </TR>
                <%
                try{
                    ResultSet r=Queries.getExecuteQuery("select * from bunk where location='"+location+"'");
                    while(r.next()){
                   %>
                   <tr>
                       <td><%=r.getString("location")%></td>
                        <td><%=r.getString("area")%></td>
                           <td><%=r.getString("mobile")%></td>
                               <td><a href="SlotsVacancy.jsp?id=<%=r.getString("id")%>">VIEW</a></td>
                   </tr>
                   
                   <%
                    }
                }catch(Exception e){
                    out.println(e);
                }
                
                
                
                %>
            </TABLE>
            
           
            
            
        </center>
        
        
        
    </div>
       </div>
</div>


</body>
</html>