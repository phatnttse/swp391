<%-- 
    Document   : managedetailbyadmin
    Created on : Mar 15, 2024, 12:12:03 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/admin/sb-admin-2.min.css"> 
        <link rel="stylesheet" href="/FurnitureProject/assets/css/admin/dashboard.css"> 
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Chi tiết nhân viên</title>
        <style>
            .avatar-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .avatar {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                overflow: hidden;
                margin-bottom: 20px;
            }

            .avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .form-floating label {
                font-size: 14px;
            }

            .btn-outline-info {
                background-color: #17a2b8;
                color: #fff;
            }

            .btn-outline-info:hover {
                background-color: #138496;
                color: #fff;
            }
        </style>
    </head>
    <body>

        

        <c:set var="UserAccount" value="${requestScope.USER_DETAIL}"/>

        <form action="UpdateUsersController" method="POST">

            <div class="container mt-6">
                <h2 class="text-center mb-4 my-5">Thông tin chi tiết nhân viên: ${UserAccount.name}</h2>
                <div class="row">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <!-- Phần bên trái -->
                        <div class="avatar-container">
                            <!-- Hình tròn cho ảnh đại diện -->
                            <div class="avatar">
                                <img src="${UserAccount.picture}" alt="Avatar">
                            </div>
<!--                             Nút để tải lên ảnh đại diện 
                            <input type="file" id="avatarUpload" name="avatarUpload" style="display:none;">
                            <label for="avatarUpload" class="btn btn-outline-primary mt-3">Tải lên ảnh đại diện</label>-->
                        </div>
                    </div>
                    <div class="col-md-8">
                        <!-- Phần bên phải -->
                        <div class="table-responsive">
                            <div class="form-floating mb-3">
                                <label for="Id">Mã nhân viên</label>
                                <input type="text" class="form-control"  name="Id" value="${UserAccount.id}" readonly/>
                            </div>
                            <div class="form-floating mb-3">
                                <label for="Email">Email</label>
                                <input type="text" class="form-control" name="Email" value="${UserAccount.email}" />
                            </div>
                            <div class="form-floating mb-3">
                                <label for="Name">Tên</label>
                                <input type="text" class="form-control" name="Name" value="${UserAccount.name}" />
                            </div>
                            <div class="form-floating mb-3">
                                <label for="Phone">Số điện thoại</label>
                                <input type="text" class="form-control" name="Phone" value="${UserAccount.phone}" />
                            </div>
                            <div class="form-floating mb-3">
                                <label for="Address">Địa chỉ</label>
                                <input type="text" class="form-control" name="Address" value="${UserAccount.address}" />
                            </div>
                            <div class="form-floating mb-3">
                                <label for="roleId">Vai trò</label>
                                <input type="text" class="form-control" name="roleId" value="${UserAccount.roleName}" />
                            </div>

                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
