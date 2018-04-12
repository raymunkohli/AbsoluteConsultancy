<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Receipt</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/receipt/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/receipt/data.js"></script>
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
            <div id="tophalf" position="relative">
            <a href="payment.jsp"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />
                <!-- Unnamed (Rectangle) -->
                <div id="u0" class="ax_default label" style="width:300px">
                    <div id="u0_div" class=""></div>
                    <div id="u0_text" class="text ">
                        <p><span>RECEIPT</span></p>
                    </div>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u1" class="ax_default" data-left="43" data-top="143" data-width="169" data-height="153">

                    <!-- Unnamed (Group) -->
                    <div id="u2" class="ax_default" data-left="43" data-top="165" data-width="169" data-height="131">

                        <!-- Unnamed (Rectangle) -->
                        <div id="u3" class="ax_default label">
                            <div id="u3_div" class=""></div>
                            <div id="u3_text" class="text ">
                                <p><span>${Cust.holder}</span></p><p><span>${Cust.name} ${Cust.surname}</span></p><p><span>${Cust.address}</span></p><p><span>${Cust.postcode}</span></p><p><span>${cust.phoneNo}</span></p><p><span>${cust.email}</span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u4" class="ax_default label">
                        <div id="u4_div" class=""></div>
                        <div id="u4_text" class="text ">
                            <p><span>Billed to:</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u5" class="ax_default" data-left="496" data-top="13" data-width="388" data-height="101">

                    <!-- Unnamed (Group) -->
                    <div id="u6" class="ax_default" data-left="496" data-top="40" data-width="388" data-height="74">

                        <!-- Unnamed (Rectangle) -->
                        <div id="u7" class="ax_default label">
                            <div id="u7_div" class=""></div>
                            <div id="u7_text" class="text ">
                                <p><span>Bloomsbury's Image Processing Laboratory</span></p>
                            </div>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u8" class="ax_default label">
                            <div id="u8_div" class=""></div>
                            <div id="u8_text" class="text ">
                                <p><span>2, Wynyatt Street, London, </span></p><p><span>EC1V 7HU</span></p><p><span>02072357534</span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u9" class="ax_default label">
                        <div id="u9_div" class=""></div>
                        <div id="u9_text" class="text ">
                            <p><span>'The Lab'</span></p>
                        </div>
                    </div>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u10" class="ax_default" data-left="583" data-top="201" data-width="206" data-height="38">

                    <!-- Unnamed (Rectangle) -->
                    <div id="u11" class="ax_default label">
                        <div id="u11_div" class=""></div>
                        <div id="u11_text" class="text ">
                            <p><span>Payment method:</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u12" class="ax_default label">
                        <div id="u12_div" class=""></div>
                        <div id="u12_text" class="text ">
                            <% if (request.getParameter("cashDate") == null) { %>
                            <p><span><% out.write(request.getParameter("type")); %> ending&nbsp; ************  <% out.write(request.getParameter("digits")); %> </span></p>
                            <% } else {%>
                            <div style="left:80px;position:absolute" >
                            <p><span>Cash</span></p>
                            </div>
                            <% } %>

                        </div>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u13" class="ax_default label">
                    <div id="u13_div" class=""></div>
                    <div id="u13_text" class="text ">
                        <p><span>Date Paid:</span></p>
                    </div>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u14" class="ax_default label" style="left:650px">
                    <div id="u14_div" class=""></div>
                    <div id="u14_text" class="text ">
                                <p><span><% out.write(request.getParameter("cashDate"));
                                    out.write(request.getParameter("cardPayDate"));%></span></p>
                    </div>
                </div>

            </div>
            <div id="table" >
                <!-- Unnamed (Rectangle) -->
                <div id="u17" class="ax_default label" style="width:5000px;left:70px">
                    <div id="u17_div" class=""></div>
                    <div id="u14_text" class="text " style="font-weight:300;">
                        <table>
                            <tr>
                                <th> Job ID </th>
                                <th> Desc </th>
                                <th> Tasks </th>
                                <th> Price </th>
                                    <c:set var="tp" value="0"/>
                            </tr>
                            <c:forEach items="${Jobs}" var="job" varStatus="Status">
                                <tr>
                                    <td>${job.jobID}</td>
                                    <td>${job.specInstructions} </td>
                                    <td>${task[Status.index]} </td>
                                    <td>${price[Status.index]} </td> <c:set var="tp" value="${price[Status.index] +tp}"/>
                                </tr>
                            </c:forEach>
                            <tr style="border-top:3px solid black;"></tr>
                            <tr>
                                <td>Sub Total</td><td></td><td></td> <td>${tp}</td>
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
                                <td>Price after Discount</td><td></td><td></td><td> <% out.write(request.getParameter("TotalPrice")); %></td>
                            </tr>
                            <tr style="border-top:3px solid black;">
                                <td >Total (20% VAT)</td><td></td><td></td><td> <% out.write(Double.toString(Double.parseDouble(request.getParameter("TotalPrice")) * 1.2));%></td>
                            </tr>
                            <tr>
                                <td>Paid</td><td></td><td></td> <td> <% out.write(Double.toString(Double.parseDouble(request.getParameter("TotalPrice")) * 1.2));%></td>
                            </tr>


                        </table>
                    </div>

                </div>
            </div>
            <c:forEach items="${Jobs}">
                <div id="whitespace" style="position:relative; height:30px;">
                </div>
            </c:forEach>
                            <c:if test="${discount eq 'Variable'}">
            <div style="position:relative;top:650px;left:300px">
                <table>
                    <c:if test="${discount eq 'Variable'}">
                        <tr> <th>Task ID </th> <th> Discount Amount </th> </tr>
                                <c:forEach items="${DiscountAmount}" var="d">
                            <tr> <td> ${d.variablediscountPK.basetaskbaseTaskID} </td> <td> ${d.amount} </td></tr>
                        </c:forEach>
                    </c:if>
                </table>        
            </div>
            <c:forEach items="${DiscountAmount}" >
                <div id="fakespace" style="position:relative;height:30px">
                </div>
            </c:forEach>
                            </c:if>
            <!-- Unnamed (Rectangle) -->
            <div id="bottomhalf" style="position:relative;top:-120px">
                <div id="u25" class="ax_default label">
                    <div id="u25_div" class=""></div>
                    <div id="u25_text" class="text ">
                        <p><span>Thank you for your payment</span></p>
                    </div>
                </div>

                <!-- Unnamed (Horizontal Line) -->
                <div id="u26" class="ax_default line">
                    <img id="u26_img" class="img " src="images/receipt/u22.png"/>
                </div>
            </div>
        </div>
    </body>
</html>
