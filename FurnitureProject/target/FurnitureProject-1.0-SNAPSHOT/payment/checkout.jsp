<%-- 
    Document   : checkout
    Created on : Mar 5, 2024, 12:10:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
           <div class="header clearfix">

                <h3 class="text-muted">VNPAY PAYMENT</h3>
            </div>
                <div class="form-group">
                    <button onclick="pay()">Giao dịch thanh toán</button><br>
                </div>             
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div> 
        <script>
             function pay() {
              window.location.href = "payment/vnpay_pay.jsp";
            }           
        </script>
    </body>
</html>
