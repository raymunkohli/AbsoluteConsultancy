<%-- 
    Document   : changeDiscount
    Created on : 14-Apr-2018, 06:15:31
    Author     : raymun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Set discount</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="files/bands_form/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/set_discount/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/set_discount/data.js"></script>
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
        <div id="base" class="" style="left:25%;position:absolute;">
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("OfficeManager")) { %>
<%@include  file="officeBar.jsp" %>
<% }%>
            <!-- Unnamed (Rectangle) -->
            <div id="u589" class="ax_default label" style="width:500px">
                <div id="u589_div" class=""></div>
                <div id="u589_text" class="text " style="width:500px">
                    <p><span>Manage Tasks</span></p>
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u590" class="ax_default line">
                <img id="u590_img" class="img " src="images/bands_form/u590.png"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div style="position: absolute; top:50px">

                <!-- Unnamed (Rectangle) -->
                <div id="u26" class="ax_default label">
                    <table>
                        <tr><th>ID</th><th>Name</th> <th>Department</th> <th>Description </th> <th>Price </th> <th>Duration</th> <th>Disable </th></tr>
                                <c:forEach items="${tasks}" var="task" >
                            <tr> <td>${task.baseTaskID} </td> <td> ${task.taskName} </td> <td> ${task.department} </td> <td>${task.description}</td> <td>${task.price}</td> <td>${task.duration}</td>
                                <td> <form action="disableTask" method="post"> <input type="submit" value="Disable" ><input type="hidden" value="${task.baseTaskID}" name="id"/> </form>

                                </c:forEach>
                                    <form action="addNewTaskServlet" method="post">
                                        <tr style="border-top: 2px solid black"><td></td><td><input type="text" name="name" required></td>
                                            <td><select name="department" required><option value="" selected></option> <option value="Copy">Copy</option><option value="Development">Development</option><option value="Finishing">Finishing</option><option value="Packaging">Packaging</option></select></td> 
                                        <td><input type="text" name="description" required></td>
                                        <td><input type="number" name="price" step="0.01" required></td>
                                        <td><input type="number" step="1" name="time" required></td>
                                        <td><input type="submit"  value="Add"> </td></tr>
                                    </form>
                    </table>
                </div>
            </div>





        </div>


    </div>
</body>
</html>
