<%-- 
    Document   : Show
    Created on : Oct 12, 2020, 8:15:41 PM
    Author     : trinh
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
            <form action="update-product">
            <table border="1px solid black">
                <tr>
                <mark> ${message}</mark>
                    <th>ID</th>
                    <th>nameProduct</th>   
                    <th>introduce</th>
                    <th>image</th>
                    <th>size</th>
                    <th>stuff</th>
                    <th>quantity</th>
                    <th>portray</th>
                    <th>price</th>
                    <th >Action</th>


                </tr>
                <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.id} </td>
                    <td>  ${c.nameProduct} </td>
                     <td>  ${c.introduce} </td>
                     <td>  ${c.image} </td>
                     <td>   ${c.size}  </td>
                    
                     <td>  ${c.stuff}  </td>
                     <td>   ${c.quantity}  </td>
                     <td>   ${c.portray}  </td>
                     <td>   ${c.price}  </td>
                    
                     <td ><a href="update-product?id=<c:out value="${c.id}"/>">update</a> <a href="delete-product?id=<c:out value="${c.id}"/>">delete</a></td>
                    
                </tr>
        </c:forEach>

        </table>
            </form>
            <a href="add.jsp">Create student</a>    
    </body>
</html>
