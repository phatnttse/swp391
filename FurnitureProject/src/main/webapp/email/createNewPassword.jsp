<%-- 
    Document   : createNewPassword
    Created on : Jan 2, 2024, 9:37:12 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/createNewPasswordStyle.css">
    </head>
    <body>
        <c:set var="error" value="${requestScope.RESET_PASSWORD_ERR}" />

        <div class="main">
            <div class="email-container">
                <form action="createNewPassword" method="POST">

                    <input type="hidden" name="email" value="${sessionScope.FORGOT_PASS_EMAIL}">


                    <div class="logo">
                        <a href="home">
                            <img src="assets/img/logo.webp" alt="Logo">
                        </a>
                    </div>
                    <div class="title">
                        <h2>Đổi mật khẩu</h2>
                    </div>
                    <div class="gmail">
                        <div class="gmail-body">
                            <img width="20px" src="assets/img/users/avatar.jpg" alt="IMG">
                            <span class="email">${sessionScope.FORGOT_PASS_EMAIL}</span>
                        </div>                       
                    </div>  
                    <div class="first-des">
                        <h3>Tạo mật khẩu mạnh</h3>
                    </div> 
                    <div class="des">
                        <p>Tạo mật khẩu mới và mạnh mà bạn không dùng cho các trang web khác</p>
                    </div>
                    <div class="enter-input">
                        <label for="">Mật khẩu</label>
                        <input type="password" name="newPass" id="" placeholder="Tạo Mật Khẩu"> 
                        <c:if test="${error != null && error.passwordErr != null}">
                            <p style="font-size: 14px;color: red">${error.passwordErr}</p>
                        </c:if>
                    </div>
                        <div class="enter-input">
                        <label for="">Nhập lại mật khẩu</label>
                        <input type="password" name="confirmNewPass" id="" placeholder="Xác Nhận">
                         <c:if test="${error != null && error.confirmPassErr != null}">
                            <p style="font-size: 14px;color: red">${error.confirmPassErr}</p>
                        </c:if>
                    </div>
                        
                    <div class="button-container">
                        <a href="home" class="cancel-link">Bỏ qua</a>
                        <button class="continue-button">Lưu mật khẩu</button>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
