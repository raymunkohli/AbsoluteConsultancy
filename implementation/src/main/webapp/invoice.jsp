<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="receptionistCheck.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" media="all"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"  media="all"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"  media="all"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"  media="all"/>
        <link href="files/home/styles.css" type="text/css" rel="stylesheet"  media="all"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/home/data.js"></script>
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

            <a href="createInvoice.jsp"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />
            <div id="tophalf">
                <!-- Unnamed (Rectangle) -->
                <div id="u0" class="ax_default label">
                    <div id="u0_div" class=""></div>
                    <div id="u0_text" class="text ">
                        <p><span>The Lab</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u1" class="ax_default label">
                    <div id="u1_div" class=""></div>
                    <div id="u1_text" class="text ">
                        <p><span>2, Wynyatt Street</span></p><p><span>London, EC1V 7HU</span></p><p><span>Phone: 02072357534</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u2" class="ax_default label">
                    <div id="u2_div" class=""></div>
                    <div id="u2_text" class="text ">
                        <p><span>Invoice l ${Date}</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u3" class="ax_default label">
                    <div id="u3_div" class=""></div>
                    <div id="u3_text" class="text ">
                        <p><span>Account: ACC${Cust.customerID}</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u4" class="ax_default label">
                    <div id="u4_div" class=""></div>
                    <div id="u4_text" class="text ">
                        <p><span style="font-family:'Arial Bold', 'Arial';font-weight:700;">Account Holder Name: </span><span style="font-family:'Arial';font-weight:400;">${Cust.holder}</span></p><p><span style="font-family:'Arial Bold', 'Arial';font-weight:700;">Account No:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="font-family:'Arial';font-weight:400;">ACC${Cust.customerID}</span></p><p><span style="font-family:'Arial Bold', 'Arial';font-weight:700;">Contact Name:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="font-family:'Arial';font-weight:400;">${Cust.name} ${Cust.surname}</span></p><p><span style="font-family:'Arial Bold', 'Arial';font-weight:700;">Address:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span style="font-family:'Arial';font-weight:400;">${Cust.address}</span></p><p><span style="font-family:'Arial';font-weight:400;">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; ${Cust.postcode}</span></p><p><span style="font-family:'Arial Bold', 'Arial';font-weight:700;">Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="font-family:'Arial';font-weight:400;">${Cust.phoneNo}</span></p>
                    </div>
                </div>


                <!-- Unnamed (Rectangle) -->
                <div id="u7" class="ax_default label">
                    <div id="u7_div" class=""></div>
                    <div id="u7_text" class="text ">
                        <p><span>Description of work:</span></p>
                    </div>
                </div>

                <!-- Unnamed (Table) -->
                <div id="u8" class="ax_default">
                    <table>
                        <tr>
                            <th>Job ID</th>
                            <th>Description </th>
                            <th> Price </th>
                            <th> Tasks </th>
                        </tr>
                        <c:set var="priceBeforeDiscount" value="0" />
                        <c:set var="priceAfterDiscount" value="0" />
                        <c:set var="totalSurcharge" value="0" />
                        <c:forEach items="${Jobs}" var="singleJob" varStatus="jobStatus">
                            <tr>
                                <td>  ${singleJob.jobID} </td> <c:set var="priceAfterDiscount" value="${priceAfterDiscount+singleJob.value}"/>
                                <td>  ${singleJob.specInstructions}</td>
                                <td>  ${price[jobStatus.index]} </td> <c:set var="priceBeforeDiscount" value="${priceBeforeDiscount + price[jobStatus.index]}" />
                                <td>  ${task[jobStatus.index]} </td> <c:set var="totalSurcharge" value="${totalSurcharge+singleJob.surcharge}"/>
                            </tr>
                        </c:forEach>
                        <tr style="border-top:3px solid black;"> <td> Surcharge </td><td></td><td></td> <td> <c:out value="${totalSurcharge}" /> </tr>
                        <tr>
                            <td>Subtotal</td>
                            <td></td><td></td>
                            <td>${priceBeforeDiscount}</td> 
                        </tr>
                        <tr>
                            <td>Discount Agreed</td>
                            <td></td><td></td>
                            <td><c:choose>
                                    <c:when test="${discount == 'none'}">
                                        None
                                    </c:when>
                                    <c:when test="${discount == 'Fixed'}">
                                        Fixed at ${DiscountAmount}
                                    </c:when>
                                    <c:when test="${discount == 'Flexible'}">
                                        Flexible at ${DiscountAmount} 
                                    </c:when>
                                    <c:when test="${discount == 'Variable'}">
                                        Variable see table Below
                                    </c:when>
                                    <c:otherwise>
                                        Error
                                    </c:otherwise>


                                </c:choose></td>
                        </tr>
                        <tr> 
                            <td>Subtotal inc Discount</td><td></td><td></td>
                            <td>${priceAfterDiscount}</td>
                        </tr>
                        <tr style="border-top:3px solid black;">
                            <td>Total (20% VAT)</td> <td></td><td></td>
                            <td>${priceAfterDiscount *1.2}</td>
                        </tr>

                    </table>

                </div>

            </div>
            <c:forEach items="${Jobs}" >
                <div id="fakespace">

                </div>
            </c:forEach>
            <div style="position:relative;  left:200px;top:0px;">
                <table>
                    <c:if test="${discount eq 'Variable'}">
                        <tr> <th>Task ID </th> <th> Discount Amount </th> </tr>
                                <c:forEach items="${DiscountAmount}" var="d">
                            <tr> <td> ${d.variablediscountPK.basetaskbaseTaskID} </td> <td> ${d.amount} </td></tr>
                        </c:forEach>
                    </c:if>
                </table>
            

            <c:forEach items="${DiscountAmount}" >
                <div id="fakespace" class="">
                </div>
            </c:forEach>
            </div>
            <div id="bottomhalf">
                <!-- Unnamed (Rectangle) -->
                <div id="u18" class="ax_default label">
                    <div id="u18_div" class=""></div>
                    <div id="u18_text" class="text ">
                        <p><span>Make a payment within 30 days by cash, card or bank transfer to our account:</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u19" class="ax_default label">
                    <div id="u19_div" class=""></div>
                    <div id="u19_text" class="text ">
                        <p><span>'The Lab', Bloomsbury's Image Processing Laboratory</span></p><p><span>Barclays Plc, City University Branch, 10, Northampton Square</span></p><p><span>Sort Code 30-20-70</span></p><p><span>Account number: 67103456</span></p>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
