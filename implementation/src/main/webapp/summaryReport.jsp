<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Summary performance report</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="files/summary_performance_report/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/summary_performance_report/data.js"></script>
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
            <a href="viewShiftManagerServlet"> <input type="button" value="Return" class="no-print"/></a>
            <input type="button" value="Print" onclick="window.print()" class="no-print" />
            
            <c:set var="nightPackaging" value="0"/>
            <c:set var="nightCopy" value="0"/>
            <c:set var="nightFinishing" value="0"/>
            <c:set var="nightDevelopment" value="0"/>
            <c:set var="dayEarlyPackaging" value="0"/>
            <c:set var="dayEarlyCopy" value="0"/>
            <c:set var="dayEarlyFinishing" value="0"/>
            <c:set var="dayEarlyDevelopment" value="0"/>
            <c:set var="dayLatePackaging" value="0"/>
            <c:set var="dayLateCopy" value="0"/>
            <c:set var="dayLateFinishing" value="0"/>
            <c:set var="dayLateDevelopment" value="0"/>
            <!-- Unnamed (Rectangle) -->
            <div id="u3" class="ax_default label" style="position:relative">
                <div id="u3_div" class=""></div>
                <div id="u3_text" class="text ">
                    <p><span>Summary performance report</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u4" class="ax_default label" style="position:relative;left:230px">
                <div id="u4_div" class=""></div>
                <div id="u4_text" class="text ">
                    <p><span>Period: ${From} - ${To}</span></p>
                </div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <c:if test="${dayShiftEarlyDate != null}">
                <div id="u5" class="ax_default label" style="width:500px;position:relative;height:auto;top:180px;left:272px">
                    <div id="u5_div" class=""></div>
                    <div id="u5_text" class="text ">
                        <p><span>Day Shift 1 (05:00 - 14:30)</span></p>
                    </div>
                    <div style="top:30px;position:relative;left:-150px">
                        <table>
                            <tr>
                                <th>Date</th><th>Copy Room </th> <th> Development </th> <th> Finishing </th> <th> Packaging </th>
                            </tr>

                            <c:forEach items="${dayShiftEarlyDate}" var="dayShiftEarlyDate" varStatus="Early">
                                <tr> 
                                    <td>${dayShiftEarlyDate}</td>
                                    <td>${dayShiftEarlyCopy[Early.index]} </td>
                                    <td>${dayShiftEarlyDevelopment[Early.index]} </td>
                                    <td>${dayShiftEarlyFinishing[Early.index]} </td>
                                    <td>${dayShiftEarlyPackaging[Early.index]} </td>
                                    <c:set var="dayEarlyPackaging" value="${dayEarlyPackaging + dayShiftEarlyPackaging[Early.index]}"/>
                                    <c:set var="dayEarlyCopy" value="${dayEarlyCopy + dayShiftEarlyCopy[Early.index]}"/>
                                    <c:set var="dayEarlyFinishing" value="${dayEarlyFinishing + dayShiftEarlyFinishing[Early.index]}"/>
                                    <c:set var="dayEarlyDevelopment" value="${dayEarlyDevelopment + dayShiftEarlyDevelopment[Early.index]}"/>
                                </tr>
                            </c:forEach>
                            <tr style="border-top:2px solid black;"><td>Total</td>
                                <td>${dayEarlyCopy}</td>
                                <td>${dayEarlyDevelopment}</td>
                                <td>${dayEarlyFinishing}</td>
                                <td>${dayEarlyPackaging}</td> </tr>
                        </table>
                    </div>
                </div>
            </c:if>
            <!-- Unnamed (Rectangle) -->
            <c:if test="${dayShiftLateDate != null}">
                <div id="u6" class="ax_default label" style="width:500px;position:relative;height:auto;top:250px" >
                    <div id="u6_div" class=""></div>
                    <div id="u6_text" class="text ">
                        <p><span>Day Shift 2 (14:30 - 22:00)</span></p>
                    </div>
                    <div style="top:30px;position:relative;left:-150px">
                        <table>
                            <tr>
                                <th>Date</th><th>Copy Room </th> <th> Development </th> <th> Finishing </th> <th> Packaging </th>
                            </tr>

                            <c:forEach items="${dayShiftLateDate}" var="dayShiftLateDate" varStatus="Early">
                                <tr> 
                                    <td>${dayShiftLateDate}</td>
                                    <td>${dayShiftLateCopy[Early.index]} </td>
                                    <td>${dayShiftLateDevelopment[Early.index]} </td>
                                    <td>${dayShiftLateFinishing[Early.index]} </td>
                                    <td>${dayShiftLatePackaging[Early.index]} </td>
                                    <c:set var="dayLatePackaging" value="${dayLatePackaging + dayShiftLatePackaging[Early.index]}"/>
                                    <c:set var="dayLateCopy" value="${dayLateCopy + dayShiftLateCopy[Early.index]}"/>
                                    <c:set var="dayLateFinishing" value="${dayLateFinishing + dayShiftLateFinishing[Early.index]}"/>
                                    <c:set var="dayLateDevelopment" value="${dayLateDevelopment + dayShiftLateDevelopment[Early.index]}"/>
                                </tr>
                            </c:forEach>
                            <tr style="border-top:2px solid black;"><td>Total</td>
                                <td>${dayLateCopy}</td>
                                <td>${dayLateDevelopment}</td>
                                <td>${dayLateFinishing}</td>
                                <td>${dayLatePackaging}</td> </tr>
                        </table>
                    </div>
                </c:if>
            </div>

            <!-- Unnamed (Rectangle) -->
            <c:if test="${nightShiftDate != null}">
                <div id="u7" class="ax_default label" style="width:500px;position:relative;height:auto;top:300px">
                    <div id="u7_div" class=""></div>
                    <div id="u7_text" class="text ">
                        <p><span>Night Shift (22:00 - 05:00)</span></p>
                    </div>
                    <div style="top:30px;position:relative;left:-150px">
                        <table>
                            <tr>
                                <th>Date</th><th>Copy Room </th> <th> Development </th> <th> Finishing </th> <th> Packaging </th>
                            </tr>

                            <c:forEach items="${nightShiftDate}" var="nightShiftDate" varStatus="Early">
                                <tr> 
                                    <td>${nightShiftDate}</td>
                                    <td>${nightShiftCopy[Early.index]} </td>
                                    <td>${nightShiftDevelopment[Early.index]} </td>
                                    <td>${nightShiftFinishing[Early.index]} </td>
                                    <td>${nightShiftPackaging[Early.index]} </td>
                                    <c:set var="nightPackaging" value="${nightPackaging + nightShiftPackaging[Early.index]}"/>
                                    <c:set var="nightCopy" value="${nightCopy + nightShiftCopy[Early.index]}"/>
                                    <c:set var="nightFinishing" value="${nightFinishing + nightShiftFinishing[Early.index]}"/>
                                    <c:set var="nightDevelopment" value="${nightDevelopment + nightShiftDevelopment[Early.index]}"/>
                                </tr>
                            </c:forEach>
                            <tr style="border-top:2px solid black;"><td>Total</td>
                                <td>${nightCopy}</td>
                                <td>${nightDevelopment}</td>
                                <td>${nightFinishing}</td>
                                <td>${nightPackaging}</td> </tr>
                        </table>
                    </div>
                </div>
            </c:if>
            <div id="u8"  class="ax_default label" style="width:800px;position:relative;height:auto;top:350px">
                <div id="u7_text" class="text " style="width:auto;left:-25px">
                    <p><span>For period (${From} - ${To})</span></p>
                </div>
                <div style="top:30px;position:relative;left:-150px">
                    <table>
                        <tr><th>Shift</th><th>Copy Room</th><th>Development</th><th>Finishing</th><th>Packaging</th></tr>
                                <c:if test="${dayShiftEarlyDate != null}">
                            <tr> <td> Day Shift 1 </th> <td>${dayEarlyCopy}</td> <td> ${dayEarlyDevelopment}</td> <td>${dayEarlyFinishing} </td> <td>${dayEarlyPackaging}</td></tr>
                        </c:if>
                        <c:if test="${dayShiftLateDate != null}">
                            <tr> <td> Day Shift 1 </th> <td>${dayLateCopy}</td> <td> ${dayLateDevelopment}</td> <td>${dayLateFinishing} </td> <td>${dayLatePackaging}</td></tr>
                        </c:if>
                        <c:if test="${nightShiftDate != null}">
                            <tr> <td> Day Shift 1 </th> <td>${nightCopy}</td> <td> ${nightDevelopment}</td> <td>${nightFinishing} </td> <td>${nightPackaging}</td></tr>
                        </c:if>
                        <tr style="border-top:2px solid black;"><td>Total</td><td>${dayEarlyCopy + dayLateCopy + nightCopy}</td><td>${dayEarlyDevelopment + dayLateDevelopment + nightDevelopment}</td>
                            <td>${dayEarlyFinishing + dayLateFinishing + nightFinishing}</td> <td>${dayEarlyPackaging + dayLatePackaging + nightSPackaging} </td>
                        </tr>


                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
