<%-- 
    Document   : vnPay
    Created on : Mar 4, 2024, 2:54:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh Toán</title>
    </head>
    <body>
        <form action="checkout" method="get">
            <input type="text" name="orderId" value="${requestScope.ORDER_ID}" />
            <button type="submit" class="btn btn-checkout spinner">
                <span class="spinner-label">Thanh Toán</span>
            </button>
        </form>

    </body>
</html>
