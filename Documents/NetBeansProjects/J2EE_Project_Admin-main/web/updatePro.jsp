<%-- 
    Document   : update
    Created on : Oct 9, 2023, 1:20:47 PM
    Author     : Thanhchan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="save-product">
            <table>
                <tr>
                <input type="hidden" value="${proupdate.id }" name="IdProduct">
                    <td>NameProduct</td>
                    <td>
                        <input type="text" value="${proupdate.nameProduct}" name="nameProduct">
                    </td>
                </tr>
                <tr>
                    <td>introduce</td>
                    <td>
                        <input type="text" value="${proupdate.introduce}" name="introduce">
                    </td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" value="${proupdate.image}" name="image"</td>
                </tr>
                <tr>
                    <td></td>
                     <tr>
                    <td>size</td>
                    <td>
                        <input type="text" value="${proupdate.size}" name="size">
                    </td>
                </tr>
                 <tr>
                    <td>stuff</td>
                    <td>
                        <input type="text" value="${proupdate.stuff}"  name="stuff">
                    </td>
                </tr>
                 <tr>
                    <td>quantity</td>
                    <td>
                        <input type="text" value="${proupdate.quantity}" name="quantity">
                    </td>
                </tr>
                 <tr>
                    <td>price	</td>
                    <td>
                        <input type="text" value="${proupdate.price}" name="price">
                    </td>
                </tr>
                 <tr>
                    <td>portray</td>
                    <td>
                        <input type="text" value="${proupdate.portray}" name="portray">
                    </td>
                </tr>
                    <td><button type="submit">update</button></td>
                </tr>
            </table>
        </form>
                    <a href="show-product">quay lại</a>
    </body>
</html>
