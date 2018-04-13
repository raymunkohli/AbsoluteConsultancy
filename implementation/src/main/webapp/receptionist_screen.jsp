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
            <% if (session.getAttribute("userType") != null && session.getAttribute("userType").equals("ShiftManager")) { %>
            <%@include  file="shiftBar.jsp" %>
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

            <!-- Unnamed (Rectangle) -->
            <div id="tophalf">


            
             <!-- Unnamed (Rectangle) -->
            <form method="post" action="viewCustomerServlet" id="viewCust">
                <div id="u82" class="ax_default html_button">
                    <input id="u2_input" type="submit" value="View Customers" form="viewCust"/>
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

            <!-- Unnamed (Group) -->
            <div id="u9" class="ax_default" data-left="690" data-top="651" data-width="247" data-height="284">

                <!-- Unnamed (Text Area) -->
                <div id="u10" class="ax_default text_area">
                    <textarea id="u10_input"></textarea>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u11" class="ax_default label">
                    <div id="u11_div" class=""></div>
                    <div id="u11_text" class="text ">
                        <p><span style="text-decoration:underline;">Notification bar</span></p>
                    </div>
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
                    <input id="u73_input" type="submit" value="Add Customer"/>
                </div>
            </form>
            
            </div>
                    <c:forEach items="${SelectedTasks}" var="tasks">
                        <c:out value="<div id='fakespace'></div>" escapeXml="false"/>
                    </c:forEach>


            <div id="bottomhalf">
                            <!-- Unnamed (Rectangle) -->
            <div id="u37" class="ax_default html_button">
                <form action ="addTaskServlet" method ="post"> 
                    <input id="u37_input" type="submit" value="Add Task to Job"/>
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

            <!-- Unnamed (Group) -->
            <div id="u54" class="ax_default" data-left="20" data-top="754" data-width="660" data-height="130">

                <!-- Unnamed (Group) -->
                <div id="u55" class="ax_default" data-left="304" data-top="754" data-width="81" data-height="17">

                    <!-- Unnamed (Rectangle) -->
                    <div id="u56" class="ax_default label">
                        <div id="u56_div" class=""></div>
                        <div id="u56_text" class="text ">
                            <p><span style="text-decoration:underline;">Current Jobs</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Table) -->
                <div id="u57" class="ax_default">

                    <!-- Unnamed (Table Cell) -->
                    <div id="u58" class="ax_default table_cell">
                        <img id="u58_img" class="img " src="images/receptionist_screen/u58.png"/>
                        <div id="u58_text" class="text ">
                            <p><span>ID</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u59" class="ax_default table_cell">
                        <img id="u59_img" class="img " src="images/receptionist_screen/u59.png"/>
                        <div id="u59_text" class="text ">
                            <p><span>Customer</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u60" class="ax_default table_cell">
                        <img id="u60_img" class="img " src="images/receptionist_screen/u60.png"/>
                        <div id="u60_text" class="text ">
                            <p><span>Status</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u61" class="ax_default table_cell">
                        <img id="u61_img" class="img " src="images/receptionist_screen/u61.png"/>
                        <div id="u61_text" class="text ">
                            <p><span>Location</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u62" class="ax_default table_cell">
                        <img id="u62_img" class="img " src="images/receptionist_screen/u62.png"/>
                        <div id="u62_text" class="text ">
                            <p><span>Deadline</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u63" class="ax_default table_cell">
                        <img id="u63_img" class="img " src="images/receptionist_screen/u63.png"/>
                        <div id="u63_text" class="text ">
                            <p><span>34</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u64" class="ax_default table_cell">
                        <img id="u64_img" class="img " src="images/receptionist_screen/u64.png"/>
                        <div id="u64_text" class="text ">
                            <p><span>M.Lark</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u65" class="ax_default table_cell">
                        <img id="u65_img" class="img " src="images/receptionist_screen/u65.png"/>
                        <div id="u65_text" class="text ">
                            <p><span>Use of small copy camera</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u66" class="ax_default table_cell">
                        <img id="u66_img" class="img " src="images/receptionist_screen/u66.png"/>
                        <div id="u66_text" class="text ">
                            <p><span>Copy Room</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u67" class="ax_default table_cell">
                        <img id="u67_img" class="img " src="images/receptionist_screen/u67.png"/>
                        <div id="u67_text" class="text ">
                            <p><span>22/02/19</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u68" class="ax_default table_cell">
                        <img id="u68_img" class="img " src="images/receptionist_screen/u68.png"/>
                        <div id="u68_text" class="text ">
                            <p><span>Etc.</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u69" class="ax_default table_cell">
                        <img id="u69_img" class="img " src="images/receptionist_screen/u69.png"/>
                        <div id="u69_text" class="text ">
                            <p><span>Etc.</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u70" class="ax_default table_cell">
                        <img id="u70_img" class="img " src="images/receptionist_screen/u70.png"/>
                        <div id="u70_text" class="text ">
                            <p><span>Etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u71" class="ax_default table_cell">
                        <img id="u71_img" class="img " src="images/receptionist_screen/u71.png"/>
                        <div id="u71_text" class="text ">
                            <p><span>Etc.</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u72" class="ax_default table_cell">
                        <img id="u72_img" class="img " src="images/receptionist_screen/u72.png"/>
                        <div id="u72_text" class="text ">
                            <p><span>Etc</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->


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

                        <div id="u89" class="ax_default button">
                <div id="u89_div" class=""></div>
                <div id="u89_text" class="text ">
                    <p><span><form action="payment.jsp"><input id="u8_input" type="submit" value="Submit" form="addJobForm"/></form></span></p>
                </div>
            </div>
            
            
            </form>
            

            <!-- Unnamed (Rectangle) -->
            <div id="u80" class="ax_default button">
                <div id="u80_div" class=""></div>
                <div id="u80_text" class="text ">
                    <p><span><form action="createInvoice.jsp"><input type="submit" value="Invoice"></form></span></p>
                </div>
            </div>



           
            
            <!-- Unnamed (Rectangle) -->
            <div id="u87" class="ax_default label">
                <div id="u87_div" class=""></div>
                <div id="u87_text" class="text ">

                    <p><span>Price per Job: £ <c:if test="${not empty totalPrice}"><c:out value="${totalPrice}"/></c:if></span></p>
                    <p><span> Number of Jobs: <input id="u8_input" type="text" value="1" name="numjob" form="addJobForm" style="width:30px" required/>
                    <p><c:if test="${not empty Err}"><c:out value="${Err}"/></c:if>
                </div>
            </div>


            <!-- Unnamed (Rectangle) -->
            <div id="u81" class="ax_default button">
                <div id="u89_div" class=""></div>
                <div id="u89_text" class="text " style="top:8px">
                    <p><span><form action="payment.jsp"><input type="submit" value="Payment"></form></span></p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
