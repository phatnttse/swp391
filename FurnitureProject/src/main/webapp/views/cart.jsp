<%-- 
    Document   : cart
    Created on : Jan 2, 2024, 4:33:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadCrumb.jsp" %>
        <div>
             <c:set var="cart" value="${sessionScope.CART.items}"/>

             <c:forEach var="items" items="${cart}">
                 <c:set var="item" value="${items.key}"/>
                 ${item.name}
             </c:forEach>
            
                
        </div>
        
    </body>
</html>
