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
        <link rel="stylesheet" href="assets/css/register.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <title>Đăng ký</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>
                                                                                                                          
        <section class="section">
                <div class="container ">
                    <div class="wrap_background_aside  page_login">
                        <div class="wrap_background_aside">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12 col-xl-4 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3">
                                    <div class="row">
                                        <div class="page-login pagecustome clearfix">
                                            <div class="wpx">
                                                <h1 class="title_heads a-center">
                                                    <span>Đăng ký</span>
                                                </h1>
                                                <span class="block a-center dkm margin-top-10">
                                                    Đã có tài khoản, đăng nhập <a href="loginPage" class="btn-link-style btn-register">tại đây</a>
                                                </span>
                                                <div id="login" class="section">
                                                    <form method="post" action="register" id="customer_register" accept-charset="UTF-8">                                                                                                                                                                                                                  
                                                        <div class="form-signup clearfix">
                                                            <div class="row">
                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input type="text" class="form-control form-control-lg" value="${param.family_name}" name="family_name" id="lastName" placeholder="Họ" required>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input type="text" class="form-control form-control-lg" value="${param.given_name}" name="given_name" id="firstName" placeholder="Tên" required>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="" name="email" id="email" placeholder="Email" required="">
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input placeholder="Tài khoản" type="text" class="form-control form-control-comment form-control-lg" name="username" Required>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input type="password" class="form-control form-control-lg" value="" name="password" id="password" placeholder="Mật khẩu" required>
                                                                    </fieldset>
                                                                </div>
                                                                                                                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                                                    <fieldset class="form-group">
                                                                        <input type="password" class="form-control form-control-lg" value="" name="confirm_password" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="section">
                                                                <button type="submit" value="Đăng ký" class="btn  btn-style btn_50">Đăng ký</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <div class="block social-login--facebooks margin-top-15">
                                                        <p class="a-center">Hoặc đăng nhập bằng</p>                                                                                                          
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
                </div>
            </section>                                                    
        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>


