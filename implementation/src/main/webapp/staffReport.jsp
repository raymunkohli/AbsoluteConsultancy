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
          <p><span>Individual Performance Report</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2" class="ax_default label">
        <div id="u2_div" class=""></div>
        <div id="u2_text" class="text ">
          <p><span>Period: ${from} - ${to}</span></p>
        </div>
      </div>
        <div style="top:150px;position:relative"  class="ax_default">
      <table>
          <tr>
              <th>Name </th>
              <th>Job ID </th>
              <th>Task ID </th>
              <th>Department </th>
              <th>Date </th>
              <th>Start time </th>
              <th>Time Taken (Minutes)</th>
              <th>Total(Minutes)</th>
          </tr>
          
          <c:set var="overallTotal" value="0"/>
          <c:forEach items="${Staff}" var="staff" varStatus="Status">
                            <c:choose>
                      <c:when test="${timePerPerson[Status.index] != -1}">
                          <tr style="border-bottom:1px solid black;">
                          <c:set var="overallTotal" value="${overallTotal+timePerPerson[Status.index] }" />
                      </c:when>
                  <c:otherwise>
                  <tr>
                  </c:otherwise>
                  </c:choose>
                  <td>
                      ${staff.firstName} ${staff.surName}
                  </td>
                  <td>${Task[Status.index].jobJobID.jobID} </td>
                  <td>${Base[Status.index].baseTaskID} </td>
                  <td>${Base[Status.index].department} </td>
                  <td>${Task[Status.index].startDate} </td>
                  <td>${startTime[Status.index]} </td>
                  <td>${takenTime[Status.index]} </td>
                  <c:choose>
                      <c:when test="${timePerPerson[Status.index] != -1}">
                          <td>${timePerPerson[Status.index]}</td>
                          <c:set var="overallTotal" value="${overallTotal+timePerPerson[Status.index] }" />
                      </c:when>
                  <c:otherwise>
                      <td> </td>
                  </c:otherwise>
                  </c:choose>
              </tr>
          </c:forEach>
              <tr style="border-top:2px solid black;"><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                  <td style="border-top:2px solid black;border-left:2px solid black;border-right:2px solid black;border-bottom:2px solid black;"> Total Effort : ${overallTotal} Minutes</td>
              </tr>
      </table>
    </div>
    </div>
  </div>
  </body>
</html>
