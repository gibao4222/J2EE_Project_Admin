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
            <form action="add-subimage">
 
        <div class="modal-body">

            <div class="form-group">

                <label> Idproduct </label>
                <input type="text" name="idProduct" class="form-control" placeholder="Enter idproduct"><br>
                 <label> Subimage </label>
                 <input type="text" name="subImage" class="form-control" placeholder="Enter subImage"><br>

                  <label> Note </label>
                     <input type="text" name="note" class="form-control" placeholder="Enter note"><br>

                <input type="submit" value="thêm subimage" >
            </div>
         
        </div>
        

      </form>
            <form action="update-product">
            <table border="1px solid black">
                <tr>
                <mark> ${message}</mark>
                    <th>ID</th>
                    <th>IdProduct</th>   
                    <th>Subimage</th>
                    <th>note</th>
                    <th >Action</th>


                </tr>
                <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idSubImage} </td>
                    <td>  ${c.idProduct} </td>
                     <td>  ${c.subImage} </td>
                     <td>  ${c.note} </td>
                    
                    
                     <td ><a href="edit-subimage?id=<c:out value="${c.idSubImage}"/>">update</a> <a href="delete-subimage?id=<c:out value="${c.idSubImage}"/>">delete</a></td>
                    
                </tr>
        </c:forEach>

        </table>
            </form>
            <a href="add.jsp">Create student</a>    
    </body>
</html>
