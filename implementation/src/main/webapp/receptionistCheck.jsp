<%-- 
    Document   : receptionistCheck
    Created on : 18-Mar-2018, 20:48:41
    Author     : raymun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
   session = request.getSession(true);
   if (session.getAttribute("userType")!= null){
    if( session.getAttribute("userType").equals("Receptionist") || 
        session.getAttribute("userType").equals("OfficeManager") || 
        session.getAttribute("userType").equals("ShiftManager") ){
    }
    else{
        response.sendRedirect("index.jsp");
       
        }
   }
   else{
        response.sendRedirect("index.jsp");    
    }
    %>