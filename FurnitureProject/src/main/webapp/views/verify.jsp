<%-- 
    Document   : verify
    Created on : Dec 16, 2023, 3:02:30 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/verifyStyle.css">
        <script src="assets/js/verifyJs.js"></script>
        <title>Verify Page</title>   
    </head>

    <body>

        <div class="container">

            <div class="section">
                <div class="logo">
                    <a href="">
                        <img src="assets/img/logo.webp" alt="Logo">
                    </a>
                </div>
                <div class="header">
                    <h1>Nhập mã xác thực</h1>
                </div>
                <div class="des">
                    <p>Vui lòng kiểm tra email để lấy mã xác thực và nhập vào ô bên dưới</p>
                </div>
                <form action="checkVerificationCode" method="POST">
                    <div class="code-input">
                        <input name="code1" type="number" maxlength="1"/>
                        <input name="code2" type="number" maxlength="1"/>
                        <input name="code3" type="number" maxlength="1"/>
                        <input name="code4" type="number" maxlength="1"/>
                        <input name="code5" type="number" maxlength="1"/>
                        <input name="code6" type="number" maxlength="1"/>
                    </div>
                    <c:set var="error" value="${requestScope.INCORRECT_CODE}"/>
                    <c:if test="${not empty error}">
                        ${error}
                    </c:if>
                    <div class="link">                        
                        <button type="submit">Gửi</button>                     
                        
                        <c:url var="urlRewriting" value="userVerify">
                            <c:param name="email" value="${sessionScope.EMAIL}"></c:param>                                               
                        </c:url>
                        <a href="${urlRewriting}">Gửi lại</a>

                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
<!--userVerifyController?token=Nguyen+Tran+Tan+Phat&email=phatntt1923%40gmail.com&password=Phat%40123-->

