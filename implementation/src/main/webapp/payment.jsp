<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="receptionistCheck.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment form</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/payment_form/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/payment_form/data.js"></script>
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

        <div style='position:relative;height:170px;z-index: 1'>
            <div id="u475" class="ax_default button">
                <div id="u475_div" class=""></div>
                <div id="u475_text" class="text ">
                    <form action="viewPaymentCust" method="post">
                        <p><span>
                                <input type="submit" value="View customer list"/>
                            </span></p></form>
                </div>
            </div>    
            <div id="u471" class="ax_default label">
                <div id="u471_div" class=""></div>
                <div id="u471_text" class="text ">
                    <p><span>Add a payment</span></p>
                </div>
            </div>
            <div id="u477" class="ax_default icon">
                <img id="u477_img" class="img " src="images/receptionist_screen/u88.png"/>
            </div>
            <!-- Unnamed (Rectangle) -->
            <!-- Unnamed (Horizontal Line) -->
            <div id="u472" class="ax_default line">
                <img id="u472_img" class="img " src="images/receptionist_screen/u84.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u401" class="ax_default label">
                <div id="u401_div" class=""></div>
                <div id="u401_text" class="text ">
                    <p><span>Select customer</span></p>
                </div>
            </div>

            <!-- Unnamed (Table) -->
            <form action="totalPaymentServlet" method="post" id="selectJobsForm" name="selectJobsForm">
                <div id="u402" class="ax_default">
                    <c:set var="TotalPrice" value="0"/>
                    <table>
                        <tr>
                            <th> Job ID</th>
                            <th> Price (inc Discount) </th>
                            <th> Order Date </th>
                            <th> DeadLine </th>
                            <th> Select </th>
                        </tr>
                        <c:forEach items="${Jobs}" var="Jobs">
                            <tr>
                                <td> <c:out value="${Jobs.jobID}" /> </td>
                                <td> <c:out value="${Jobs.value}" /> </td> 
                                <td> <c:out value="${Jobs.orderDate}" /> </td>
                                <td> <c:out value="${Jobs.deadline}" /> </td>
                                <td> <input type="checkbox" name="${Jobs.jobID}" value ="${Jobs.jobID}`${Jobs.value}`${Jobs.orderDate}`${Jobs.deadline}"/> </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </form>
        </div>
        <c:forEach items="${Jobs}">
            <div id="fakespace"></div>

        </c:forEach>


        <div style='position:relative;top:-200px;'>
            <div id="u474" class="ax_default label">
                <div id="u474_div" class=""></div>
                <div id="u474_text" class="text ">
                    <p><span><input type="submit" value="Select Jobs" form="selectJobsForm"/></span></p>
                </div>
            </div>
        </div>
        <c:if test="${jobsselected == true}">
            <div style='position:relative;z-index:1;top:-170px'/>
            <!-- Unnamed (Rectangle) -->
            <div id="u424" class="ax_default label">
                <div id="u424_div" class=""></div>
                <div id="u424_text" class="text ">
                    <p><span>Choose a payment type</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u425" class="ax_default label">
                <div id="u425_div" class=""></div>
                <div id="u425_text" class="text ">
                    <p><span>Date</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u426" class="ax_default label">
                <div id="u426_div" class=""></div>
                <div id="u426_text" class="text ">
                    <p><span>Type</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u427" class="ax_default label">
                <div id="u427_div" class=""></div>
                <div id="u427_text" class="text ">
                    <p><span>Expiry date </span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u428" class="ax_default label">
                <div id="u428_div" class=""></div>
                <div id="u428_text" class="text ">
                    <p><span>Last 4 digits</span></p>
                </div>
            </div>
            <form method="post" action="addCardPayServlet" name="addCardPayment">
                <!-- Unnamed (Droplist) -->
                <div id="u429" class="ax_default droplist">
                    <select id="u429_input" name="type" required>
                        <option selected value=""> </option>
                        <option value="Mastercard">Mastercard</option>
                        <option value="American Express">American Express</option>
                        <option value="Visa">Visa</option>
                    </select>
                </div>
                <!-- Unnamed (Text Field) -->
                <div id="u430" class="ax_default text_field">
                    <input id="u430_input" type="text" value="" name="digits" required/>
                </div>

                <!-- Unnamed (Group) -->
                <div id="u431" class="ax_default" data-left="593" data-top="352" data-width="120" data-height="21">

                    <!-- Unnamed (Text Field) -->
                    <div id="u432" class="ax_default text_field">
                        <input type="date" value="" name="cardPayDate" required/>
                    </div>

                    <!-- Unnamed (Shape) -->

                    <!-- Unnamed (Group) -->
                    <div id="u434" class="ax_default" data-left="593" data-top="452" data-width="120" data-height="21">

                        <!-- Unnamed (Text Field) -->
                        <div id="u435" class="ax_default text_field">
                            <input id="u435_input" type="text" value="" name="expdate" required/>
                        </div>

                        <!-- Unnamed (Shape) -->
                        <div id="u436" class="ax_default icon">
                            <img id="u436_img" class="img " src="images/shift_manager_screen/u202.png"/>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u437" class="ax_default label">
                        <div id="u437_div" class=""></div>
                        <div id="u437_text" class="text ">
                            <p><span>Date</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Vertical Line) -->
                    <div id="u439" class="ax_default line">
                        <img id="u439_img" class="img " src="images/payment_form/u439.png"/>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u440" class="ax_default button">
                        <div id="u440_div" class=""></div>
                        <div id="u440_text" class="text ">
                            <p><span><input type="submit" value="Add card pay"/></span></p>
                        </div>
                    </div>
                    <c:set var="numberofjobs" value="0"/>
                    <c:forEach items="${selectedJobs}" var="jobs" varStatus="jobStatus">
                        <input type="hidden" value="${jobs.jobID}" name="${jobStatus.index}" />
                        <c:set var="numberofjobs" value="${numberofjobs+1}"/>
                    </c:forEach>
                    <input type ="hidden" value="${numberofjobs}" name="numberofjobs"/>
            </form>
            <!-- Unnamed (Rectangle) -->

            <form method="post" action="addCashPayServlet" id="cashPay">
                <!-- Unnamed (Group) -->
                <div id="u444" class="ax_default" data-left="153" data-top="355" data-width="120" data-height="21">
                    <c:set var="numberofjobs" value="0"/>
                    <c:forEach items="${selectedJobs}" var="jobs" varStatus="jobStatus">
                        <input type="hidden" value="${jobs.jobID}" name="${jobStatus.index}" />
                        <c:set var="numberofjobs" value="${numberofjobs+1}"/>
                    </c:forEach>
                    <input type ="hidden" value="${numberofjobs}" name="numberofjobs"/>
                    <!-- Unnamed (Text Field) -->
                    <div id="u445" class="ax_default text_field">
                        <input type="date" value="" name="cashDate" form="cashPay" required>
                    </div>

                    <!-- Unnamed (Shape) -->
                </div>
                <div id="u441" class="ax_default button">
                    <div id="u441_div" class=""></div>
                    <div id="u441_text" class="text ">
                        <p><span><input type="submit" value="Add cash pay" form="cashPay"/></span></p>
                    </div>
                </div>
            </form>

        <!-- Unnamed (Rectangle) -->
        <div id="u476" class="ax_default label">
            <div id="u476_div" class=""></div>
            <div id="u476_text" class="text ">
                <p><span><c:if test="${not empty price}"><p>Price after discount: £ <c:out value="${price}"/></p><p>Price inc VAT at 20%: £<c:out value="${price * 1.2}"/> </c:if></span></p>
                </div>
            </div>
    </c:if>
</div>

</body>
</html>
