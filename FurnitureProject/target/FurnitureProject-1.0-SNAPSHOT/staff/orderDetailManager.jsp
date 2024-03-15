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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">      
        <title>Chi tiết đơn hàng</title>
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
                        <form action="orderDetailManager" method="post">
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
                                                <label class="input-group-text font-weight-bold" for="paymentStatusSelect">Trạng thái thanh toán</label>
                                                <select class="form-select" id="paymentStatusSelect" name="paymentStatus">
                                                    <option value="true" ${order.paymentStatus ? 'selected' : ''}>Đã thanh toán</option>
                                                    <option value="false" ${!order.paymentStatus ? 'selected' : ''}>Chưa thanh toán</option>
                                                </select>
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
                                            <a href="orderManager" class="btn btn-facebook btn-block"><i
                                                    class="" ></i>Quay Lại</a>

                                        </div>
                                    </div>


                                </div>

                            </div>
                        </form>



                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->


        <script>

            function toggleSubMenu(menuId) {
                var subMenu = document.getElementById(menuId);
                var arrowIcon = document.getElementById('arrow-icon-' + menuId);
                if (subMenu.style.display === 'none') {
                    subMenu.style.display = 'block';
                    arrowIcon.classList.remove('fa-chevron-right');
                    arrowIcon.classList.add('fa-chevron-down');
                } else {
                    subMenu.style.display = 'none';
                    arrowIcon.classList.remove('fa-chevron-down');
                    arrowIcon.classList.add('fa-chevron-right');
                }
            }
            
        </script> 
    </body>
</html>
