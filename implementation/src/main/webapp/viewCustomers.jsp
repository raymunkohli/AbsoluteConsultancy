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

  </head>
    </head>
    <body>
        <table class="">
    <tr>
        <th> Customer ID </th>
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
        <td> <c:out value="${cust.name}" /> <input type="hidden" name="firstname" value="${cust.name}"></td>
        <td> <c:out value="${cust.surname}" /> <input type="hidden" name="lastname" value="${cust.surname}"></td>
        <td> <c:out value="${cust.email}" /> <input type="hidden" name="email" value="${cust.email}"></td>
        <td> <c:out value="${cust.address}" /> <input type="hidden" name="address" value="${cust.address}"></td>
        <td> <c:out value="${cust.postcode}" /> <input type="hidden" name="status" value="${cust.postcode}"></td>
        <td> <c:out value="${cust.phoneNo}" /> <input type="hidden" name="phonenumber" value="${cust.phoneNo}"></td>
        <td> <c:out value="${discounts[custStatus.index]}" /> <input type="hidden" name="discounts" value="${discounts[custStatus.index]}"></td>
        <td> <input type="submit" value ="select"/> </td>
            </form>
    </tr>
  
    </c:forEach>
        </table>
    </body>
</html>
