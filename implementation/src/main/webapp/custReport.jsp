<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Individual perormance report</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
     <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
    <link href="files/individual_perormance_report/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/individual_perormance_report/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
      <div style="width:100%;height:100%;left:25%;position:absolute;">
    <div id="base" class="">
                    <a href="viewShiftManagerServlet"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />

      <!-- Unnamed (Rectangle) -->
      <div id="u0" class="ax_default label">
        <div id="u0_div" class=""></div>
        <div id="u0_text" class="text ">
          
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u1" class="ax_default label">
        <div id="u1_div" class=""></div>
        <div id="u1_text" class="text ">
          <p><span>Customer Report</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2" class="ax_default label" style="left:150px">
        <div id="u2_div" class=""></div>
        <div id="u2_text" class="text ">
          <p><span>Period: ${from} - ${to}</span></p>
          <div style="left:20px">
            <p> Customer: ${name} </p>
          </div>
        </div>
      </div>
        <div style="top:150px;position:relative;left:100px"  class="ax_default">
      <table>
          <tr>
              <th>Date </th>
              <th>Number of Jobs </th>
              <th>Value Of Jobs </th>
          </tr>
          <c:forEach items="${time}" var="date" varStatus="Status">
              <tr>
                <td>${date}</td>
                <td>${amount[Status.index]}</td>
                <td>${value[Status.index]}</td>
              </tr>
          </c:forEach>
      </table>
    </div>
    </div>
  </div>
  </div>
  </body>
</html>
