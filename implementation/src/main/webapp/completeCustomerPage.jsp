<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Customers form</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="files/customers_form/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/customers_form/data.js"></script>
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

        <%@include  file="officeBar.jsp" %>

   
        <div id="base" class="" style="left:25%;position:absolute;">
            <div id="tophalf" style="position:relative;height:160px">
                <!-- Unnamed (Rectangle) -->
                <div id="u349" class="ax_default label">
                    <div id="u349_div" class=""></div>
                    <div id="u349_text" class="text ">
                        <p><span>Customer accounts</span></p>
                    </div>
                </div>


                <!-- Unnamed (Horizontal Line) -->
                <div id="u350" class="ax_default line">
                    <img id="u350_img" class="img " src="images/receptionist_screen/u84.png"/>
                </div>
                <div id="u349" class="ax_default label">
                    <div id="u349_div" class=""></div>
                    <div id="u349_text" class="text " style="top:30px;font-size:20px">
                        <p><span>Select a Customer</span></p>
                    </div>
                </div>


                <!-- Unnamed (Table) -->
                <div id="u278" class="ax_default">
                    <table class="">
                        <tr>
                            <th> Customer ID </th>
                            <th> Account Holder </th>
                            <th> First Name </th>
                            <th> Last Name </th>
                            <th> Email </th>
                            <th> Address </th>
                            <th> Postcode </th>
                            <th> Phone Number</th>
                            <th> Valued </th>
                            <th> Discount type </th>
                            <th> Select </th>
                        </tr>
                        <c:forEach items="${allCustomers}" var ="cust" varStatus ="custStatus">


                            <tr>
                            <form action="completeCustomerServlet" method="post">
                                <td> <c:out value="${cust.customerID}" /> <input type="hidden" name="id" value="${cust.customerID}"></td>
                                <td> <c:out value="${cust.holder}" /> <input type="hidden" name="holder" value="${cust.holder}"></td>
                                <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
                                <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
                                <td> <c:out value="${cust.email}" /> <input type="hidden" name="email" value="${cust.email}"></td>
                                <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
                                <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="postcode" value="${cust.postcode}"></td>
                                <td> <c:out value="${cust.phoneNo}" /> <input type="hidden" name="phonenumber" value="${cust.phoneNo}"></td>
                                <td> <c:out value="${valued[custStatus.index]}" /> <input type="hidden" name="valued" value="${valued[custStatus.index]}"></td>
                                <td> 
                                    <c:choose>
                                        <c:when test="${discountType[custStatus.index] == 'Variable Discount'}">
                                            <c:out value="${discountType[custStatus.index]}"/>
                                        </c:when>
                                        <c:when test="${discountType[custStatus.index] == 'None'}">
                                            <c:out value="${discountType[custStatus.index]}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${discountType[custStatus.index]} at : ${discount[custStatus.index]}" /> 
                                        </c:otherwise>
                                    </c:choose>
                                    <input type="hidden" name="discountType" value="${discountType[custStatus.index]}">
                                    <input type="hidden" name="discount" value ="${discount[custStatus.index]}" /> </td>
                                <td> <input type="submit" value ="select"/> </td>
                            </form>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <c:forEach items="${allCustomers}" var ="cust" varStatus ="custStatus">
                <div id="fakespace" style="position:relative;height:35px">

                </div>
            </c:forEach>
            <!-- Unnamed (Table) -->
            <div id="bottomhalf" style="position:relative;top:-200px">
                <div id="u315" class="ax_default">
                    <table class="">
                <tr>
                    <th> Customer ID </th>
                    <th> Account Holder </th>
                    <th> First Name </th>
                    <th> Last Name </th>
                    <th> Email </th>
                    <th> Address </th>
                    <th> Postcode </th>
                    <th> Phone Number</th>
                    <th> Remove Default Status </th>
                </tr>
                <c:forEach items="${default}" var ="cust">
                    <tr>
                    <form action="removeDefaultServlet" method="post">
                        <td> <c:out value="${cust.customerID}" /> <input type="hidden" name="id" value="${cust.customerID}"></td>
                        <td> <c:out value="${cust.holder}" /> <input type="hidden" name="holder" value="${cust.holder}"></td>
                        <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
                        <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
                        <td> <c:out value="${cust.email}" /> <input type="hidden" name="email" value="${cust.email}"></td>
                        <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
                        <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="status" value="${cust.postcode}"></td>
                        <td> <c:out value="${cust.phoneNo}" /> <input type="hidden" name="phonenumber" value="${cust.phoneNo}"></td>
                        <td> <input type="submit" value="Select" > </td>
                    </form>
                    </tr>

                </c:forEach>
            </table>
                    
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u344" class="ax_default label">
                    <div id="u344_div" class=""></div>
                    <div id="u344_text" class="text ">
                        <p><span>Default accounts</span></p>
                    </div>
                </div>

                <!-- Unnamed (Horizontal Line) -->
                <div id="u345" class="ax_default line">
                    <img id="u345_img" class="img " src="images/customers_form/u345.png"/>
                </div>



                <% if (request.getParameter("id")!=null) { %>
                <!-- Unnamed (Rectangle) -->
                <div style="position:relative">
                    <div id="u351" class="ax_default label">
                        <div id="u351_div" class=""></div>
                        <div id="u351_text" class="text ">
                            <p><span>Name</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u352" class="ax_default label">
                        <div id="u352_div" class=""></div>
                        <div id="u352_text" class="text ">
                            <p><span>Surname</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u353" class="ax_default label">
                        <div id="u353_div" class=""></div>
                        <div id="u353_text" class="text ">
                            <p><span>Phone&nbsp; </span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u354" class="ax_default label">
                        <div id="u354_div" class=""></div>
                        <div id="u354_text" class="text ">
                            <p><span>Email</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u355" class="ax_default label">
                        <div id="u355_div" class=""></div>
                        <div id="u355_text" class="text ">
                            <p><span>Address</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u356" class="ax_default label">
                        <div id="u356_div" class=""></div>
                        <div id="u356_text" class="text ">
                            <p><span>Postcode/ZIP</span></p>
                        </div>
                    </div>
                    <form method="post" action="updateCustomerServlet">
                        <input type="hidden" value="<% out.write(request.getParameter("id"));%>" name="id">
                        <!-- Unnamed (Text Field) -->
                        <div id="u357" class="ax_default text_field">
                            <input id="u357_input" type="text" name="firstname" value="<% out.write(request.getParameter("firstname"));%>"/>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u358" class="ax_default text_field">
                            <input id="u358_input" type="text" name="surname" value="<% out.write(request.getParameter("lastname"));%>"/>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u359" class="ax_default text_field">
                            <input id="u359_input" type="text" name="phone" value="<% out.write(request.getParameter("phonenumber"));%>"/>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u360" class="ax_default text_field">
                            <input id="u360_input" type="text" name="email" value="<% out.write(request.getParameter("email"));%>"/>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u361" class="ax_default text_field">
                            <input id="u361_input" type="text" name="address" value="<% out.write(request.getParameter("address"));%>"/>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u362" class="ax_default text_field">
                            <input id="u362_input" type="text" name="postcode" value="<% out.write(request.getParameter("postcode"));%>"/>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u363" class="ax_default button">
                           
                            <div id="u363_text" class="text ">
                                <p><span><input type="submit" class="button" style="top:-30px;left:-30px" value="Save changes" /></span></p>
                            </div>
                        </div>
                        <input type="hidden" name="prevDiscount" value="<% out.write(request.getParameter("discountType"));%>" >
                        <!-- Unnamed (Droplist) -->
                        <% if (request.getParameter("discountType").equals("None")) { %>

                        <div id="u364" class="ax_default droplist" style="z-index: 20;">
                            <select id="u364_input" name="discount">
                                <option value="None" selected>None</option>
                                <option value="Variable">Variable</option>
                                <option value="Flexible">Flexible</option>
                                <option value="Fixed">Fixed</option>
                            </select>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u365" class="ax_default label">
                            <div id="u365_div" class=""></div>
                            <div id="u365_text" class="text ">
                                <p><span>Discount</span></p>
                            </div>
                        </div>
                        <!-- Unnamed (Rectangle) -->
                        <div id="u367" class="ax_default label">
                            <div id="u367_div" class=""></div>
                            <div id="u367_text" class="text ">
                                <p><span>Edit Customer</span></p>
                            </div>
                        </div>
                        <div id="u364" class="ax_default label">
                            <div style="top:55px;position:absolute;left:-60px">
                                <p><span>Holder</span><input style="left:57px" class="ax_default" id="u362_input" type="text" name="holder" value="<% out.write(request.getParameter("holder"));%>"/> </p>
                            </div>
                        </div>
                        <%           }%>
                        <%  if (request.getParameter("discountType").equals("Fixed")) { %>

                        <div id="u364" class="ax_default droplist" style="z-index: 20;">
                            <select id="u364_input" name="discount">
                                <option value="None" >None</option>
                                <option value="Variable">Variable</option>
                                <option value="Flexible">Flexible</option>
                                <option value="Fixed" Selected>Fixed</option>
                                <option value="newFixed"> New Fixed </option>
                            </select>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u365" class="ax_default label">
                            <div id="u365_div" class=""></div>
                            <div id="u365_text" class="text ">
                                <p><span>Discount</span></p>
                            </div>
                        </div>
                        <!-- Unnamed (Rectangle) -->
                        <div id="u367" class="ax_default label">
                            <div id="u367_div" class=""></div>
                            <div id="u367_text" class="text ">
                                <p><span>Add/Edit Customer</span></p>
                            </div>
                        </div>
                </div>
                <div id="u364" class="ax_default label">
                    <div style="top:55px;position:absolute;left:-60px">
                        <p><span>Holder</span><input style="left:57px" class="ax_default" id="u362_input" type="text" name="holder" value="<% out.write(request.getParameter("holder"));%>"/> </p>
                    </div>
                </div>
                <%           }%>
                <%  if (request.getParameter("discountType").equals("Flexible")) { %>

                <div id="u364" class="ax_default droplist">
                    <select id="u364_input" name="discount" style="z-index: 20;">
                        <option value="None" >None</option>
                        <option value="Variable">Variable</option>
                        <option value="Flexible" Selected>Flexible</option>
                        <option value="Fixed" >Fixed</option>
                        <option value="newFlexible">New Flexible</option>
                    </select>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u365" class="ax_default label">
                    <div id="u365_div" class=""></div>
                    <div id="u365_text" class="text ">
                        <p><span>Discount</span></p>
                    </div>
                </div>
                <!-- Unnamed (Rectangle) -->
                <div id="u367" class="ax_default label">
                    <div id="u367_div" class=""></div>
                    <div id="u367_text" class="text ">
                        <p><span>Add/Edit Customer</span></p>
                    </div>
                </div>
            </div>
            <div id="u364" class="ax_default label">
                <div style="top:55px;position:absolute;left:-60px">
                    <p><span>Holder</span><input style="left:57px" class="ax_default" id="u362_input" type="text" name="holder" value="<% out.write(request.getParameter("holder"));%>"/> </p>
                </div>
            </div>
            <%           }%>
            <%  if (request.getParameter("discountType").equals("Variable Discount")) { %>

            <div id="u364" class="ax_default droplist">
                <select id="u364_input" name="discount" style="z-index: 20;">
                    <option value="None" >None</option>
                    <option value="Variable" selected>Variable</option>
                    <option value="Flexible" >Flexible</option>
                    <option value="Fixed" >Fixed</option>
                    <option value="newVariable">New Variable </option>
                </select>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u365" class="ax_default label">
                <div id="u365_div" class=""></div>
                <div id="u365_text" class="text ">
                    <p><span>Discount</span></p>
                </div>
            </div>
            <!-- Unnamed (Rectangle) -->
            <div id="u367" class="ax_default label">
                <div id="u367_div" class=""></div>
                <div id="u367_text" class="text ">
                    <p><span>Add/Edit Customer</span></p>
                </div>
            </div>
        </div>
        <div id="u364" class="ax_default label">
            <div style="top:55px;position:absolute;left:-60px">
                <p><span>Holder</span><input style="left:57px" class="ax_default" id="u362_input" type="text" name="holder" value="<% out.write(request.getParameter("holder"));%>"/> </p>
            </div>
        </div>
        <%           }%>
            <!-- Unnamed (Checkbox) -->
    <% if (request.getParameter("valued").equals("Valued")) { %>
    <div id="u399" class="ax_default checkbox" style="top:400px;position:relative">
        <label for="u399_input" style="position: absolute;">
            <div id="u399_text" class="text ">
                <p><span>Valued</span></p>
            </div>
        </label>
        <input id="u399_input" type="checkbox" value="checkbox" name="valued"checked/>
        <input type="hidden" value="true" name="beforeValued"/>
    </div>
    <% }%>

    <% if (request.getParameter("valued").equals("Not Valued")) {%>
    <div id="u399" class="ax_default checkbox" style="top:400px;position:relative">
        <label for="u399_input" style="position: absolute;">
            <div id="u399_text" class="text ">
                <p><span>Valued</span></p>
            </div>
        </label>
        <input id="u399_input" type="checkbox" value="checkbox" name="valued"/>
        <input type="hidden" value="false" name="beforeValued"/>
    </div>
    <% }%>
        
        
        
    </form>

    <%           }%>

    <!-- Unnamed (Rectangle) -->
    <div id="u369" class="ax_default label">
        <div id="u369_div" class=""></div>
        <div id="u369_text" class="text ">
            <p><span>Suspended accounts</span></p>
        </div>
    </div>

    <!-- Unnamed (Table) -->
    <div id="u370" class="ax_default">

        <!-- Unnamed (Table Cell) -->
                            <table class="">
                <tr>
                    <th> Customer ID </th>
                    <th> Account Holder </th>
                    <th> First Name </th>
                    <th> Last Name </th>
                    <th> Email </th>
                    <th> Address </th>
                    <th> Postcode </th>
                    <th> Phone Number</th>
                </tr>
                <c:forEach items="${suspended}" var ="cust">
                    <tr>
                    <form action="selectedCustomerServlet" method="post">
                        <td> <c:out value="${cust.customerID}" /> <input type="hidden" name="id" value="${cust.customerID}"></td>
                        <td> <c:out value="${cust.holder}" /> <input type="hidden" name="holder" value="${cust.holder}"></td>
                        <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
                        <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
                        <td> <c:out value="${cust.email}" /> <input type="hidden" name="email" value="${cust.email}"></td>
                        <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
                        <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="status" value="${cust.postcode}"></td>
                        <td> <c:out value="${cust.phoneNo}" /> <input type="hidden" name="phonenumber" value="${cust.phoneNo}"></td>
                    </form>
                    </tr>

                </c:forEach>
            </table>
    </div>


</div>

</div>
</body>
</html>
