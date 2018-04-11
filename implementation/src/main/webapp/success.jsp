<%-- 
    Document   : success
    Created on : 18-Mar-2018, 17:21:15
    Author     : raymun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>

        
        <% 
    session = request.getSession(false);
    if( session.getAttribute("userType").equals("Receptionist") ){
        response.sendRedirect("receptionist_screen.jsp");
       }
    
    else if( session.getAttribute("userType").equals("Technician") ){
        response.sendRedirect("technician_screen.jsp");
           }
    else if (session.getAttribute("userType").equals("ShiftManager")){
        response.sendRedirect("shiftManager.jsp");
    }
     else if (session.getAttribute("userType").equals("OfficeManager")){
        response.sendRedirect("officeManager.jsp");
    }


%>


