<%-- 
    Document   : test
    Created on : Mar 21, 2024, 8:52:29 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/admin/sb-admin-2.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <title>Trang đăng nhập</title>

        <style>
            .divider:after,
            .divider:before {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
            .h-custom {
                height: calc(100% - 73px);
            }
            @media (max-width: 450px) {
                .h-custom {
                    height: 100%;
                }
            }
        </style>

    </head>
    <body>
      
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="/FurnitureProject/thumbnails/views/loginAdmin.jpeg" class="img-fluid"
                             alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="LoginAdminStaff" method="post">
                            
                            <div class="divider d-flex align-items-center my-4">
                                <h3 class="text-center fw-bold mx-3 mb-0">Đăng nhập</h3>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4 my-4">
                                <input type="email" name="email" id="form3Example3" class="form-control form-control-lg"
                                       placeholder="Email" />

                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3 my-4">
                                <input type="password" name="password" id="form3Example4" class="form-control form-control-lg"
                                       placeholder="Mật khẩu" />

                            </div>
                            <c:if test="${requestScope.LOGIN_ERROR != null}">
                                <p style="color: red">${requestScope.LOGIN_ERROR}</p>
                            </c:if>

                            <div class="d-flex justify-content-between align-items-center">                           
                                <a href="#!" class="text-body">Forgot password?</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-secondary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>                               
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-secondary">
                <!-- Copyright -->
                <div class="text-white mb-3 mb-md-0">
                    © Trang quản trị của Lux Furniture <b>FurnitureProject
                </div>
                <!-- Copyright -->


            </div>
        </section>

    </body>
</html>
