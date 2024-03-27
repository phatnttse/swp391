<%-- 
    Document   : dashboardadmin
    Created on : Mar 10, 2024, 2:25:22 AM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <title>DashBoard</title>
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="../UIcomponents/sidebarAdmin.jsp"%>
            <!-- End of Sidebar -->


            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="">
                    <!-- Topbar -->
                   <%@include file="../UIcomponents/topbarAdmin.jsp"%>
                    <!-- End of Topbar -->

                    <!-- Begin The Table Manage User -->
                    <c:set var="UserAccount" value="${requestScope.LIST_USER_ROLE}"/>
                    <c:set var="success" value="${requestScope.DELETE_SUCCESS}"/>

                </div>

                <div class="container-fluid">

                    <h1 class="h3 my-5 mb-4 text-gray-800">Danh sách tài khoản</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div class="row">
                                <div class="col">
                                    <h6 class="m-0 font-weight-bold text-primary">Bảng Tài Khoản</h6>
                                </div>

                                <div class="col-md-6 text-right right">
                                    <div id="sort-by">
                                        <!-- Navbar Form -->
                                        <form id="filterForm" class="d-flex justify-content-end" action="FilterUserController" method="post">
                                            <!-- Dropdown for Filter by Role -->
                                            <div class="dropdown me-2">
                                                <div class="input-group">
                                                    <select name="role" class="form-control">
                                                        <option value="User">Theo vai trò</option>
                                                        <option value="User">Khách hàng</option>
                                                        <option value="Admin">Quản trị viên</option>
                                                        <option value="Staff">Nhân viên</option>        
                                                    </select>
                                                </div>
                                            </div>

                                            <!-- Dropdown for Sort -->
                                            <div class="dropdown dropdown-end me-2">
                                                <div class="input-group">
                                                    <select name="sort" class="form-control">
                                                        <option value="ASC">Sắp xếp theo tên</option>
                                                        <option value="ASC">Tên (A-Z)</option>
                                                        <option value="DESC">Tên (Z-A)</option>
                                                    </select>
                                                    <button type="submit" class="btn btn-outline-secondary">
                                                        Lọc
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- End Sort Dropdown -->
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="deleteUsers" method="POST">
                                <div class="table-responsive">
                                    <p style="color: red">${success}</p>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Email</th>
                                                <th>Tên</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Vai trò</th>
                                                <th>Tác vụ</th>
                                            </tr>
                                        </thead>
                                        <c:if test="${not empty UserAccount}">
                                            <tbody>

                                                <c:forEach var="userDetail" items="${UserAccount}">
                                                    <!-- Check if userDetail.delete is false -->
                                                    <c:if test="${not userDetail.deleted}">
                                                        <!-- Replace the data below with your actual data from the database -->
                                                        <tr>
                                                            <td>
                                                                <input type="hidden" name="Id" value="${userDetail.id}">
                                                                ${userDetail.id}
                                                            </td>

                                                            <td>${userDetail.email}</td>
                                                            <td id="user-name">${userDetail.name}</td>
                                                            <td>${userDetail.phone}</td>
                                                            <td>${userDetail.address}</td>
                                                            <td id="user-role">
                                                                ${userDetail.roleName}
                                                            </td>
                                                            <td>

                                                                <div class="btn-group">
                                                                    <a href="UserDetailController?Id=${userDetail.id}" class="btn btn-outline-info">Chi tiết</a>
                                                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>                
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>

                                                <!-- Add more rows as needed -->
                                            </tbody>
                                        </c:if>

                                    </table>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

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
 
    function applyFilters(event) {
        event.preventDefault(); // Ngăn chặn gửi yêu cầu đến máy chủ khi nhấn nút "Lọc"

        // Lấy giá trị từ cả hai dropdown
        var roleFilterValue = document.getElementById("roleFilter").value;
        var sortFilterValue = document.getElementById("sortFilter").value;

        // Gọi hàm xử lý lọc với các giá trị đã chọn
        applyFilterByRole(roleFilterValue);
        applySortByName(sortFilterValue);

        return false; // Ngăn chặn trang được load lại
    }

// Hàm xử lý lọc theo vai trò
    function applyFilterByRole(selectedValue) {
        // Lấy tất cả các phần tử có id là "user-role"
        var userRoles = document.querySelectorAll("#user-role");

        // Duyệt qua từng phần tử và ẩn hoặc hiển thị tùy thuộc vào giá trị lọc
        userRoles.forEach(function (userRole) {
            if (selectedValue === "" || userRole.textContent.trim() === selectedValue) {
                userRole.parentElement.style.display = "table-row"; // Hiển thị phần tử
            } else {
                userRole.parentElement.style.display = "none"; // Ẩn phần tử
            }
        });
    }

// Hàm xử lý sắp xếp theo tên
    function applySortByName(selectedValue) {
        // Lấy tất cả các phần tử có id là "user-name"
        var userNames = document.querySelectorAll("#user-name");

        // Tạo mảng tạm thời để lưu trữ các phần tử
        var usersArray = [];

        // Duyệt qua từng phần tử và đưa vào mảng tạm thời
        userNames.forEach(function (userName) {
            usersArray.push(userName.parentElement);
        });

        // Sắp xếp mảng tạm thời dựa trên giá trị của các phần tử con (tên người dùng)
        if (selectedValue === "asc") {
            usersArray.sort(function (a, b) {
                var nameA = a.querySelector("#user-name").textContent.trim().toLowerCase();
                var nameB = b.querySelector("#user-name").textContent.trim().toLowerCase();
                return nameA.localeCompare(nameB);
            });
        } else if (selectedValue === "desc") {
            usersArray.sort(function (a, b) {
                var nameA = a.querySelector("#user-name").textContent.trim().toLowerCase();
                var nameB = b.querySelector("#user-name").textContent.trim().toLowerCase();
                return nameB.localeCompare(nameA);
            });
        }

        // Xóa tất cả các phần tử hiện có trong bảng
        var tableBody = document.querySelector("tbody");
        tableBody.innerHTML = "";

        // Thêm lại các phần tử đã sắp xếp vào bảng
        usersArray.forEach(function (user) {
            tableBody.appendChild(user);
        });
    }
</script> 

</body>
</html>