<!-- <%-- 
    Document   : register
    Created on : Dec 14, 2023, 6:24:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="assets/css/registerStyle.css">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <title>Register</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header3.jsp"%>
        <%@include file="../UIcomponents/breadCrumb.jsp" %>
        <section class="section">
            <div class="container">
                <div class="background-aside page-login">                                    
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xl-4 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3" style="margin: auto;">
                            <div class="row no-margin align-items-center" style="background: #fff;border-radius: 5px;">
                                <div class="page-login pagecustome clearfix no-padding">
                                    <div class="wpx">
                                        <ul class="auth-block-menulist">
                                            <li>
                                                <a href="loginPage" title="Đăng nhập">Đăng nhập</a>
                                            </li>
                                            <li class="active">
                                                <a href="registerPage" title="Đăng ký">Đăng ký</a>
                                            </li>
                                        </ul>
                                        <h1 class="title-heads a-center">
                                            <span>Đăng ký</span>
                                        </h1>
                                        <div id="register">
                                            <form action="register" method="POST">
                                                <c:set var="error" value="${requestScope.REGISTER_ERRORS}"/>
                                                <div class="form-signup clearfix">
                                                    <div class="row">
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="text" name="family_name" value="${param.family_name}" placeholder="Họ" required class="form-control form-control-lg">
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="text" name="given_name" value="${param.given_name}" placeholder="Tên" required class="form-control form-control-lg">
                                                            </fieldset>                                                           
                                                        </div>                                                                                                                                                                    
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="email" name="email" placeholder="Email" required class="form-control form-control-lg">
                                                            </fieldset>                                                           
                                                        </div>
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="text" name="username" placeholder="Tài khoản" required class="form-control form-control-lg">
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="password" name="password"  value="" placeholder="Mật khẩu" required class="form-control form-control-lg">
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                            <fieldset class="form-group">
                                                                <input type="password" name="confirm_password"  value="" placeholder="Nhập lại mật khẩu" required class="form-control form-control-lg">
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <div class="section">
                                                        <button type="submit" value="Đăng ký" class="btn btn-style btn_50">Đăng ký</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <div class="block social-login-facebooks margin-top-15">
                                                <p class="a-center">Hoặc đăng nhập bằng</p>
                                                <a href="#" class="social-login-facebooks">
                                                    <img width="129px" height="37px" src="assets/img/fb-btn.svg" alt="">
                                                </a>
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
            </div>
        </section>
        <!-- <%@include file="../UIcomponents/footer.jsp" %> -->
    </body>
</html>


