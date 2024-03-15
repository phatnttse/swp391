<%-- 
    Document   : updateaccountbyadmin
    Created on : Mar 10, 2024, 3:06:44 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đăng ký tài khoản nhân viên</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center">Đăng ký tài khoản nhân viên</h2>
                    <form action="registerServlet" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ và tên:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại:</label>
                            <input type="tel" class="form-control" id="phone" name="phone">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ:</label>
                            <input type="text" class="form-control" id="address" name="address">
                        </div>
                        <div class="mb-3">
                            <label for="roleId" class="form-label">Vai trò:</label>
                            <!-- Dropdown for selecting role -->
                            <select class="form-select" id="roleId" name="roleId" required>
                                <option value="1">Nhân viên</option>
                                <!-- Add more roles if needed -->
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="picture" class="form-label">Ảnh đại diện:</label>
                            <input type="file" class="form-control" id="picture" name="picture" accept="image/*">
                        </div>

                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (optional, for some components) -->
    </body>
</html>
