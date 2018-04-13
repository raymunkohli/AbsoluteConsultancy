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
                <p><span>Select a customer</span></p>
            </div>
        </div>

        <!-- Unnamed (Horizontal Line) -->
        <div id="u84" class="ax_default line">
            <img id="u84_img" class="img " src="images/receptionist_screen/u84.png"/>
        </div>
        <div style="top:100px;left:50px;position:absolute;font-size: 20px;" class="ax_default">
            Search For A Customer
        </div>
        <div style="top:150px;left:50px;position:absolute;color:#cd0a0a; background:#000000;font-size: 20px;" class="ax_default">

            ${Err}
        </div>
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
                <p><span>Phone </span></p>
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

        <form method="post" action ="searchForCustServlet">
            <!-- Unnamed (Text Field) -->
            <div id="u44" class="ax_default text_field">
                <input name="name" type="text"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u45" class="ax_default text_field">
                <input name="surname" type="text"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u46" class="ax_default text_field">
                <input name="phone" type="text"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u47" class="ax_default text_field">
                <input name="email" type="text"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u48" class="ax_default text_field">
                <input name="address" type="text"/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u49" class="ax_default text_field">
                <input name="postcode" type="text" >
            </div>
            <div id="u49a" class="ax_default text_field" >
                Holder: <input name="holder" type="text"/>
            </div>
            <div id="u49a" class="ax_default text_field" style="top:235px">
                <div style="left:23px; position:absolute;">
                    ID: <input name="customerID" type="text"/>
                </div>
            </div>
            <div id="u73" class="ax_default html_button" style="left:1000px">
                <input id="u73_input" type="submit" value="Search for Customer"/>
            </div>
        </form>


        <div style="top:320px;left:50px;position:absolute;font-size: 20px;" class="ax_default">
            Select A Customer
        </div>
        <div style="top:350px;position:relative;" class="ax_default">
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
                    <form action="selectedCustomerServlet" method="post">
                        <td> <c:out value="${cust.customerID}" /> <input type="hidden" name="id" value="${cust.customerID}"></td>
                        <td> <c:out value="${cust.holder}" /> <input type="hidden" name="holder" value="${cust.holder}"></td>
                        <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
                        <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
                        <td> <c:out value="${cust.email}" /> <input type="hidden" name="email" value="${cust.email}"></td>
                        <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
                        <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="status" value="${cust.postcode}"></td>
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
    </body>
</html>
