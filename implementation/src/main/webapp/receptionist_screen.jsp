<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : receptionist_screen
    Created on : 18-Mar-2018, 19:19:09
    Author     : raymun
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("OfficeManager")) { %>
<%@include  file="officeBar.jsp" %>
<% }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="receptionistCheck.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Receptionist screen</title>
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
        <div id="base" class="" style="width:100%;height:100%;left:25%;position:absolute;" >
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("ShiftManager")) { %>
            <%@include  file="shiftBar.jsp" %>
            <% }%>
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("Receptionist")) { %>
<%@include  file="receptionistBar.jsp" %>
<% }%>
            <!-- Unnamed (Rectangle) -->
            <div id="tophalf">



                <!-- Unnamed (Rectangle) -->
                <form method="post" action="viewCustomerServlet" id="viewCust">
                    <div id="u82" class="ax_default html_button">
                        <input id="u2_input" class="button" type="submit" style="left:-2px"value="View Customers" form="viewCust"/>
                    </div>
                </form>
                <!-- Unnamed (Rectangle) -->
                <div id="u83" class="ax_default label">
                    <div id="u83_div" class=""></div>
                    <div id="u83_text" class="text ">
                        <p><span>Receptionist</span></p>
                    </div>
                </div>

                <!-- Unnamed (Horizontal Line) -->
                <div id="u84" class="ax_default line">
                    <img id="u84_img" class="img " src="images/receptionist_screen/u84.png"/>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u85" class="ax_default label">
                    <div id="u85_div" class=""></div>
                    <div id="u85_text" class="text ">
                        <p><span><%
                            if (session.getAttribute("CustomerFirst") != null) {
                                out.write("Selected Customer: " + session.getAttribute("CustomerFirst") + " " + session.getAttribute("CustomerLast"));
                            }
                                %>
                            </span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u86" class="ax_default label">
                    <div id="u86_div" class=""></div>
                    <div id="u86_text" class="text ">
                        <p><span>
                                <%
                                    if (session.getAttribute("DiscountType") != null) {
                                        if (session.getAttribute("DiscountType").equals("None")) {
                                            out.write("No Discount");

                                        } else if (session.getAttribute("DiscountType").equals("Variable Discount")) {

                                            out.write("Variable Discount");
                                        } else {
                                            out.write(session.getAttribute("DiscountType") + " at " + session.getAttribute("Discount") + "%");
                                        }
                                    }
                                %>         
                            </span></p>
                    </div>
                </div>


                <!-- Unnamed (Rectangle) -->
                <div id="u12" class="ax_default label">
                    <div id="u12_div" class=""></div>
                    <div id="u12_text" class="text ">
                        <p><span>Select customer</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u13" class="ax_default label">
                    <div id="u13_div" class=""></div>
                    <div id="u13_text" class="text ">
                        <p><span style="text-decoration:underline;">New job</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u14" class="ax_default label">
                    <div id="u14_div" class=""></div>
                    <div id="u14_text" class="text ">
                        <p><span>Tasks</span></p>
                    </div>
                </div>

                <!-- Unnamed (Table) -->
                <div id="u15" class="ax_default">

                    <!-- Unnamed (Table Cell) -->
                    <table>
                        <tr>
                            <th> Task Id </th>
                            <th> Name </th>
                            <th> Description </th>
                            <th> Price (before discount)</th>
                            <th> Discount </th>  
                            <th> Price (after discount </th>
                        </tr>
                        <c:set var="totalTime" value="0" />
                        <c:set var="totalPrice" value="0"/>
                        <c:set var="totalTasks" value=""/>
                        <c:forEach items="${SelectedTasks}" var="tasks" varStatus="taskStatus">
                            <tr>
                                <td><c:out value="${tasks.baseTaskID}"/></td>
                                <td><c:out value="${tasks.taskName}"/></td>
                                <td><c:out value="${tasks.description}"/></td>
                                <td><c:out value="${tasks.price}"/></td>
                                <td> <c:out value= "${calculatedDiscounts[taskStatus.index]}"/> </td>
                                <td> <c:set var="taskWithDiscount" value="${tasks.price * ((100-calculatedDiscounts[taskStatus.index])/100)}" />
                                    <fmt:formatNumber maxFractionDigits="2" value="${taskWithDiscount}" var="taskWithDiscount" />
                                    <c:set var="totalPrice" value="${totalPrice + taskWithDiscount}"/>
                                    <c:out value="${taskWithDiscount}"/> </td>
                                    <c:set var="totalTasks" value="${totalTasks}${tasks.baseTaskID}`"/>
                            </tr>
                            <input type="hidden" value="${tasks.baseTaskID}" name="${tasks.baseTaskID}" form="addJobForm"/>
                            <c:set var="totalTime" value="${totalTime+tasks.duration}"/> 
                        </c:forEach>
                        <input type="hidden" value="${totalTime}" name="TotalTime" form="addJobForm" />
                        <input type="hidden" value="${totalTasks}" name="TotalTasks" form="addJobForm"/>
                    </table>
                </div>



                <!-- Unnamed (Rectangle) -->
                <div id="u38" class="ax_default label">
                    <div id="u38_div" class=""></div>
                    <div id="u38_text" class="text ">
                        <p><span>Name</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u39" class="ax_default label">
                    <div id="u39_div" class=""></div>
                    <div id="u39_text" class="text ">
                        <p><span>Surname</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u40" class="ax_default label">
                    <div id="u40_div" class=""></div>
                    <div id="u40_text" class="text ">
                        <p><span>Phone&nbsp; </span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u41" class="ax_default label">
                    <div id="u41_div" class=""></div>
                    <div id="u41_text" class="text ">
                        <p><span>Email</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u42" class="ax_default label">
                    <div id="u42_div" class=""></div>
                    <div id="u42_text" class="text ">
                        <p><span>Address</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u43" class="ax_default label">
                    <div id="u43_div" class=""></div>
                    <div id="u43_text" class="text ">
                        <p><span>Postcode/ZIP</span></p>
                    </div>
                </div>

                <form method="post" action ="addCustomerServlet">
                    <!-- Unnamed (Text Field) -->
                    <div id="u44" class="ax_default text_field">
                        <input name="name" type="text" value="" required/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u45" class="ax_default text_field">
                        <input name="surname" type="text" value="" required/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u46" class="ax_default text_field">
                        <input name="phone" type="text" value="" required/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u47" class="ax_default text_field">
                        <input name="email" type="text" value="" required/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u48" class="ax_default text_field">
                        <input name="address" type="text" value="" required/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u49" class="ax_default text_field">
                        <input name="postcode" type="text" value="" required/>
                    </div>
                    <div id="u49a" class="ax_default text_field">
                        Holder: <input name="holder" type="text" value="" required/>
                    </div>
                    <div id="u73" class="ax_default html_button">
                        <input id="u73_input" class="button" type="submit" style="left:-0px;top:-0px"value="Add Customer"/>
                    </div>
                </form>

            </div>
            <c:forEach items="${SelectedTasks}" var="tasks">
                <c:out value="<div id='fakespace' style='height:50px;'></div>" escapeXml="false"/>
            </c:forEach>


            <div id="bottomhalf">
                <!-- Unnamed (Rectangle) -->
                <div id="u37" class="ax_default html_button">
                    <form action ="addTaskServlet" method ="post"> 
                        <input id="u37_input" class="button" type="submit" style="left:-1px"value="Add Task to Job"/>
                    </form>

                </div>
                <!-- Unnamed (Rectangle) -->
                <div id="u52" class="ax_default label">
                    <div id="u52_div" class=""></div>
                    <div id="u52_text" class="text ">
                        <p><span>Special instructions</span></p>
                    </div>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u53" class="ax_default text_field">
                    <input id="u53_input" name="SpecInstruct" type="text" value="" form="addJobForm" required />
                </div>








                <form action="addJobServlet" method="post" id="addJobForm" name="addJobForm">
                    <!-- Unnamed (Checkbox) -->
                    <div id="u74" class="ax_default checkbox">
                        <label for="u74_input" style="position: absolute;">

                            <div id="u74_text" class="text ">
                                <p><input id="Urgent" name="Type" type="radio" value="urgent" required/>
                                    <span> Urgent</span></p>
                            </div>
                        </label>
                    </div>

                    <!-- Unnamed (Checkbox) -->
                    <div id="u75" class="ax_default checkbox">
                        <label for="u75_input" style="position: absolute;">
                            <div id="u75_text" class="text">
                                <p><input id="Stipulated" name="Type" type="radio" value="stipulated"/>
                                    Stipulated |
                                    Surcharge : <input id="StipulatedAmount" name="StipulatedAmount" type="number" style="width:50px;-moz-appearance:textfield;" step="0.01"/>
                                    Time : <input id="StipulatedTime" name="StipulatedTime" type="time"/></p>
                        </label>
                    </div>
            </div>

            <!-- Unnamed (Group) -->
            <div id="u76" class="ax_default" data-left="545" data-top="572" data-width="101" data-height="21">

                <!-- Unnamed (Text Field) -->
                <div id="u77" class="ax_default text_field">

                </div>

                <!-- Unnamed (Shape) -->
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u79" class="ax_default label">
                <div id="u79_div" class=""></div>
                <div id="u79_text" class="text ">
                    <p><span><input id="regular" name="Type" type="radio" value="regular"/> Regular </span></p>
                </div>
            </div>

            <div id="u8" class="ax_default html_button">

            </div>

            <input type="hidden" value="${totalPrice}" name="Price"/>

            <div id="u89" class="ax_default">
                <div id="u89_text" class="text ">
                    <p><span><input style="top:-20px;left:0px;width:140px" id="u8_input" class="button" type="submit" value="Submit" form="addJobForm"/></span></p>
                </div>
            </div>
             
            <a href ="viewFinishedJobsServlet">
            <div id="u89" class="ax_default button" style="top:760px">
                <div id="u89_div" class=""></div>
                <div id="u89_text" class="text ">
                    <p><span>View Finished Jobs</span></p>
                </div>
            </div>
            </a>
            
            
            
        </form>


        <!-- Unnamed (Rectangle) -->
        <a href="createInvoice.jsp">
        <div id="u80" class="ax_default button">
            <div id="u80_div" class=""></div>
            <div id="u80_text" class="text ">
                <p><span>Invoice</span></p>
            </div>
        </div>
            </a>





        <!-- Unnamed (Rectangle) -->
        <div id="u87" class="ax_default label">
            <div id="u87_div" class=""></div>
            <div id="u87_text" class="text ">

                <p><span>Price per Job: £ <c:if test="${not empty totalPrice}"><c:out value="${totalPrice}"/></c:if></span></p>
                    <p><span> Number of Jobs: <input id="u8_input" type="text" value="1" name="numjob" form="addJobForm" style="width:30px" required/>
                            <div style="background-color: #000000;color:red;width:150px"><p><c:if test="${not empty Err}"><c:out value="${Err}"/></c:if> </div>
                            </div>
                            </div>


                            <!-- Unnamed (Rectangle) -->
                            <a href="payment.jsp">
                        <div id="u81" class="ax_default button">
                            <div id="u89_div" class=""></div>
                            <div id="u89_text" class="text " style="top:8px">
                                <p><span>Payment</span></p>
                            </div>
                        </div>
                            </a>
           
               <a href="index.jsp">
                                <input type="button" class="footer button" style="width:auto"value="LOGOUT">
                </div>            </a>
        </div>
                           
                            
</body>
</html>
