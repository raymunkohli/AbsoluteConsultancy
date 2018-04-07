<%-- 
    Document   : viewPaymentCust
    Created on : 02-Apr-2018, 18:25:34
    Author     : raymun
--%>
<%@ include file="receptionistCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title> Select cust </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <title>Payment</title>
    </head>
    <body>
        <table>
    <tr>
        <th> Cust ID </th>
        <th> Account Holder </th>
        <th> Firstname </th>
        <th> Surname </th>
        <th> Address </th>
        <th> Postcode </th>
        <th> Phone Number </th>
        <th> Select </th>
    </tr>
    
    <c:forEach items="${Customer}" var ="cust" varStatus ="custStatus">


            <tr>
            <form action="selectedPaymentCust" method="post">
                <td> <c:out value="${cust.customerID}" /> <input type="hidden" name="id" value="${cust.customerID}"></td>
                <td> <c:out value="${cust.holder}" /> <input type="hidden" name="id" value="${cust.holder}"></td>
                <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
                <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
                <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
                <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="status" value="${cust.postcode}"></td>
                <td> <c:out value="${cust.phoneNo}" /> <input type="hidden" name="phonenumber" value="${cust.phoneNo}"></td>
                <td> <input type="submit" value ="select"/> </td>
            </form>
        </tr>

    </c:forEach>
    </table>
        
    </body>
</html>
