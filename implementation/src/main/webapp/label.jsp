<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Label</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/label/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/label/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">
        <a href="receptionist_screen.jsp"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />

      <!-- Unnamed (Rectangle) -->
      <div id="u0" class="ax_default label">
        <div id="u0_div" class=""></div>
        <div id="u0_text" class="text ">
          <p><span>Job Label</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u1" class="ax_default line">
        <img id="u1_img" class="img " src="images/label/u1.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2" class="ax_default label">
        <div id="u2_div" class=""></div>
        <div id="u2_text" class="text ">
          <p><span>Job ID: ${jobid}</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u3" class="ax_default label">
        <div id="u3_div" class=""></div>
        <div id="u3_text" class="text ">
          <p><span>Tasks</span></p>
          <table>
              <tr> <th>Task name</th> <th>Department</th> </tr>
              <c:forEach items="${tasks}" var="task" varStatus="s">
                  <tr> <td> ${task} </td> <td>${desc[s.index]}</td> </tr>
              </c:forEach>
          </table>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u4" class="ax_default label">
        <div id="u4_div" class=""></div>
        <div id="u4_text" class="text ">
          <p><span>Name: ${name}</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u5" class="ax_default label">
        <div id="u5_div" class=""></div>
        <div id="u5_text" class="text ">
          <p><span>Deadline: ${deadline}</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u6" class="ax_default label">
        <div id="u6_div" class=""></div>
        <div id="u6_text" class="text ">
          <p><span>Special Inst:${spec}</span></p>
        </div>
      </div>
    </div>
  </body>
</html>
