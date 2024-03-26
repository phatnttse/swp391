<%-- 
    Document   : email
    Created on : Dec 16, 2023, 2:32:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/emailStyle.css">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <title>Email Page</title>
    </head>

    <div class="main">
        <div class="email-container">
            <form action="userVerify" method="POST">

                <input type="hidden" name="given_name" value="${sessionScope.GIVEN_NAME}">
                <input type="hidden" name="family_name" value="${sessionScope.FAMILY_NAME}">
                <input type="hidden" name="email" value="${sessionScope.EMAIL}">
                <input type="hidden" name="password" value="${sessionScope.PASSWORD}">
                


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
                        <span class="email">${sessionScope.EMAIL}</span>
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
