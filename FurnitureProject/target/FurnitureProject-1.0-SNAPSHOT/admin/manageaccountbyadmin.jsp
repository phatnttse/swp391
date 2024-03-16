<%-- 
    Document   : dashboardadmin
    Created on : Mar 10, 2024, 2:25:22 AM
    Author     : Dell
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <title>DashBoard</title>
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-dark  sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Lofi Furniture</div>
                </a>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="staffPage">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Menu
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="UserAccountsController">
                        <span>Quản lí tài khoản</span>
                    </a>                  
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="AddStaffByAdminController">                  
                        <span>Tạo tài khoản</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="">                  
                        <span>Doanh thu</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="">                  
                        <span>Cấu hình</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">       


            </ul>
            <!-- End of Sidebar -->


            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Topbar Search -->
                        <form action="SearchUserByNameController" method="post">
                            <div class="input-group">
                                <input type="text" class="form-control" name="SearchValue" placeholder="Search for...">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2" id="SearchValue" >
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Phatntt</span>
                                    <img onclick="toggleSubMenu('sub-menu')" class="img-profile rounded-circle"
                                         src="assets/img/users/avatar.jpg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div id="sub-menu" class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>                                   
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logOut">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin The Table Manage User -->
                    <c:set var="UserAccount" value="${requestScope.LIST_USER_ROLE}"/>

                    <div class="container mt-6">
                        <h2>Danh sách tài khoản</h2>
                        <!-- Navbar Form -->
                        <form id="filterForm" class="d-flex justify-content-end" action="FilterUserController" method="post">
                            <!-- Dropdown for Filter by Role -->
                            <div class="dropdown me-2">
                                <div class="input-group">
                                    <select name="role" class="form-control">
                                        <option value="">Theo vai trò</option>
                                        <option value="Admin">Admin</option>
                                        <option value="User">User</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Dropdown for Sort -->
                            <div class="dropdown dropdown-end me-2">
                                <div class="input-group">
                                    <select name="sort" class="form-control">
                                        <option value="">Sắp xếp theo tên</option>
                                        <option value="ASC">Tên (A-Z)</option>
                                        <option value="DESC">Tên (Z-A)</option>
                                    </select>
                                    <button type="submit" class="btn btn-outline-secondary">
                                        Lọc
                                    </button>
                                </div>
                            </div>
                        </form>

                        <c:set var="success" value="${requestScope.DELETE_SUCCESS}"/>
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
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${not empty UserAccount}">
                                        <tbody>

                                            <c:forEach var="userDetail" items="${UserAccount}">
                                                <!-- Check if userDetail.delete is false -->
                                                <c:if test="${not userDetail.delete}">
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
                                                            <button type="submit" class="btn btn-outline-danger">Delete</button>
                                                        </td>
                                                        <td>
                                                            <a href="UserDetailController?Id=${userDetail.id}" class="btn btn-outline-info">Detail</a>
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
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class=" my-4 sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2020</span>
            </div>
        </div>
    </footer>
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