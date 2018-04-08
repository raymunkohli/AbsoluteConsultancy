<%-- 
    Document   : viewStaff
    Created on : 08-Apr-2018, 06:18:54
    Author     : raymun
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin form</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/admin_form/styles.css" type="text/css" rel="stylesheet"/>
    <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/admin_form/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
    <body> 
        <!-- shift manager check goes around here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
      <div id="u584" class="ax_default label">
        <div id="u584_div" class=""></div>
        <div id="u584_text" class="text ">
          <p><span>BIPL Admin</span></p>
        </div>
      </div> 
        
      <!-- Unnamed (Horizontal Line) -->
      <div id="u586" class="ax_default line">
        <img id="u586_img" class="img " src="images/receptionist_screen/u84.png"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u587" class="ax_default icon">
        <img id="u587_img" class="img " src="images/receptionist_screen/u88.png"/>
      </div>
      <form action="${redirect}" method="post" />
           <div id="u522" class="ax_default">
               <table>
                   <tr>
                       <th>Firstname</th>
                       <th>Surname</th>
                       <th>Role</th>
                       <th>Select</th>
                   </tr>
                   <c:forEach items="${Staff}" var="staff">
                       <tr>
                           <td>${staff.firstName}</td>
                           <td>${staff.surName} </td>
                           <td>${staff.employeeType}</td>
                           <td> <input type="checkbox" value="${staff.staffID}`${staff.firstName}`${staff.surName}`${staff.employeeType}" name="${staff.staffID}"/> </td>
                       </tr>
                   </c:forEach>
               </table>
               
           </div>
      <input type ="submit" value="Select Staff" style="position:relative;left:600px;"/>
    </form>
      
    </body>
</html>
