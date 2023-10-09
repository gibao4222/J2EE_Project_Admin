<%-- 
    Document   : Add
    Created on : Oct 12, 2020, 9:17:52 PM
    Author     : trinh
--%>
Helo
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="add-product">
            <table>
                <tr>
                <h3>${mess}</h3>
                    <td>NameProduct</td>
                    <td>
                        <input type="text" name="nameProduct">
                    </td>
                </tr>
                <tr>
                    <td>introduce</td>
                    <td>
                        <input type="text" name="introduce">
                    </td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image"</td>
                </tr>
                <tr>
                    <td></td>
                     <tr>
                    <td>size</td>
                    <td>
                        <input type="text" name="size">
                    </td>
                </tr>
                 <tr>
                    <td>stuff</td>
                    <td>
                        <input type="text" name="stuff">
                    </td>
                </tr>
                 <tr>
                    <td>quantity</td>
                    <td>
                        <input type="text" name="quantity">
                    </td>
                </tr>
                 <tr>
                    <td>price	</td>
                    <td>
                        <input type="text" name="price">
                    </td>
                </tr>
                 <tr>
                    <td>portray</td>
                    <td>
                        <input type="text" name="portray">
                    </td>
                </tr>
                    <td><button type="submit">add</button></td>
                </tr>
            </table>
        </form>
                    <a href="show-product">quay lại</a>
    </body>
</html>
