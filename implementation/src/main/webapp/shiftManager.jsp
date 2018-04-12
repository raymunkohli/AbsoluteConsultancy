<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="shiftCheck.jsp" %>
        <title>Shift manager screen</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/shift_manager_screen/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/shift_manager_screen/data.js"></script>
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
        <div style="width:100%;height:100%;left:25%;position:absolute;">
                    <%
        if(request.getAttribute("newJobAlert").toString().equals("true")){
            %>
            <script>
               var alert = confirm('New Job Detected:\n Customer: <%out.write(request.getAttribute("cust").toString()); %> \n\
Deadline: <%out.write(request.getAttribute("deadline").toString()); %> \n\
Tasks: <%out.write(request.getAttribute("tasks").toString()); %>');
               if(alert){
                   window.location = 'newJobAlertServlet?job=+<% out.write(request.getAttribute("jobid").toString()); %>';
               }

            </script>
            <%
        }        
        %>
        <div id="base" class="">

            <!-- Unnamed (Rectangle) -->

            <!-- Unnamed (Group) -->
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("ShiftManager")) { %>
            <%@include  file="shiftBar.jsp" %>
            <% }%>
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("OfficeManager")) { %>
            <%@include  file="officeBar.jsp" %>
            <% }%>
            <!-- Unnamed (Rectangle) -->
            <form action="generatePerformanceReportServlet" method="post" name="performace" id="performance">
                <div id="u191" class="ax_default label">
                    <div id="u191_div" class=""></div>
                    <div id="u191_text" class="text ">
                        <p><span>Performance report</span></p>
                    </div>
                </div>
                <div id="u191" style="left:500px" class="ax_default label">
                    <div id="u191_text" class="text ">
                        <font color="red"> ${perErr} </font>
                    </div>
                </div>


                <!-- Unnamed (Checkbox) -->
                <div id="u192" class="ax_default checkbox">
                    <label for="u192_input" style="position: absolute;">
                        <div id="u192_text" class="text ">
                            <p><span>Day shift (early)</span></p>
                        </div>
                    </label>
                    <input id="u192_input" type="checkbox" name="dayShiftEarly"/>
                </div>
                <div id="u193" class="ax_default checkbox">
                    <label for="u193_input" style="position: absolute;">
                        <div id="u193_text" class="text ">
                            <p><span>Day shift (late)</span></p>
                        </div>
                    </label>
                    <input id="u192_input" type="checkbox" name="dayShiftLate"/>
                </div>

                <!-- Unnamed (Checkbox) -->
                <div id="u193" class="ax_default checkbox" style="left:300px">
                    <label for="u193_input" style="position: absolute;">
                        <div id="u193_text" class="text ">
                            <p><span>Night shift</span></p>
                        </div>
                    </label>
                    <input id="u193_input" type="checkbox"  name="nightShift"/>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u194" class="ax_default" data-left="31" data-top="213" data-width="170" data-height="24">

                    <!-- Unnamed (Group) -->
                    <div id="u195" class="ax_default" data-left="78" data-top="213" data-width="123" data-height="21">

                        <!-- Unnamed (Text Field) -->
                        <div id="u196" class="ax_default text_field">
                            <input id="u196_input" type="date" name="fromDate" required/>
                        </div>

                        <!-- Unnamed (Shape) -->
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u198" class="ax_default label">
                        <div id="u198_div" class=""></div>
                        <div id="u198_text" class="text ">
                            <p><span>From</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u199" class="ax_default" data-left="336" data-top="213" data-width="144" data-height="24">

                    <!-- Unnamed (Group) -->
                    <div id="u200" class="ax_default" data-left="360" data-top="213" data-width="120" data-height="21">

                        <!-- Unnamed (Text Field) -->
                        <div id="u201" class="ax_default text_field">
                            <input id="u201_input" type="Date" name="toDate" required/>
                        </div>

                        <!-- Unnamed (Shape) -->

                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u203" class="ax_default label">
                        <div id="u203_div" class=""></div>
                        <div id="u203_text" class="text ">
                            <p><span>To</span></p>
                        </div>
                    </div>
                </div>


                <!-- Unnamed (Rectangle) -->
                <div id="u209" class="ax_default button">
                    <div id="u209_div" class=""></div>
                    <div id="u209_text" class="text ">
                        <p><span><input type="submit" value="Generate performance report" /></span></p>
                    </div>
                </div>
            </form>
            <!-- Unnamed (Horizontal Line) -->
            <div id="u210" class="ax_default line">
                <img id="u210_img" class="img " src="images/shift_manager_screen/u210.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u212" class="ax_default label">
                <div id="u212_div" class=""></div>
                <div id="u212_text" class="text ">
                    <p><span>Staff report</span></p>
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u213" class="ax_default line">
                <img id="u213_img" class="img " src="images/shift_manager_screen/u210.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u214" class="ax_default label">
                <div id="u214_div" class=""></div>
                <div id="u214_text" class="text ">
                    <p><span>Customer report</span></p>
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u215" class="ax_default line">
                <img id="u215_img" class="img " src="images/shift_manager_screen/u210.png"/>
            </div>

            <form action="generateCustReportServlet" method="post" name="CustReport"> 
                <!-- Unnamed (Rectangle) -->
                <div id="u217" class="ax_default button">
                    <div id="u217_div" class=""></div>
                    <div id="u217_text" class="text ">
                        <p><span><input type="submit" value="Generate customer report"></span></p> 
                    </div>
                </div>
                <div id="u241" class="ax_default label" style="width:500px;height:300px">
                    <div id="" class="text " style="top:50px;width:500px;position:absolute;">
                        Day: <input type="radio" value="Day" name="group1" required>
                        Month: <input type="radio" value="Month" name="group1">
                        Year: <input type="radio" value="Year" name="group1">

                    </div>
                </div>
                <!-- Unnamed (Group) -->
                <div id="u242" class="ax_default" data-left="31" data-top="724" data-width="170" data-height="24">
                    <div id="u243" class="ax_default" data-left="78" data-top="724" data-width="123" data-height="21">
                        <!-- Unnamed (Text Field) -->
                        <div id="u244" class="ax_default text_field">
                            <input id="u244_input" type="date" value="" name="from" required/>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u246" class="ax_default label">
                        <div id="u246_div" class=""></div>
                        <div id="u246_text" class="text ">
                            <p><span>From</span></p>
                        </div>
                    </div>
                </div>
                <div id="u247" class="ax_default" data-left="336" data-top="724" data-width="144" data-height="24">

                    <!-- Unnamed (Group) -->
                    <div id="u248" class="ax_default" data-left="360" data-top="724" data-width="120" data-height="21">

                        <!-- Unnamed (Text Field) -->
                        <div id="u249" class="ax_default text_field">
                            <input id="u249_input" type="date" value="" name="to" required/>
                        </div>

                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u251" class="ax_default label">
                        <div id="u251_div" class=""></div>
                        <div id="u251_text" class="text ">
                            <p><span>To</span></p>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="<% out.write(request.getParameter("Customer"));%>" name="Cust"/>
                <input type="hidden" value="<% out.write(request.getParameter("CustomerName"));%>" name="name" />
            </form>
            <!-- Unnamed (Rectangle) -->
            <div id="u218" class="ax_default label">
                <div id="u218_div" class=""></div>
                <div id="u218_text" class="text ">
                    <p></p><p></p>
                </div>
            </div>
            <form action="generateStaffReport" method ="post" name="generateStaffReport">
                <!-- Unnamed (Group) -->
                <div id="u219" class="ax_default" data-left="31" data-top="479" data-width="170" data-height="24">

                    <!-- Unnamed (Group) -->
                    <div id="u220" class="ax_default" data-left="78" data-top="479" data-width="123" data-height="21">

                        <div id="u216" class="ax_default button">
                            <div id="u216_div" class=""></div>
                            <div id="u216_text" class="text ">
                                <p><span><input type="submit" value="Generate Staff Report"/></span></p>
                            </div>
                        </div>
                        <!-- Unnamed (Text Field) -->
                        <div id="u221" class="ax_default text_field">
                            <input id="u221_input" type="date" name="fromStaff" required/>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u223" class="ax_default label">
                        <div id="u223_div" class=""></div>
                        <div id="u223_text" class="text ">
                            <p><span>From</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u224" class="ax_default" data-left="264" data-top="479" data-width="144" data-height="24">

                    <!-- Unnamed (Group) -->
                    <div id="u225" class="ax_default" data-left="288" data-top="479" data-width="120" data-height="21">

                        <!-- Unnamed (Text Field) -->
                        <div id="u226" class="ax_default text_field">
                            <input id="u226_input" type="date" value="" name="staffTo" required > 
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u228" class="ax_default label">
                        <div id="u228_div" class=""></div>
                        <div id="u228_text" class="text ">
                            <p><span>To</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Table) -->
                <div id="u229" class="ax_default">
                    <c:if test="${not empty Staff}">
                        <c:set var="AllStaff" value=""/>
                        <table>
                            <tr>
                                <th>Firstname</th>
                                <th>Surname</th>
                                <th>Role</th>
                            </tr>
                            <c:forEach items="${Staff}" var="staff">

                                <tr>
                                    <td>${staff.firstName}</td>
                                    <td>${staff.surName} </td>
                                    <td>${staff.employeeType}</td> 
                                    <c:set var="AllStaff" value="${AllStaff}${staff.staffID}`" />
                                </tr>
                            </c:forEach>
                        </table>
                        <input type="hidden"  value="${AllStaff}" name="allStaff" />
                    </c:if> 


                </div>
            </form>
            <!-- Unnamed (Rectangle) -->
            <div id="u239" class="ax_default label">
                <div id="u239_div" class=""></div>
                <div id="u239_text" class="text ">
                    <p><span>Selected staff</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->

            <!-- Unnamed (Rectangle) -->
            <div id="u241" class="ax_default label">
                <div id="u241_div" class=""></div>
                <div id="u241_text" class="text ">
                    <p><span>Selected customer</span></p>
                </div>
            </div>


            <!-- Unnamed (Droplist) -->
            <div id="u252" class="ax_default droplist" style="width:600px">
                Selected Cust: <% out.write(request.getParameter("CustomerName"));%>
                <input type="hidden" value="<% out.write(request.getParameter("Customer"));%>" name="Cust" form="CustReport"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u253" class="ax_default button">
                <div id="u253_div" class=""></div>
                <div id="u253_text" class="text ">
                    <form method="post" action="SelectCustForReportServlet" > <p><span><input type="submit" value="View customers" ></span></p> </form>
                </div>
            </div>

            <!-- Unnamed (Shape) -->

            <div id="u240" class="ax_default button">
                <div id="u240_div" class=""></div>
                <div id="u240_text" class="text ">
                    <form action="viewStaff" method="post"> <p><span><input type="submit" value="Select staff"></span></p></form>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
