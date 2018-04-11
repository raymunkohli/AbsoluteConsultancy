<%-- 
    Document   : selectCustForReport
    Created on : 09-Apr-2018, 07:44:50
    Author     : raymun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"  media="all"/>
        <title>Select Customer</title>
    </head>
    <body>
        <table>
            <tr><th>Cust ID</th><th>Holder</th><th>Name</th><th>PhoneNo</th><th>Email</th> <th>Address</th><th>Postcode</th><th>Select</th>
                    <c:forEach items="${cust}" var="Cust">
                <tr>
                <td>${Cust.customerID}</td><td>${Cust.holder}</td> <td>${Cust.name} ${Cust.surname}</td> 
                    <td>${Cust.phoneNo}</td> <td>${Cust.email}</td> <td>${Cust.address}</td> <td>${Cust.postcode}</td>
                <form action="shiftManager.jsp" method="post" >
                    <input type="hidden" name="Customer" value="${Cust.customerID}"/> 
                    <input type="hidden" name="CustomerName" value="${Cust.name} ${Cust.surname}"/> 
                    <td> <input type="submit" value="Select"/> </td>    
                </form>
                
        </tr>
    </c:forEach>
</table>
</body>
</html>
