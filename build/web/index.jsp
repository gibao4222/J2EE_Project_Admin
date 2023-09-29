<%-- 
    Document   : index.jsp
    Created on : Sep 28, 2023, 9:33:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="components.HeaderComponent"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./resources/css/styleComponent.css">
    </head>
    <body>
        <!--                                                                 Header                                                                      -->
        <%
            String icon1="<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"80\" viewBox=\"0 0 45 45\" fill=\"none\"><path d=\"M8.33333 30.0002H31.6667V18.3852C31.6667 11.9135 26.4433 6.66683 20 6.66683C13.5567 6.66683 8.33333 11.9135 8.33333 18.3852V30.0002ZM20 3.3335C28.2833 3.3335 35 10.0718 35 18.3852V33.3335H5V18.3852C5 10.0718 11.7167 3.3335 20 3.3335ZM15.8333 35.0002H24.1667C24.1667 36.1052 23.7277 37.165 22.9463 37.9464C22.1649 38.7278 21.1051 39.1668 20 39.1668C18.8949 39.1668 17.8351 38.7278 17.0537 37.9464C16.2723 37.165 15.8333 36.1052 15.8333 35.0002Z\" fill=\"#7E7A7A\"/></svg>";
            String icon2="<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"50\" height=\"80\" viewBox=\"0 0 55 55\" fill=\"none\"><path d=\"M25.0002 25.0002C22.7085 25.0002 20.7467 24.1842 19.1147 22.5522C17.4828 20.9203 16.6668 18.9585 16.6668 16.6668C16.6668 14.3752 17.4828 12.4134 19.1147 10.7814C20.7467 9.14947 22.7085 8.3335 25.0002 8.3335C27.2918 8.3335 29.2536 9.14947 30.8856 10.7814C32.5175 12.4134 33.3335 14.3752 33.3335 16.6668C33.3335 18.9585 32.5175 20.9203 30.8856 22.5522C29.2536 24.1842 27.2918 25.0002 25.0002 25.0002ZM8.3335 41.6668V35.8335C8.3335 34.6529 8.63766 33.5675 9.246 32.5772C9.85433 31.587 10.6613 30.8321 11.6668 30.3127C13.8196 29.2363 16.0071 28.4286 18.2293 27.8897C20.4516 27.3509 22.7085 27.0821 25.0002 27.0835C27.2918 27.0835 29.5488 27.3529 31.771 27.8918C33.9932 28.4307 36.1807 29.2377 38.3335 30.3127C39.3404 30.8335 40.1481 31.5891 40.7564 32.5793C41.3647 33.5696 41.6682 34.6543 41.6668 35.8335V41.6668H8.3335ZM12.5002 37.5002H37.5002V35.8335C37.5002 35.4516 37.4043 35.1043 37.2127 34.7918C37.021 34.4793 36.7696 34.2363 36.4585 34.0627C34.5835 33.1252 32.6911 32.4224 30.7814 31.9543C28.8717 31.4863 26.9446 31.2516 25.0002 31.2502C23.0557 31.2502 21.1286 31.4849 19.2189 31.9543C17.3092 32.4238 15.4168 33.1266 13.5418 34.0627C13.2293 34.2363 12.9772 34.4793 12.7856 34.7918C12.5939 35.1043 12.4988 35.4516 12.5002 35.8335V37.5002ZM25.0002 20.8335C26.146 20.8335 27.1272 20.4252 27.9439 19.6085C28.7606 18.7918 29.1682 17.8113 29.1668 16.6668C29.1668 15.521 28.7585 14.5397 27.9418 13.7231C27.1252 12.9064 26.1446 12.4988 25.0002 12.5002C23.8543 12.5002 22.8731 12.9085 22.0564 13.7252C21.2397 14.5418 20.8321 15.5224 20.8335 16.6668C20.8335 17.8127 21.2418 18.7939 22.0585 19.6106C22.8752 20.4272 23.8557 20.8349 25.0002 20.8335Z\" fill=\"#7E7A7A\"/></svg>";
            HeaderComponent header = new HeaderComponent("Dashboard",icon1,icon2,"header");
            String headerHTML =header.generateHTML();
            
        %>
        <%=headerHTML%>
        
    </body>
</html>
