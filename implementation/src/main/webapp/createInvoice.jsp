<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="receptionistCheck.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment form</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/payment_form/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/payment_form/data.js"></script>
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
    <body>
                        <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("OfficeManager")) { %>
        <%@include  file="officeBar.jsp" %>
        <% }%>
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("ShiftManager")) { %>
            <%@include  file="shiftBar.jsp" %>
            <% }%>
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("Receptionist")) { %>
                        <%@include  file="receptionistBar.jsp" %>
            <% }%>
<div style="width:100%;height:100%;left:25%;position:absolute;">
    
        <div style='position:relative;height:170px;z-index: 1'>
            <div id="u475" class="ax_default button">
                <div id="u475_div" class=""></div>
                <div id="u475_text" class="text ">
                    <form action="viewInvoiceCust" method="post">
                        <p><span>
                                <input type="submit" value="View customer list"/>
                            </span></p></form>
                </div>
            </div>    
            <div id="u471" class="ax_default label">
                <div id="u471_div" class=""></div>
                <div id="u471_text" class="text ">
                    <p><span>Create an Invoice</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <!-- Unnamed (Horizontal Line) -->
            <div id="u472" class="ax_default line">
                <img id="u472_img" class="img " src="images/receptionist_screen/u84.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u401" class="ax_default label">
                <div id="u401_div" class=""></div>
                <div id="u401_text" class="text ">
                    <p><span>Select customer</span></p>
                </div>
            </div>
            <!-- Unnamed (Table) -->
            <form action="totalInvoiceServlet" method="post" name="selectJobsForm" id="selectJobsForm">
                <div id="u402" class="ax_default">
                    <c:set var="TotalPrice" value="0"/>
                    <table>
                        <tr>
                            <th> Job ID</th>
                            <th> Price (inc Discount) </th>
                            <th> Order Date </th>
                            <th> DeadLine </th>
                            <th> Select </th>
                        </tr>
                        <c:forEach items="${Jobs}" var="Jobs">
                            <tr>
                                <td> <c:out value="${Jobs.jobID}" /> </td>
                                <td> <c:out value="${Jobs.value}" /> </td> 
                                <td> <c:out value="${Jobs.orderDate}" /> </td>
                                <td> <c:out value="${Jobs.deadline}" /> </td>
                                <td> <input type="checkbox" name="${Jobs.jobID}" value ="${Jobs.jobID}`${Jobs.value}`${Jobs.orderDate}`${Jobs.deadline}"/> </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </form>
        </div>
        <c:forEach items="${Jobs}">
            <div id="fakespace"></div>

        </c:forEach>


        <div style='position:relative;top:-200px;'>
            <div id="u474" class="ax_default label">
                <div id="u474_div" class=""></div>
                <div id="u474_text" class="text ">
                    <p><span><input type="submit" value="Select Jobs" form="selectJobsForm"/></span></p>
                </div>
            </div>
        </div>
        <c:if test="${jobsselected == true}">
            <div style='position:relative;z-index:1;top:-170px'/>
            <form name="viewInvoice" action="viewInvoiceServlet" method ="post" id="viewInvoice"/>
            <c:set var="numberofjobs" value="0"/>
            <c:forEach items="${selectedJobs}" var="jobs" varStatus="jobStatus">
                <input type="hidden" value="${jobs.jobID}" name="${jobStatus.index}" />
                <c:set var="numberofjobs" value="${numberofjobs+1}"/>
            </c:forEach>
                <input type="hidden" value="${numberofjobs}" name="numberofjobs"/>
        <!-- Unnamed (Rectangle) -->
        <div id="u474" class="ax_default label">
            <div id="u474_div" class=""></div>
            <div id="u474_text" class="text ">
                <input type="submit" value="View Invoice" form="viewInvoice"/>
            </div>
        </div>
        <!-- Unnamed (Rectangle) -->
        <div id="u476" class="ax_default label">
            <div id="u476_div" class=""></div>
            <div id="u476_text" class="text ">
            </div>
            </div>
    </c:if>
</div>
</div>
</body>
</html>
