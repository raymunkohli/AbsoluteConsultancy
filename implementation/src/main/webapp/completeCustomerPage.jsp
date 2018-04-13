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
        <div id="base" class="">
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


                <!-- Unnamed (Table) -->
                <div id="u278" class="ax_default">
                    Select A Customer

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

                    <!-- Unnamed (Table Cell) -->
                    <div id="u316" class="ax_default table_cell">
                        <img id="u316_img" class="img " src="images/customers_form/u316.png"/>
                        <div id="u316_text" class="text ">
                            <p><span>Customer ID</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u317" class="ax_default table_cell">
                        <img id="u317_img" class="img " src="images/customers_form/u317.png"/>
                        <div id="u317_text" class="text ">
                            <p><span>Name</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u318" class="ax_default table_cell">
                        <img id="u318_img" class="img " src="images/customers_form/u318.png"/>
                        <div id="u318_text" class="text ">
                            <p><span>Surname</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u319" class="ax_default table_cell">
                        <img id="u319_img" class="img " src="images/customers_form/u319.png"/>
                        <div id="u319_text" class="text ">
                            <p><span>Email</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u320" class="ax_default table_cell">
                        <img id="u320_img" class="img " src="images/customers_form/u320.png"/>
                        <div id="u320_text" class="text ">
                            <p><span>Amount (£)</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u321" class="ax_default table_cell">
                        <img id="u321_img" class="img " src="images/customers_form/u321.png"/>
                        <div id="u321_text" class="text ">
                            <p><span>Days overdue</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u322" class="ax_default table_cell">
                        <img id="u322_img" class="img " src="images/customers_form/u322.png"/>
                        <div id="u322_text" class="text ">
                            <p><span>Job ID(s)</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u323" class="ax_default table_cell">
                        <img id="u323_img" class="img " src="images/customers_form/u316.png"/>
                        <div id="u323_text" class="text ">
                            <p><span>17</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u324" class="ax_default table_cell">
                        <img id="u324_img" class="img " src="images/customers_form/u317.png"/>
                        <div id="u324_text" class="text ">
                            <p><span>Maria</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u325" class="ax_default table_cell">
                        <img id="u325_img" class="img " src="images/customers_form/u318.png"/>
                        <div id="u325_text" class="text ">
                            <p><span>Patel</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u326" class="ax_default table_cell">
                        <img id="u326_img" class="img " src="images/customers_form/u319.png"/>
                        <div id="u326_text" class="text ">
                            <p><span>m.patel@city.ac.uk</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u327" class="ax_default table_cell">
                        <img id="u327_img" class="img " src="images/customers_form/u320.png"/>
                        <div id="u327_text" class="text ">
                            <p><span>£760.00</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u328" class="ax_default table_cell">
                        <img id="u328_img" class="img " src="images/customers_form/u321.png"/>
                        <div id="u328_text" class="text ">
                            <p><span>140</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u329" class="ax_default table_cell">
                        <img id="u329_img" class="img " src="images/customers_form/u322.png"/>
                        <div id="u329_text" class="text ">
                            <p><span>[65] [23]</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u330" class="ax_default table_cell">
                        <img id="u330_img" class="img " src="images/customers_form/u330.png"/>
                        <div id="u330_text" class="text ">
                            <p><span>11</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u331" class="ax_default table_cell">
                        <img id="u331_img" class="img " src="images/customers_form/u331.png"/>
                        <div id="u331_text" class="text ">
                            <p><span>Alice</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u332" class="ax_default table_cell">
                        <img id="u332_img" class="img " src="images/customers_form/u332.png"/>
                        <div id="u332_text" class="text ">
                            <p><span>Mayala</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u333" class="ax_default table_cell">
                        <img id="u333_img" class="img " src="images/customers_form/u333.png"/>
                        <div id="u333_text" class="text ">
                            <p><span>mayal23@hotmail.co.uk</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u334" class="ax_default table_cell">
                        <img id="u334_img" class="img " src="images/customers_form/u334.png"/>
                        <div id="u334_text" class="text ">
                            <p><span>£430.00</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u335" class="ax_default table_cell">
                        <img id="u335_img" class="img " src="images/customers_form/u335.png"/>
                        <div id="u335_text" class="text ">
                            <p><span>120</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u336" class="ax_default table_cell">
                        <img id="u336_img" class="img " src="images/customers_form/u336.png"/>
                        <div id="u336_text" class="text ">
                            <p><span>[23]</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u337" class="ax_default table_cell">
                        <img id="u337_img" class="img " src="images/customers_form/u337.png"/>
                        <div id="u337_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u338" class="ax_default table_cell">
                        <img id="u338_img" class="img " src="images/customers_form/u338.png"/>
                        <div id="u338_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u339" class="ax_default table_cell">
                        <img id="u339_img" class="img " src="images/customers_form/u339.png"/>
                        <div id="u339_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u340" class="ax_default table_cell">
                        <img id="u340_img" class="img " src="images/customers_form/u340.png"/>
                        <div id="u340_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u341" class="ax_default table_cell">
                        <img id="u341_img" class="img " src="images/customers_form/u341.png"/>
                        <div id="u341_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u342" class="ax_default table_cell">
                        <img id="u342_img" class="img " src="images/customers_form/u342.png"/>
                        <div id="u342_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u343" class="ax_default table_cell">
                        <img id="u343_img" class="img " src="images/customers_form/u343.png"/>
                        <div id="u343_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>
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



                <% if (!request.getParameter("id").isEmpty()) { %>
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


                    <!-- Unnamed (Text Field) -->
                    <div id="u357" class="ax_default text_field">
                        <input id="u357_input" type="text" value="<% out.write(request.getParameter("firstname"));%>"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u358" class="ax_default text_field">
                        <input id="u358_input" type="text" value="<% out.write(request.getParameter("lastname"));%>"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u359" class="ax_default text_field">
                        <input id="u359_input" type="text" value="<% out.write(request.getParameter("phonenumber"));%>"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u360" class="ax_default text_field">
                        <input id="u360_input" type="text" value="<% out.write(request.getParameter("email"));%>"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u361" class="ax_default text_field">
                        <input id="u361_input" type="text" value="<% out.write(request.getParameter("address"));%>"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u362" class="ax_default text_field">
                        <input id="u362_input" type="text" value="<% out.write(request.getParameter("postcode"));%>"/>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u363" class="ax_default button">
                        <div id="u363_div" class=""></div>
                        <div id="u363_text" class="text ">
                            <p><span>Save changes</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Droplist) -->
                    <% if (request.getParameter("discountType").equals("None")) { %>

                    <div id="u364" class="ax_default droplist">
                        <select id="u364_input">
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
                </div>
                <%           }%>
                <%  if (request.getParameter("discountType").equals("Fixed")) { %>

                    <div id="u364" class="ax_default droplist">
                        <select id="u364_input">
                            <option value="None" >None</option>
                            <option value="Variable">Variable</option>
                            <option value="Flexible">Flexible</option>
                            <option value="Fixed" Selected>Fixed</option>
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
                <%           }%>
                                <%  if (request.getParameter("discountType").equals("Flexible")) { %>

                    <div id="u364" class="ax_default droplist">
                        <select id="u364_input">
                            <option value="None" >None</option>
                            <option value="Variable">Variable</option>
                            <option value="Flexible" Selected>Flexible</option>
                            <option value="Fixed" >Fixed</option>
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
                <%           }%>
                 <%  if (request.getParameter("discountType").equals("Variable Discount")) { %>

                    <div id="u364" class="ax_default droplist">
                        <select id="u364_input">
                            <option value="None" >None</option>
                            <option value="Variable" selected>Variable</option>
                            <option value="Flexible" >Flexible</option>
                            <option value="Fixed" >Fixed</option>
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
                <%           }%>
                
                
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
                    <div id="u371" class="ax_default table_cell">
                        <img id="u371_img" class="img " src="images/customers_form/u316.png"/>
                        <div id="u371_text" class="text ">
                            <p><span>Customer ID</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u372" class="ax_default table_cell">
                        <img id="u372_img" class="img " src="images/customers_form/u317.png"/>
                        <div id="u372_text" class="text ">
                            <p><span>Name</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u373" class="ax_default table_cell">
                        <img id="u373_img" class="img " src="images/customers_form/u318.png"/>
                        <div id="u373_text" class="text ">
                            <p><span>Surname</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u374" class="ax_default table_cell">
                        <img id="u374_img" class="img " src="images/customers_form/u319.png"/>
                        <div id="u374_text" class="text ">
                            <p><span>Email</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u375" class="ax_default table_cell">
                        <img id="u375_img" class="img " src="images/customers_form/u320.png"/>
                        <div id="u375_text" class="text ">
                            <p><span>Amount (£)</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u376" class="ax_default table_cell">
                        <img id="u376_img" class="img " src="images/customers_form/u321.png"/>
                        <div id="u376_text" class="text ">
                            <p><span>Days overdue</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u377" class="ax_default table_cell">
                        <img id="u377_img" class="img " src="images/customers_form/u322.png"/>
                        <div id="u377_text" class="text ">
                            <p><span>Job ID(s)</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u378" class="ax_default table_cell">
                        <img id="u378_img" class="img " src="images/customers_form/u316.png"/>
                        <div id="u378_text" class="text ">
                            <p><span>17</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u379" class="ax_default table_cell">
                        <img id="u379_img" class="img " src="images/customers_form/u317.png"/>
                        <div id="u379_text" class="text ">
                            <p><span>Maria</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u380" class="ax_default table_cell">
                        <img id="u380_img" class="img " src="images/customers_form/u318.png"/>
                        <div id="u380_text" class="text ">
                            <p><span>Patel</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u381" class="ax_default table_cell">
                        <img id="u381_img" class="img " src="images/customers_form/u319.png"/>
                        <div id="u381_text" class="text ">
                            <p><span>m.patel@city.ac.uk</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u382" class="ax_default table_cell">
                        <img id="u382_img" class="img " src="images/customers_form/u320.png"/>
                        <div id="u382_text" class="text ">
                            <p><span>£411.00</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u383" class="ax_default table_cell">
                        <img id="u383_img" class="img " src="images/customers_form/u321.png"/>
                        <div id="u383_text" class="text ">
                            <p><span>30</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u384" class="ax_default table_cell">
                        <img id="u384_img" class="img " src="images/customers_form/u322.png"/>
                        <div id="u384_text" class="text ">
                            <p><span>[65] [23]</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u385" class="ax_default table_cell">
                        <img id="u385_img" class="img " src="images/customers_form/u330.png"/>
                        <div id="u385_text" class="text ">
                            <p><span>11</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u386" class="ax_default table_cell">
                        <img id="u386_img" class="img " src="images/customers_form/u331.png"/>
                        <div id="u386_text" class="text ">
                            <p><span>Alice</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u387" class="ax_default table_cell">
                        <img id="u387_img" class="img " src="images/customers_form/u332.png"/>
                        <div id="u387_text" class="text ">
                            <p><span>Mayala</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u388" class="ax_default table_cell">
                        <img id="u388_img" class="img " src="images/customers_form/u333.png"/>
                        <div id="u388_text" class="text ">
                            <p><span>mayal23@hotmail.co.uk</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u389" class="ax_default table_cell">
                        <img id="u389_img" class="img " src="images/customers_form/u334.png"/>
                        <div id="u389_text" class="text ">
                            <p><span>£100.00</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u390" class="ax_default table_cell">
                        <img id="u390_img" class="img " src="images/customers_form/u335.png"/>
                        <div id="u390_text" class="text ">
                            <p><span>34</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u391" class="ax_default table_cell">
                        <img id="u391_img" class="img " src="images/customers_form/u336.png"/>
                        <div id="u391_text" class="text ">
                            <p><span>[23]</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u392" class="ax_default table_cell">
                        <img id="u392_img" class="img " src="images/customers_form/u337.png"/>
                        <div id="u392_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u393" class="ax_default table_cell">
                        <img id="u393_img" class="img " src="images/customers_form/u338.png"/>
                        <div id="u393_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u394" class="ax_default table_cell">
                        <img id="u394_img" class="img " src="images/customers_form/u339.png"/>
                        <div id="u394_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u395" class="ax_default table_cell">
                        <img id="u395_img" class="img " src="images/customers_form/u340.png"/>
                        <div id="u395_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u396" class="ax_default table_cell">
                        <img id="u396_img" class="img " src="images/customers_form/u341.png"/>
                        <div id="u396_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u397" class="ax_default table_cell">
                        <img id="u397_img" class="img " src="images/customers_form/u342.png"/>
                        <div id="u397_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Table Cell) -->
                    <div id="u398" class="ax_default table_cell">
                        <img id="u398_img" class="img " src="images/customers_form/u343.png"/>
                        <div id="u398_text" class="text ">
                            <p><span>etc</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Checkbox) -->
                <div id="u399" class="ax_default checkbox">
                    <label for="u399_input" style="position: absolute;">
                        <div id="u399_text" class="text ">
                            <p><span>Valued</span></p>
                        </div>
                    </label>
                    <input id="u399_input" type="checkbox" value="checkbox" checked/>
                </div>
            </div>
        </div>
    </body>
</html>
