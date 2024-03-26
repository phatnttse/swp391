<%-- 
    Document   : fgPassEmail
    Created on : Jan 2, 2024, 9:27:36 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/emailStyle.css">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">

     
    </head>
    <body>
       
        <div class="main">
            <div class="email-container">
                <form action="confirmVerificationResetPass" method="POST">

                    <input type="hidden" name="email" value="${sessionScope.FORGOT_PASS_EMAIL}">


                    <div class="logo">
                        <a href="home">
                            <img src="/FurnitureProject/thumbnails/views/logoEmail.jpg" alt="Logo">
                        </a>
                    </div>
                    <div class="title">
                        <h2>Xác minh tài khoản</h2>
                    </div>
                    <div class="des">
                        <p>Để giữ an toàn cho tài khoản của bạn, chúng tôi muốn đảm bảo rằng bạn chính là người đang cố đăng nhập</p>
                    </div> 
                    <div class="gmail">
                        <div class="gmail-body">
                            <img width="20px" src="assets/img/users/avatar.jpg" alt="IMG">
                        <span class="email">${sessionScope.FORGOT_PASS_EMAIL}</span>
                        </div>
                        
                    </div>  
                    <div class="btn-continue">                                                                  
                        <button type="submit">Tiếp tục</button>
                    </div>         

                </form>
            </div>
        </div>
    </body>
</html>
