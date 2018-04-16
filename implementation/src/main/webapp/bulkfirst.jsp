<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <html moznomarginboxes mozdisallowselectionprint>
        <head>
            <title>First reminder</title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
            <meta name="apple-mobile-web-app-capable" content="yes"/>
            <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
            <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
            <link href="data/styles.css" type="text/css" rel="stylesheet"/>
            <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
            <link href="files/first_reminder/styles.css" type="text/css" rel="stylesheet"/>
            <script src="resources/scripts/jquery-1.7.1.min.js"></script>
            <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
            <script src="resources/scripts/prototypePre.js"></script>
            <script src="data/document.js"></script>
            <script src="resources/scripts/prototypePost.js"></script>
            <script src="files/first_reminder/data.js"></script>
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
            <style>


            </style>
        </head>
        <body>
            <a href="latePaymentServlet"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />
            <c:forEach items="${suspended}" var="cust" varStatus="Status">
                <div id="" class="" style="position:relative;height:297mm;z-index: 50;overflow: visible">
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
                            <p><span>Bloomsbury's Image Processing Laboratory </span></p><p><span>2,Wynyatt Street, EC1V 7HU</span></p><p><span>Phone: 0207 235 7534</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u2" class="ax_default label">
                        <div id="u2_div" class=""></div>
                        <div id="u2_text" class="text ">
                            <p><span>${cust.holder}</span></p><p><span> ${cust.name} ${cust.surname}</span></p><p><span>${cust.address} </span></p><p><span>${cust.postcode}</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u3" class="ax_default label">
                        <div id="u3_div" class=""></div>
                        <div id="u3_text" class="text ">
                            <p><span>
                                    <jsp:useBean id="now" class="java.util.Date" />
                                    <fmt:formatDate var="date" value="${now}"  />
                                    ${date}</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u4" class="ax_default label">
                        <div id="u4_div" class=""></div>
                        <div id="u4_text" class="text ">
                            <p><span>Dear  ${cust.name} ${cust.surname}</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u5" class="ax_default label">
                        <div id="u5_div" class=""></div>
                        <div id="u5_text" class="text ">
                            <p><span>FIRST REMINDER </span></p>
                        </div>
                    </div>


                    <!-- Unnamed (Rectangle) -->
                    <div id="u7" class="ax_default label">
                        <div id="u7_div" class=""></div>
                        <div id="u7_text" class="text ">
                            <p><span>Jobs: ${job[Status.index]}&nbsp; &nbsp; &nbsp; &nbsp; </span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u8" class="ax_default label">
                        <div id="u8_div" class=""></div>
                        <div id="u8_text" class="text ">
                            <p><span>Amount: £ <fmt:formatNumber type="number" maxFractionDigits="2"  minFractionDigits="2" value="${ jobValue[Status.index] }"/> </span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u9" class="ax_default label">
                        <div id="u9_div" class=""></div>
                        <div id="u9_text" class="text ">
                            <p><span>According to our records, it appears that we have not yet received payment of the above jobs, </span></p> <p><span>which was posted to you on ${orderDates[Status.index]} for photographic work done in our laboratory.  </span></p>

                            <p> <span>We would appreciate payment at your earliest convenience.  </span></p>

                            <p><span>If you have already sent a payment to us recently, please accept our apologies.</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u10" class="ax_default label">
                        <div id="u10_div" class=""></div>
                        <div id="u10_text" class="text ">
                            <p><span>Yours sincerely, G.Lancaster</span></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </body>
    </html>
