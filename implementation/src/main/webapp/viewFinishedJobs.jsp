<%@ include file="receptionistCheck.jsp" %>
<%-- 
    Document   : viewCustomers
    Created on : 18-Mar-2018, 21:15:19
    Author     : raymun
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head> 
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/receptionist_screen/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/receptionist_screen/data.js"></script>

    </head>
    <body>
        <div id="u88" class="ax_default icon">
            <img id="u88_img" class="img " src="images/receptionist_screen/u88.png"/>
        </div>
        <div id="u83" class="ax_default label">
            <div id="u83_div" class=""></div>
            <div id="u83_text" class="text ">
                <p><span>Mark A Job</span></p>
            </div>
        </div>

        <!-- Unnamed (Horizontal Line) -->
        <div id="u84" class="ax_default line">
            <img id="u84_img" class="img " src="images/receptionist_screen/u84.png"/>
        </div>


        <div style="top:0px;left:50px;position:absolute;font-size: 20px;" class="ax_default">
            Select A Customer
        </div>
        <div style="top:350px;position:relative;" class="ax_default">
            <table class="">
                <tr>
                    <th> Customer Name </th>
                    <th> Account Holder </th>
                    <th> Job ID</th>
                    <th> Status </th>
                    <th> Collect </th>
                </tr>
                <c:forEach items="${Job}" var ="job" varStatus ="s">
                    <tr> <td> ${name[s.index]} </td> <td> ${holder[s.index]} </td> <td>${job}</td>
                        <c:if test="${department[s.index] == 'Finished'}">
                            <td> Finished on Shelf : ${shelf[s.index]} </td> <td> asdawsaw</td>
                        </c:if>

                        <c:if test="${department[s.index] != 'Finished'}">
                            <td> ${department[s.index]} : ${desc[s.index]} </td> <td> n/a </td>
                        </c:if>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </body>
</html>

