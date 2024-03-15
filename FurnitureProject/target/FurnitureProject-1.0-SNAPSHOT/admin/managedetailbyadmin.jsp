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
    <div class="container mt-6">
        <h2 class="text-center mb-4">Thông tin chi tiết nhân viên: Mã nhân viên</h2>
        <form action="UpdateAccountServlet" method="POST">
            <div class="row">
                <div class="col-md-4 d-flex justify-content-center align-items-center">
                    <!-- Phần bên trái -->
                    <div class="avatar-container">
                        <!-- Hình tròn cho ảnh đại diện -->
                        <div class="avatar">
                            <img src="path_to_avatar_image.jpg" alt="Avatar">
                        </div>
                        <!-- Nút để tải lên ảnh đại diện -->
                        <input type="file" id="avatarUpload" name="avatarUpload" style="display:none;">
                        <label for="avatarUpload" class="btn btn-outline-primary mt-3">Tải lên ảnh đại diện</label>
                    </div>
                </div>
                <div class="col-md-8">
                    <!-- Phần bên phải -->
                    <div class="table-responsive">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="Id" name="Id" placeholder="ID" readonly/>
                            <label for="Id">Mã nhân viên</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="Email" name="Email" placeholder="Email" />
                            <label for="Email">Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="Name" name="Name" placeholder="Tên" />
                            <label for="Name">Tên</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="tel" class="form-control" id="Phone" name="Phone" placeholder="Số điện thoại" />
                            <label for="Phone">Số điện thoại</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="Address" name="Address" placeholder="Địa chỉ" />
                            <label for="Address">Địa chỉ</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="roleId" name="roleId" placeholder="Vai trò" />
                            <label for="roleId">Vai trò</label>
                        </div>
                        <button type="submit" class="btn btn-outline-info">Delete</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
