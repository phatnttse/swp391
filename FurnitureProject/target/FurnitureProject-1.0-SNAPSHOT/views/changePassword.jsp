<%-- 
    Document   : changePassword
    Created on : Mar 9, 2024, 3:01:06 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Đổi mật khẩu</title>
        <style>
            ::placeholder {
                font-size: 0.95rem;
                opacity: 0.2;
            }
             .form-control {
            height: 52px; 
        }
        </style>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>
        <c:set var="error" value="${requestScope.CHANGE_PASS_ERROR}"/>
        <div class="container mt-5 mb-5">           
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4 text-center">Đổi Mật Khẩu</h4>
                            <form action="changePassword" method="post">
                                <div class="mb-3">
                                    <label for="currentPassword" class="form-label">Mật khẩu cũ*</label>
                                    <input type="password" name="oldPass" class="form-control" id="currentPassword" placeholder="Nhập mật khẩu cũ">
                                    <c:if test="${error != null && error.oldPassIncorrect != null}">
                                        <br>
                                        <p style="font-size: 14px;color: red">${error.oldPassIncorrect}</p>
                                    </c:if>
                                </div>
                                <div class="mb-3">
                                    <label for="newPassword" class="form-label">Mật khẩu mới*</label>
                                    <input type="password" name="newPass" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới">
                                    <c:if test="${error != null && error.passwordRegexError != null}">
                                        <br>
                                        <p style="font-size: 14px;color: red">${error.passwordRegexError}</p>
                                    </c:if>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Nhập lại*</label>
                                    <input type="password" name="confirmNewPass" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu mới">
                                    <c:if test="${error != null && error.confirmNotMatch != null}">
                                        <br>
                                        <p style="font-size: 14px;color: red">${error.confirmNotMatch}</p>
                                    </c:if>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-info">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>
