<%-- 
    Document   : newjsp
    Created on : Oct 12, 2023, 11:00:43 PM
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
       <form action="">
            <table border="1px solid black">
                <tr>
                <mark> ${message}</mark>
                    <th>IDOrderdetail</th>
                    <th>IDOrder</th>
                    <th>IDProduct</th>
                    <th>DateCreated</th>
                    <th>Quantity</th>
                    <th>price</th>
                    <th>total</th>
                    <th>IDSale</th>
                    
                

                </tr>
                <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idOrderDetail} </td>
                    <td>  ${c.idOrder} </td>
                    <td>  ${c.idProduct} </td>
                    <td>  ${c.dateCreated} </td>
                    <td>  ${c.quantity} </td>
                    <td>  ${c.price} </td>
                    <td>  ${c.total} </td>
                    <td>  ${c.idSale} </td>
                    
              
                </tr>
        </c:forEach>

        </table>
            </form>
    </body>

</html>

    </script>
