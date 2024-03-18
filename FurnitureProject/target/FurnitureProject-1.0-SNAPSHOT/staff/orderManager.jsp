<%-- 
    Document   : staff
    Created on : Mar 3, 2024, 2:53:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">     
        <title>Trang Quản Lý</title>
        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="../UIcomponents/sidebar.jsp"%>    

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->

                <div id="content">

                   <%@include file="../UIcomponents/topbar.jsp"%>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Content Row -->
<!--                        <div class="row my-5">

                             Earnings (Monthly) Card Example 
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Số đơn hiện tại</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.ORDERS_CURRENT}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             Earnings (Monthly) Card Example 
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Đơn hàng trong ngày</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.ORDERS_BYDAY}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             Earnings (Monthly) Card Example 
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Đơn hàng trong tháng</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.ORDERS_BYMONTH}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             Pending Requests Card Example 
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Đơn hàng đã huỷ</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.ORDERS_CANCELLED}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                        <c:set var="orders" value="${requestScope.ORDERS}"/>

                        <h1 class="h3 my-5 mb-4 text-gray-800">Đơn Hàng</h1
                        <!-- Navbar Form -->
                        <form id="filterForm" class="d-flex justify-content-end" action="FilterUserController" method="post">
                            <!-- Dropdown for Filter by Role -->
                            <div class="dropdown me-2">
                                <div class="input-group">
                                    <select name="role" class="form-control">
                                        <option value="">Theo ngày</option>
                                        <option value="Admin">Trong ngày</option>
                                        <option value="User">Hôm qua</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Dropdown for Sort -->
                            <div class="dropdown dropdown-end me-2">
                                <div class="input-group">
                                    <select name="sort" class="form-control">
                                        <option value="">Theo trạng thái</option>
                                        <option value="ASC">Xác nhận</option>
                                        <option value="DESC">Đã xác nhận</option>
                                    </select>
                                    <button type="submit" class="btn btn-outline-secondary">
                                        Lọc
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Bảng đơn hàng</h6>
                            </div>
                            <div class="card-body">
                                <form action="orderDetailManagement" method="get">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn</th>
                                                    <th>Email</th>
                                                    <th>Tên</th>
                                                    <th>SĐT</th>                                                                                  
                                                    <th>Trạng thái</th>
                                                    <th>Xem chi tiết</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <td>
                                                            #${order.orderId}
                                                        </td>
                                                        <td>${order.email}</td>
                                                        <td>${order.name}</td>
                                                        <td>${order.phone}</td>
                                                        <td style="color: red; ">
                                                            
                                                            <c:if test="${order.status == 1}">
                                                                 <a class="btn btn-outline-success" href="orderDetailManager?orderId=${order.orderId}">Xác nhận</a>
                                                            </c:if>
                                                            <c:if test="${order.status > 1}">
                                                                ${order.statusName}
                                                            </c:if>
                                                           
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-outline-info" href="orderDetailManager?orderId=${order.orderId}">Chi tiết</a>
                                                        </td>                                                                                  
                                                    </tr>  
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>                               
                                </form>

                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

    </script>
</body>

</html>
