<%-- 
    Document   : updateaccountbyadmin
    Created on : Mar 10, 2024, 3:06:44 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Apply for a Job</title>
        <!-- Bootstrap CSS -->
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/admin/sb-admin-2.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <!-- Custom CSS -->
        <style>
            body {
                background-color: #2779e2;
            }
            .section {
                background-color: #ffffff;
                border-radius: 15px;
                border: 2px solid #007bff;
            }
            .card {
                border-radius: 15px;
                border: 1px solid #007bff;
            }
            .card-body {
                background-color: #ffffff;
            }
        </style>
    </head>
    <body>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="../UIcomponents/sidebarAdmin.jsp"%>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="../UIcomponents/topbarAdmin.jsp"%>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                                        <c:set var="AddUser" value="${requestScope.THANH_CONG}"/>
                                        <p style="color:red">${AddUser}</p>
                    <section class="vh-100">
                        <div class="container h-100">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col-xl-9">
                                    <h1 class="h3 my-5 mb-4 text-gray-800" style="color: black">Đăng ký tài khoản nhân viên</h1>

                                    <form action="AddStaffByAdminController" method="POST">
                                        <div class="section">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row align-items-center pt-4 pb-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Họ Và Tên</h6>
                                                        </div>
                                                        <div class="col-md-4 pe-3">
                                                            <input type="text" class="form-control form-control-lg" name="given_name" placeholder="Họ" required />
                                                        </div>
                                                        <div class="col-md-5 pe-5">
                                                            <input type="text" class="form-control form-control-lg" name="family_name" placeholder="Tên" required />
                                                        </div>
                                                    </div>
                                                    <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Địa chỉ Email</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input type="email" class="form-control form-control-lg" name="email" placeholder="example@example.com" required />
                                                        </div>
                                                    </div>
                                                    <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Mật khẩu</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input type="password" class="form-control form-control-lg" name="password" required />
                                                        </div>
                                                    </div>
                                                     <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Nhập lại mật khẩu</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input type="password" class="form-control form-control-lg" name="confirm_password" required />
                                                        </div>
                                                    </div>
                                                    <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Số điện thoại</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input type="phone" class="form-control form-control-lg" name="phone" />
                                                        </div>
                                                    </div>
                                                    <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Vai Trò</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input type="text" class="form-control form-control-lg" name="role_id" value="Nhân viên" required readonly="" />
                                                        </div>
                                                    </div>
<!--                                                    <hr class="mx-n3">
                                                    <div class="row align-items-center py-3">
                                                        <div class="col-md-3 ps-5">
                                                            <h6 class="mb-0">Ảnh Đại Diện</h6>
                                                        </div>
                                                        <div class="col-md-9 pe-5">
                                                            <input class="form-control form-control-lg" id="formFileLg" type="file" />
                                                            <div class="small text-muted mt-2">Tải ảnh lên. Dung lượng không quá 50MB</div>
                                                        </div>
                                                    </div>-->
                                                    <hr class="mx-n3">
                                                    <div class="px-5 py-4">
                                                        <button type="submit" class="btn btn-primary btn-lg">Đăng ký</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

                                </div>
                            </div>
                        </div>

                    </section>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->

        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


<script>
    function toggleSubMenu(menuId) {
        var subMenu = document.getElementById(menuId);
        subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
    }

</script> 

</body>


<!-- Bootstrap JS -->


</html>
