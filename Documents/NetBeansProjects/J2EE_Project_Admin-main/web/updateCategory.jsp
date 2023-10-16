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
        <form action="save-category">
            <table>
                <tr>
                <input type="hidden" value="${cateupdate.idCategory}" name="idCategory">
                    <td>Tên danh mục</td>
                    <td>
                            <input type="text" value="${cateupdate.nameCategory}" name="nameCategory">
                    </td>
                </tr>
               
                </tr>
                    <td><button type="submit">update</button></td>
                </tr>
            </table>
        </form>
                    <a href="show-product">quay lại</a>
    </body>
</html>
