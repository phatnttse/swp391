<%-- 
    Document   : loginAdminStaff
    Created on : Mar 20, 2024, 1:16:07 AM
    Author     : Dell
--%>

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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <title>DashBoard</title>
        <style>
            .custom-bg-image {
                background-image: url('https://tc.cdnchinhphu.vn/Uploaded/nguyenthilananh/2013_06_07/B7900792-9CE2-497B-9B62-E98B61C7675A_mw1024_n_s.jpg'); /* Thay 'link_den_hinh_anh_cua_ban.jpg' bằng đường dẫn tới hình ảnh bạn muốn sử dụng */
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body class="bg-gradient-primary">

        <div class="container">
            <form action="LoginAdminStaffController" method="POST">
                <!-- Outer Row -->
                <div class="row justify-content-center">

                    <div class="col-xl-10 col-lg-12 col-md-9">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-6 d-none d-lg-block custom-bg-image"></div>
                                    <div class="col-lg-6">
                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                            </div>
                                            <form class="user">
                                                <div class="form-group">
                                                    <input type="email" class="form-control form-control-user" name="email"  aria-describedby="emailHelp" placeholder="Enter Email Address...">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user" name="password" placeholder="Password">
                                                </div>
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox small">
                                                        <input type="checkbox" class="custom-control-input" id="customCheck">
                                                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                                    Đăng nhập
                                                </button>
                                            </form>
                                            <hr>
                                            <div class="text-center">
                                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                                            </div>
                                            <div class="text-center">
                                                <a class="small" href="register.html">Create an Account!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </form>


        </div>

        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
