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
    </head>
    <body>
        <form action="" method="post">
        <table>
            <tr>
                <th> Task Id </th>
                <th> Task Name </th>
                <th> Description </th>
                <th> Department </th>
                <th> Price </th>
                <th> Select </th>
            </tr>
            <c:forEach items="${Tasks}" var="tasks">
                <tr>                 
                    <th> <c:out value="${tasks.baseTaskID}"/></th>
                    <th> <c:out value="${tasks.taskName}"/></th>
                    <th> <c:out value="${tasks.description}"/></th>
                    <th> <c:out value="${tasks.department}"/></th>
                    <th> <c:out value="${tasks.price}"/></th>  
                    <th> <input type="checkbox" value="${tasks}"/></th>
                </tr>
            </c:forEach>

        </table>
            <input type="submit" value="Add Tasks" />
        </form>
    </body>
</html>
