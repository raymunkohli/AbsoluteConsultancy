<%-- 
    Document   : viewAllTasks
    Created on : 20-Mar-2018, 18:25:12
    Author     : raymun
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body
            {
                font-family: sans-serif;
                font-size: 11pt;
            }

            table, th, td
            {
                border: 1px;
                border-collapse: collapse;
            }

            th, td
            {
                padding: 10px;
                text-align: center;
            }

            th
            {
                background-color: #111e61;
                color: white;
            }
        </style>
    </head>
    <body>
        <form action="selectedTasksServlet" method="post">
            <table>
                <tr>
                    <th> Task Id </th>
                    <th> Task Name </th>
                    <th> Description </th>
                    <th> Department </th>
                    <th> Price </th>
                    <th> Discount </th>
                    <th> Select </th>
                </tr>
                <c:forEach items="${Tasks}" var="tasks" varStatus="tasksStatus">
                    <tr>                 
                        <td> <c:out value="${tasks.baseTaskID}"/></td> 
                        <td> <c:out value="${tasks.taskName}"/></td> 
                        <td> <c:out value="${tasks.description}"/></td>
                        <td> <c:out value="${tasks.department}"/></td> 
                        <td> <c:out value="${tasks.price}"/></td>
                        <c:choose>
                            <c:when test="${sessionScope.DiscountType eq 'Variable Discount'}">
                                <td> <c:out value ="${VariableDiscounts[tasksStatus.index].amount} %"/> </td>
                            </c:when>
                            <c:otherwise>
                                <td> <c:out value="${sessionScope.Discount} %" /> 555 </td>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:choose>
                            <c:when test="${sessionScope.DiscountType eq 'Variable Discount'}">
                                <td><input type="checkbox" value="${tasks.baseTaskID}`${tasks.taskName}`${tasks.description}`${tasks.department}`${tasks.price}`${VariableDiscounts[tasksStatus.index].amount}" id="${tasks.baseTaskID}" name="${tasks.baseTaskID}"/> </td>
                                </c:when>
                                <c:otherwise>
                                <td><input type="checkbox" value="${tasks.baseTaskID}`${tasks.taskName}`${tasks.description}`${tasks.department}`${tasks.price}`${sessionScope.Discount}" id="${tasks.baseTaskID}" name="${tasks.baseTaskID}"/> </td>
                                </c:otherwise>
                            </c:choose>
                    </tr>
                </c:forEach>

            </table>
            <input type="submit" value="Add Tasks" />
        </form>
    </body>
</html>
