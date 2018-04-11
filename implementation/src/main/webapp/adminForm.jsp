<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Admin form</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/admin_form/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/admin_form/data.js"></script>
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
        <div id="base" class="">
            <div id="tophalf" style="position:relative;height:150px">
                            <!-- Unnamed (Rectangle) -->
            <div id="u584" class="ax_default label">
                <div id="u584_div" class=""></div>
                <div id="u584_text" class="text ">
                    <p><span>BIPL Admin</span></p>
                </div>
            </div>

            <!-- Unnamed (Shape) -->

            <!-- Unnamed (Horizontal Line) -->
            <div id="u586" class="ax_default line">
                <img id="u586_img" class="img " src="images/receptionist_screen/u84.png"/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u587" class="ax_default icon">
                <img id="u587_img" class="img " src="images/receptionist_screen/u88.png"/>
            </div>

            <div id="u522" class="ax_default">
                <table>
                    <tr>
                        <th> Staff ID</th>
                        <th> First Name </th>
                        <th> Surname </th>
                        <th> Role </th>
                        <th> Department </th>
                    </tr>
                    <c:forEach items="${Staff}" var="staff" varStatus="Status">
                        <tr> 
                            <td> ${staff.staffID} </td>
                            <td> ${staff.firstName} </td>
                            <td> ${staff.surName} </td>
                            <td> ${staff.employeeType} </td>
                            <td> ${Department[Status.index]} </td>
                        </tr>      
                    </c:forEach>

                </table>

            </div>
            </div>
            <c:forEach items="${Staff}">
                <div id="fakespace" style="height:30px"></div>
            </c:forEach> 
                <div id="bottomhalf" class="" style="position:relative; top:-250px">
            <!-- Unnamed (Rectangle) -->
            <div id="u553" class="ax_default label">
                <div id="u553_div" class=""></div>
                <div id="u553_text" class="text ">
                    Add Staff <div style="left:300px;position:absolute;top:0px;color:#cd0a0a; background:#000000;">${Err}</div>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u554" class="ax_default label">
                <div id="u554_div" class=""></div>
                <div id="u554_text" class="text ">
                    <p><span>Name</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u555" class="ax_default label">
                <div id="u555_div" class=""></div>
                <div id="u555_text" class="text ">
                    <p><span>Surname</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u556" class="ax_default label">
                <div id="u556_div" class=""></div>
                <div id="u556_text" class="text ">
                    <p><span>Role/Privileges</span></p>
                </div>
            </div>
                       <div id="u558" class="ax_default label">
                <div id="u558_div" class=""></div>
                <div id="u558_text" class="text ">
                    <p><span>Password</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->

            <form action="addStaffServlet" method="post">
                <!-- Unnamed (Rectangle) -->
                <div id="u557" class="ax_default label">
                    <div id="u557_div" class=""></div>
                    <div id="u557_text" class="text ">
                        <p><span>Tech Room</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u559" class="ax_default label">
                    <div id="u559_div" class=""></div>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u560" class="ax_default text_field">
                    <input id="u560_input" type="text" value="" name="Name" required/>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u561" class="ax_default text_field">
                    <input id="u561_input" type="text" value=""name="Surname" required/>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u562" class="ax_default text_field">
                    <select name="Type" required>
                        <option value="" selected></option>
                        <option value="Receptionist">Receptionist</option>
                        <option value="Technician">Technician</option>
                        <option value="Shift Manager">ShiftManager</option>
                        <option value="Office Manager">OfficeManager</option>
                    </select> 
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u563" class="ax_default text_field">
                    <select name="Department" >
                        <option value="" selected></option>
                        <option value="Copy">Copy</option>
                        <option value="Packaging">Packaging</option>
                        <option value="Finishing">Finishing</option>
                        <option value="Development">Development</option>
                    </select> 
                </div>
                <div id="u564" class="ax_default text_field">
                    <input id="u564_input" type="password" value="" name="Password" required/>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u565" class="ax_default button">
                    <div id="u565_div" class=""></div>
                    <div id="u565_text" class="text ">
                        <input type="submit" value="Add Staff" />
                    </div>
                </div>
            </form>
            <!-- Unnamed (Rectangle) -->
            <div id="u566" class="ax_default label">
                <div id="u566_div" class=""></div>
                <div id="u566_text" class="text ">
                    
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u567" class="ax_default line">
                <img id="u567_img" class="img " src="images/tasks_form/u142.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u568" class="ax_default label">
                <div id="u568_div" class=""></div>
                <div id="u568_text" class="text ">
                   
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u569" class="ax_default button">
                <div id="u569_div" class=""></div>
                <div id="u569_text" class="text ">
                    <form action="createBackUpServlet" method="post"><p><span><input type="submit" value="Back up now" > </span></p> </form>
                </div>
            </div>


            <!-- Unnamed (Table) -->
            <div id="u571" class="ax_default">
                <table>
                <tr>
                    <th> Date </th>
                    <th> Select </th>
                        
                </tr>
                <c:forEach items="${Files}" var="file">
                    <tr><td>${file.name}</td><td>
                    <form action="restoreFromBackupServlet" method="post"> 
                        <input type="hidden" name="path" value="${file.name}"/>
                    <input type="submit" value="Select" />
                    </form>
                        </td>
                    </tr>
                    
                </c:forEach>
                </table>
            </div>


        </div>
        </div>
    </body>
</html>
