<%@ page import="java.util.List" %>
<%@ page import="DAL.Order" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <table border="1px solid black">
        <tr>
            <th>ID</th>
            <th>IDCustomer</th>
            <th>DateCreated</th>
            <th>TotalBill</th>
            <th>Status</th>
        </tr>
        <c:forEach items="${data}" var="order">
            <tr>
                <td>${order.idOrders}</td>
                <td>${order.idCustomer}</td>
                <td>${order.dateCreated}</td>
                <td>${order.totalBill}</td>
                <td>${order.status}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
