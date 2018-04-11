<%-- 
    Document   : officeManager
    Created on : 11-Apr-2018, 05:57:33
    Author     : raymun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("OfficeManager")) { %>
        <%@include  file="officeBar.jsp" %>
        <% }%>
  <head>
    <title>Office Manager</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/office_manager/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/office_manager/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">


      <!-- Unnamed (Rectangle) -->
      <div id="u271" class="ax_default button">
        <div id="u271_div" class=""></div>
        <div id="u271_text" class="text ">
          <p><span>View customers</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u272" class="ax_default button">
        <div id="u272_div" class=""></div>
        <div id="u272_text" class="text ">
          <p><span>Payment</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u273" class="ax_default button">
        <div id="u273_div" class=""></div>
        <div id="u273_text" class="text ">
          <p><span>Manage late payments</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <a href="viewAdminServlet">
      <div id="u274" class="ax_default button">
        <div id="u274_div" class=""></div>
        <div id="u274_text" class="text ">
          <p><span>Admin</span></p>
        </div>
      </div>
      </a>

      <!-- Unnamed (Rectangle) -->
      <div id="u275" class="ax_default button">
        <div id="u275_div" class=""></div>
        <div id="u275_text" class="text ">
          <p><span>Bands</span></p>
        </div>
      </div>

    </div>
  </body>


