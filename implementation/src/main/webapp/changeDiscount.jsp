<%-- 
    Document   : changeDiscount
    Created on : 14-Apr-2018, 06:15:31
    Author     : raymun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Set discount</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
         <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="files/bands_form/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/set_discount/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/set_discount/data.js"></script>
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
            <% if (request.getAttribute("discount").toString().equals("Fixed")) { %>
            <div style="top:0px;position:absolute;">
                <!-- Unnamed (Rectangle) -->
                <div id="u22" class="ax_default label">
                    <div id="u22_div" class=""></div>
                    <div id="u22_text" class="text ">
                        <p><span>Fixed Discount</span></p>
                    </div>
                </div>
                
                <form method="post" action="addFixedDiscountServlet">
                <!-- Unnamed (HTML Button) -->
                <div id="u28" class="ax_default html_button">
                    <input id="u28_input" type="submit" class="button" value="Submit"/>
                </div>
                <input type="hidden" value="<% out.write(request.getAttribute("discountID").toString());%>" name="discountid" />
                <!-- Unnamed (Horizontal Line) -->
                <div id="u23" class="ax_default line">
                    <img id="u23_img" class="img " src="images/set_discount/u23.png"/>
                </div>
                <!-- Unnamed (Text Field) -->
                <div id="u27" class="ax_default text_field">
                    <input id="u27_input" type="text" value="" name="amount" required/>
                </div>

                <!-- Unnamed (Rectangle) -->
                <div id="u26" class="ax_default label">
                    <div id="u26_div" class=""></div>
                    <div id="u26_text" class="text ">
                        <p><span>Fixed rate %:</span></p>
                    </div>
                </div>
                </form>
            </div>
            <% } else if (request.getAttribute("discount").toString().equals("Variable")) { %>
            <div style="top:-110px;position:absolute;">
                <div id="u24" class="ax_default line">
                    <img id="u24_img" class="img " src="images/set_discount/u23.png"/>
                </div>
                <!-- Unnamed (Rectangle) -->
                <div id="u25" class="ax_default label" style="width:500px">
        <div id="u25_div" class=""></div>
        <div id="u25_text" class="text " style="width:500px">
          <p><span>Variable Discount</span></p>
        </div>
      </div>
                <form method="post" action="addVariableDiscountServlet">
                <div id="u25" class="ax_default text" style="width:500px;top:200px;font-size:15px">
                    <table>
                        <tr><th>Task ID </th> <th> Task Description </th> <th> Discount </th> </tr>
                        
                        <c:set var="ids" value=""/>
                        
                        <c:forEach items="${tasks}" var="task">
                            <tr>
                                <td>${task.baseTaskID}</td> <td>${task.description} </td> <td><input type="text" name="${task.baseTaskID}" value="0" required></td>
                                <c:set var="ids" value="${ids}${task.baseTaskID}`"/>
                            </tr>
                        </c:forEach>
                    </table>
                                    <div id="u33" class="ax_default html_button">
                    <input id="u33_input" type="submit" class="button" value="Submit"/>
                    <input type="hidden" value="${ids}" name="ids" />
                    <input type="hidden" value="<% out.write(request.getAttribute("discountID").toString());%>" name="discountid" />
                </div>
                </div>
                </form>
            </div>
            <% } else if (request.getAttribute("discount").toString().equals("Flexible")) {%>
            <!-- Unnamed (Rectangle) -->
            <div id="u589" class="ax_default label" style="width:500px">
                <div id="u589_div" class=""></div>
                <div id="u589_text" class="text " style="width:500px">
                    <p><span>Flexible Discount</span></p>
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u590" class="ax_default line">
                <img id="u590_img" class="img " src="images/bands_form/u590.png"/>
            </div>
            <form method="post" action="manageBandServlet">
                <!-- Unnamed (HTML Button) -->
                <div id="u28" class="ax_default html_button" style="top:150px">
                    <input id="u28_input" type="submit" value="Submit"/>
                </div>
                <!-- Unnamed (Text Field) -->
                <div style="position: absolute; top:50px">
                    <div id="u27" class="ax_default text_field" style="left:200px">
                        <input id="u27_input" type="text" name="numberOfBands" value="" required/>
                    </div>
                    <input type="hidden" value="<% out.write(request.getAttribute("discountID").toString());%>" name="discountID"> 
                    <!-- Unnamed (Rectangle) -->
                    <div id="u26" class="ax_default label">
                        <div id="u26_div" class=""></div>
                        <div id="u26_text" class="text ">
                            <p><span>Enter number of bands:</span></p>
                        </div>
                    </div>
                </div>


            </form>
            <% }
            %>
            <% if (request.getParameter("numberOfBands") != null) {%>
            <!-- Unnamed (Rectangle) -->
            <div id="u589" class="ax_default label">
                <div id="u589_div" class=""></div>
                <div id="u589_text" class="text ">
                    <p><span>Manage Bands</span></p>
                </div>
            </div>

            <!-- Unnamed (Horizontal Line) -->
            <div id="u590" class="ax_default line">
                <img id="u590_img" class="img " src="images/bands_form/u590.png"/>
            </div>

            <!-- Unnamed (Table) -->
            <form method="post" action="addFlexibleDiscountServlet">
            <div id="u591" class="ax_default">
                    <table> 
                        <tr><th>Lower Bound</th> <th>Upper Bound</th> <th>Discount Amount</th></tr>
                                <c:forEach begin="0" end="${numberOfBands -1}" step="1" var="x">
                            <tr>
                                <td><input type="number" name="${x}lower" required> </td><td><input type="number" name="${x}upper" required></td><td><input type="number" name="${x}discount" required></td>
                            </tr>
                        </c:forEach>
                    </table>
            </div>
            <c:forEach begin="0" end="${numberOfBands -1}" step="1" var="x">
                <div style="position:relative;height:30px" > </div>
            </c:forEach>
            <div style="position:relative;top:-150px">
                <!-- Unnamed (Rectangle) -->
                <div id="u615" class="ax_default button">
                    <div id="u615_text" class="text " style="left:-50px">
                        <p><span><input type="submit" class="button" value="Save changes" /> </span></p>
                    </div>
                </div>

            </div>
                <input type="hidden" value="${numberOfBands-1}" name="number"/>
                <input type="hidden" value="${discountID}" name="discountID" />
            </form>
            <% }%>
        </div>


    </div>
</body>
</html>
