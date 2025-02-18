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
int slotno=Integer.parseInt(request.getParameter("slotno"));

ResultSet r=Queries.getExecuteQuery("select * from bunk where id='"+id+"'");
int c=0;
if(r.next()){
    c=Integer.parseInt(r.getString("slots"));
}
c=c-slotno;
    
    String query="update bunk set slots='"+c+"'where id='"+id+"'";
   int i=Queries.getExecuteUpdate(query);
    if(i>0){
     

%>
      <script type='text/javascript'>
          window.alert("Successful...!!");
          window.location="SearchBunk.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Failed..!!");
          window.location="SearchBunk.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>