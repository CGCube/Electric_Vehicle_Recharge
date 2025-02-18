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
try{

   
    String id=request.getParameter("id");
String slots=request.getParameter("slots");
String capacity=request.getParameter("capacity");
String mctime=request.getParameter("mctime");

    
    String query="update bunk set slots='"+slots+"',capacity='"+capacity+"',mctime='"+mctime+"'where id='"+id+"'";
   int i=Queries.getExecuteUpdate(query);
    if(i>0){
     

%>
      <script type='text/javascript'>
          window.alert("Successful...!!");
          window.location="ManageRechargeSlot.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Failed..!!");
          window.location="ManageRechargeSlot.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>