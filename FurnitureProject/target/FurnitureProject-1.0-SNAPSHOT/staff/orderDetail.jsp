<%-- 
    Document   : orderDetail
    Created on : Mar 3, 2024, 5:55:04 PM
    Author     : Admin
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
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">       
        <title>Chi tiết đơn hàng</title>
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
                    <a class="nav-link collapsed" href="">
                        <span>Sản Phẩm</span>
                    </a>                  
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="orderManagement">                  
                        <span>Đơn Hàng</span>
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
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
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
                                                   aria-describedby="basic-addon2">
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

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <form action="orderDetailManagement" method="post">
                            <c:set var="order" value="${requestScope.ORDER}"/>
                            <c:set var="order_details" value="${requestScope.ORDER_DETAILS}"/>
                            <c:set var="order_status" value="${requestScope.ORDER_STATUS}"/>
                            <h1 class="h3 my-4 mb-4 text-gray-800">Chi tiết đơn hàng</h1>

                            <div class="row">

                                <div class="col-lg-6"

                                     <!-- Circle Buttons -->
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Thông tin đơn hàng</h6>
                                        </div>
                                        <div class="card-body">                                   
                                            <div class="mb-2">
                                                <code>Đơn hàng (#${order.orderId})</code>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Person</span>
                                                <span class="form-control">${order.email}</span>
                                                <span class="form-control">${order.name}</span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">SĐT</span>
                                                <span class="form-control">${order.phone}</span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Địa chỉ giao hàng</span>
                                                <span class="form-control">${order.address}</span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group mb-3">
                                                    <label class="input-group-text font-weight-bold" for="orderStatusSelect">Trạng thái</label>
                                                    <select class="form-select" id="orderStatusSelect" name="orderStatus">
                                                        <c:forEach var="status" items="${order_status}">
                                                            <option value="${status.statusId}" ${status.name eq order.statusName ? 'selected' : ''}>${status.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Phương thức thanh toán</span>
                                                <span class="form-control">${order.paymentMethod}</span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Trang thái thanh toán</span>
                                                <span class="form-control">
                                                    <c:if test="${order.paymentStatus == true}">
                                                        Đã thanh toán
                                                    </c:if>
                                                    <c:if test="${order.paymentStatus == false}">
                                                        Chưa thanh toán
                                                    </c:if>
                                                </span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Ngày đặt hàng</span>
                                                <span class="form-control">${order.createdAt}</span>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text font-weight-bold">Ghi chú</span>
                                                <textarea class="form-control">${order.note}</textarea>                                             
                                            </div>
                                        </div>

                                    </div>



                                </div>

                                <div class="col-lg-6">

                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Thông tin sản phẩm</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="container mt-3">                                                     
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Hình Ảnh</th>
                                                            <th>Tên Sản Phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng</th>                                                                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="detail" items="${order_details}">
                                                            <tr>
                                                                <td>
                                                                    <img src="${detail.thumbnail}" class="rounded" width="80px" height="80px" alt="${detail.title}"/>                                                              
                                                                </td>
                                                                <td>${detail.title}</td>
                                                                <td>
                                                                    <script>
                                                                        var price = parseFloat('${detail.price}');
                                                                        var formattedPrice = price.toLocaleString('vi-VN') + '₫';
                                                                        document.write(formattedPrice);
                                                                    </script>

                                                                </td>
                                                                <td class="text-center">${detail.quantity}</td>
                                                            </tr>  
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" my-2 card shadow mb-4">

                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Cập nhật</h6>
                                        </div>
                                        <div class="card-body">
                                            <input type="hidden" name="orderId" value="${order.orderId}"/>
                                            <button type="submit" class="btn btn-google btn-block">Lưu</button>
                                            <a href="/FurnitureProject/orderManagementPage" class="btn btn-facebook btn-block"><i
                                                    class="fab fa-facebook-f fa-fw"></i>Quay Lại</a>

                                        </div>
                                    </div>


                                </div>

                            </div>
                        </form>



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
        </script> 
    </body>
</html>
