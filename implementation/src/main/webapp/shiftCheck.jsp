
<% 
   session = request.getSession(true);
   if (session.getAttribute("userType")!= null){
    if(session.getAttribute("userType").equals("OfficeManager") || 
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