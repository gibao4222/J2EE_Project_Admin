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
        <form action="save-subimage"
            <table>
                <tr>
                <input type="hidden" value="${subupdate.idSubImage}" name="idSubImage">
                    <td>Id Product</td>
                    <td>
                            <input type="text" value="${subupdate.idProduct}" name="idProduct">
                    </td>
                     <td>subimage</td>
                    <td>
                            <input type="text" value="${subupdate.subImage}" name="subImage">
                    </td>
                     <td>note</td>
                    <td>
                            <input type="text" value="${subupdate.note}" name="note">
                    </td>
                </tr>
               
                </tr>
                    <td><button type="submit">update</button></td>
                </tr>
            </table>
        </form>
                    <a href="show-subimage  ">quay lại</a>
    </body>
</html>
