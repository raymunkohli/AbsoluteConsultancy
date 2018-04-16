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
        $axure.utils.getTransparentGifPath = function () {
            return 'resources/images/transparent.gif';
        };
        $axure.utils.getOtherPath = function () {
            return 'resources/Other.html';
        };
        $axure.utils.getReloadPath = function () {
            return 'resources/reload.html';
        };
    </script>
</head>
<body>                  <%
    if (request.getAttribute("first").toString().equals("true")) {
    %>
    <script>
        var alert0 = confirm('PAYMENT HAS NOT BEEN MADE\n\
Customer:<%out.write(request.getAttribute("firstLateAlertName").toString()); %> \n\
Customer ID: <%out.write(request.getAttribute("firstLateAlertID").toString()); %> \n\
Job ID: <%out.write(request.getAttribute("firstLateAlertJobID").toString()); %>');

        if (alert0) {
            window.location = 'latePaymentAlertStopperServlet?job=<% out.write(request.getAttribute("firstLateAlertJobID").toString()); %>&type=1';
        }


    </script>

    <% } %>
    <%
        if (request.getAttribute("second").toString().equals("true")) {
    %>
    <script>
        var reminder1 = confirm('FIRST REMINDER LETTER GENERATED\n\
Customer:<%out.write(request.getAttribute("firstReminderAlertName").toString()); %> \n\
Customer ID: <%out.write(request.getAttribute("firstReminderAlertID").toString()); %> \n\
Job ID: <%out.write(request.getAttribute("firstReminderAlertJobID").toString()); %>');

        if (reminder1) {
            window.location = 'latePaymentAlertStopperServlet?job=<% out.write(request.getAttribute("firstReminderAlertJobID").toString()); %>&type=2';
        }


    </script>

    <% } %>
    <%
        if (request.getAttribute("third").toString().equals("true")) {
    %>
    <script>
        var reminder2 = confirm('ACCOUNT HAS BEEN SUSPENDED AND SECOND REMINDER GENERATED\n\
Customer:<%out.write(request.getAttribute("secondReminderAlertName").toString()); %> \n\
Customer ID: <%out.write(request.getAttribute("secondReminderAlertID").toString()); %> \n\ ' );

        if (reminder2) {
            window.location = 'latePaymentAlertStopperServlet?job=<% out.write(request.getAttribute("secondReminderAlertID").toString()); %>&type=3';
        }


    </script>

    <% } %>
        <%
        if (request.getAttribute("forth").toString().equals("true")) {
    %>
    <script>
        var reminder3 = confirm('ACCOUNT IN DEFAULT\n\
Customer:<%out.write(request.getAttribute("defaultAlertName").toString()); %> \n\
Customer ID: <%out.write(request.getAttribute("defaultAlertID").toString()); %> \n\ ' );

        if (reminder3) {
            window.location = 'latePaymentAlertStopperServlet?job=<% out.write(request.getAttribute("defaultAlertID").toString()); %>&type=4';
        }


    </script>

    <% } %>
    <%
        if (request.getAttribute("isLate").toString().equals("true")) {
    %>
    <script>
        var alert1 = confirm('Deadline will not be met!\n\
Customer: <%out.write(request.getAttribute("affectedCust").toString()); %> \n\
Has made an order (JobID: <%out.write(request.getAttribute("lateID").toString()); %>) which will not be met ontime (<%out.write(request.getAttribute("difference").toString()); %> minutes late) \n\
Contact Phone: <%out.write(request.getAttribute("phone").toString()); %>\n\
Contact Email: <%out.write(request.getAttribute("email").toString()); %>');

        if (alert1) {
            window.location = 'lateJobAlertOfficeServlet?job=<% out.write(request.getAttribute("lateID").toString()); %>';
        }


    </script>

    <% }%>


    <div style="width:100%;height:100%;left:25%;position:absolute;">
        <div id="base" class="">
            <!-- Unnamed (Rectangle) -->
            <a href="completeCustomerServlet">
                <div id="u271" class="ax_default button">
                    <div id="u271_div" class=""></div>
                    <div id="u271_text" class="text ">
                        <p><span>View customers</span></p>
                    </div>
                </div>
            </a>

            <!-- Unnamed (Rectangle) -->
            <a href="latePaymentServlet" >
            <div id="u273" class="ax_default button">
                <div id="u273_div" class=""></div>
                <div id="u273_text" class="text ">
                    <p><span>Manage late payments</span></p>
                </div>
            </div>
            </a>

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
    </div>
</body>


