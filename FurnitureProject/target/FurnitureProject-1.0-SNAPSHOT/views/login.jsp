<%-- 
    Document   : login
    Created on : Nov 29, 2023, 11:50:33 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/login.css"/>
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>      
        <c:set var="error" value="${requestScope.LOGIN_ERROR}"/>
        <div id="main">
            <c:if test="${requestScope.notification != null}">
                <p class="a-center" style="color: #f94d45;margin-left: 4px;">${requestScope.notification}</p>
            </c:if>
        </div>
        <section class="section">
            <div class="container">
                <div class="wrap_background_aside page_login">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xl-4 offset-0 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3 col-12">
                            <div class="row">
                                <div class="page-login pagecustome clearfix">
                                    <div class="wpx">
                                        <h1 class="title_heads a-center">
                                            <span>Đăng nhập</span>
                                        </h1>
                                        <span class="block a-center dkm margin-top-10">
                                            Nếu bạn chưa có tài khoản, <a href="registerPage" class="btn-link-style btn-register">đăng ký tại đây</a>
                                        </span>
                                        <div id="login" class="section">
                                            <form method="post" action="login" id="customer_login" accept-charset="UTF-8">
                                                <input name="FormType" type="hidden" value="customer_login"/>
                                                <input name="utf8" type="hidden" value="true"/>
                                                <span class="form-signup" style="color:red;"></span>
                                                <div class="form-signup clearfix">
                                                    <fieldset class="form-group">
                                                        <input type="text" class="form-control form-control-lg" value="${param.username}" name="username" id="customer_email" placeholder="Tài khoản" Required>
                                                    </fieldset>
                                                    <fieldset class="form-group">
                                                        <input type="password" class="form-control form-control-lg" value="" name="password" id="customer_password" placeholder="Mật khẩu" Required>
                                                    </fieldset>
                                                    <c:if test="${requestScope.LOGIN_ERROR != null}">
                                                        <p style="color: #f94d45;margin-left: 4px;">${requestScope.LOGIN_ERROR}</p>
                                                    </c:if>
                                                    <div class="pull-xs-left">
                                                        <input class="btn btn-style btn_50" type="submit" value="Đăng nhập"/>                                                     
                                                        <a class="block a-center quenmk" href="enterEmailPage" class="a-center">Quên mật khẩu</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="block social-login--facebooks">
                                            <p class="a-center">Hoặc đăng nhập bằng
                                            </p>                                                                                
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:6969/FurnitureProject/loginWithGoogle&response_type=code
                                               &client_id=989469650876-pv3l59tm6f8ovljdpb0t7inem5qfsejl.apps.googleusercontent.com&approval_prompt=force"><img width="129px" height="37px" src="assets/img/gp-btn.svg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>
