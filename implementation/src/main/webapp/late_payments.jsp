<%-- 
    Document   : late_payments
    Created on : 15-Apr-2018, 13:17:39
    Author     : raymun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Late Payments</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <link href="files/late_payments/styles.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/late_payments/data.js"></script>
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


            <!-- Unnamed (Table) -->
            <div id="u479" class="ax_default">
                <table>
                    <tr style="border-bottom:3px solid white"><th>Second Reminder </th></tr>
                    <tr><th>Customer ID </th> <th>Customer Name</th><th>JobIDs </th> <th>Price</th><th>Order Date </th><th>First Reminder</th><th>Second Reminder</th></tr>
                            <c:forEach items="${default}" var="cust" varStatus="Status"> 
                        <tr><td>${cust.customerID}</td><td>${cust.name} ${cust.surname}</td><td>${jobd[Status.index]}</td><td>£${jobValued[Status.index]}</td> <td>${orderDatesd[Status.index]}</td> <td>
                                <form action="firstreminder.jsp" method="post"> <input type="hidden" value="${cust.customerID}" name="id"/> <input type="hidden" value="${cust.address}" name="address"/><input type="hidden" value="${cust.postcode}" name="postcode"/><input type="hidden" value="${cust.name}" name="name"/><input type="hidden" value="${cust.surname}" name="surname"/><input type="hidden" value="${cust.holder}" name="holder"/><input type="hidden" value="${jobd[Status.index]}" name="jobs"/> <input type="hidden" value="${jobValued[Status.index]}" name="value"/> <input type="hidden" value="${orderDatesd[Status.index]}" name="date"/> <input type="submit" value="view" ></td> </form> 
                                <form action="secondreminder.jsp" method="post" ><td><input type="hidden" value="${cust.customerID}" name="id"/> <input type="hidden" value="${cust.address}" name="address"/><input type="hidden" value="${cust.postcode}" name="postcode"/><input type="hidden" value="${cust.name}" name="name"/><input type="hidden" value="${cust.surname}" name="surname"/><input type="hidden" value="${cust.holder}" name="holder"/><input type="hidden" name="jobs" value="${jobd[Status.index]}"/> <input type="hidden" value="${jobValued[Status.index]}" name="value"/> <input type="hidden" value="${orderDatesd[Status.index]}" name="date"/><input type="submit" value="view" > </form></td></tr>
                            </c:forEach>
                        <tr style="border-bottom:3px solid white"><th>First Reminder </th></tr>
                    <tr><th>Customer ID </th> <th>Customer Name</th><th>JobIDs </th> <th>Price</th><th>Order Date </th><th>First Reminder</th> </tr>
                            <c:forEach items="${suspended}" var="cust" varStatus="Status">
                        <tr><td>${cust.customerID}</td><td>${cust.name} ${cust.surname}</td><td>${job[Status.index]}</td><td>£${jobValue[Status.index]}</td> <td>${orderDates[Status.index]}</td> <td>
                                <form action="firstreminder.jsp" method="post"> <input type="hidden" value="${cust.customerID}" name="id"/> <input type="hidden" value="${cust.address}" name="address"/><input type="hidden" value="${cust.postcode}" name="postcode"/><input type="hidden" value="${cust.name}" name="name"/><input type="hidden" value="${cust.surname}" name="surname"/><input type="hidden" value="${cust.holder}" name="holder"/><input type="hidden" value="${jobd[Status.index]}" name="jobs"/> <input type="hidden" value="${jobValued[Status.index]}" name="value"/> <input type="hidden" value="${orderDatesd[Status.index]}" name="date"/> <input type="submit" value="view" ></td> </form> </tr>
                            </c:forEach>
                </table>
      <div style="position:relative;top:-200px;left:-200px">
      <!-- Unnamed (Rectangle) -->
      <a href="bulkfirstServlet">
      <div id="u508" class="ax_default button">
        <div id="u508_div" class=""></div>
        <div id="u508_text" class="text ">
          <p><span>Print NEW first reminders</span></p>
        </div>
      </div>
      </a>
      <a href="firstServlet">
      <div id="u508" class="ax_default button">
          <div style="position:relative;left:200px">
        <div id="u508_div" class=""></div>
        <div id="u508_text" class="text " style="top:3px">
          <p><span>Print ALL first reminders</span></p>
        </div>
      </div>
      </div>
      </a>

      <!-- Unnamed (Rectangle) -->
      <a href="bulkSecondServlet">
      <div id="u509" class="ax_default button">
        <div id="u509_div" class=""></div>
        <div id="u509_text" class="text ">
          <p><span>Print NEW second reminders</span></p>
        </div>
      </div>
      </a>
  
                      <a href="SecondServlet">
      <div id="u509" class="ax_default button">
          <div style="position:relative;left:200px">
        <div id="u509_div" class=""></div>
        <div id="u509_text" class="text " style="top:3px">
          <p><span>Print ALL Second reminders</span></p>
        </div>
        </div>
   
      </div>
                           </div>
      </a>
                </div>
                
            </div>
            <!-- Unnamed (Rectangle) -->
            <div id="u501" class="ax_default label">
                <div id="u501_div" class=""></div>
                <div id="u501_text" class="text ">
                    <p><span>Current late payments </span></p>
                </div>
            </div>
        </div>
    </body>
</html>
