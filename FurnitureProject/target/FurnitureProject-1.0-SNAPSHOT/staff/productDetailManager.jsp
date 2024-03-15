<%-- 
    Document   : productManagement
    Created on : Mar 4, 2024, 12:33:48 AM
    Author     : mac
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>

        <title>product Page</title>
        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>

    <body>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="../UIcomponents/sidebar.jsp"%>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="../UIcomponents/topbar.jsp"%>


                    <!-- Begin Page Content -->

                    <!-- Main Content -->
                    <div class="container-fluid">

                        <c:set var="product" value="${requestScope.PRODUCT_DETAIL}"/>

                        <h1 class="h3 my-5 mb-4 text-gray-800">Chi Tiết Sản Phẩm</h1>


                        <c:if test="${not empty requestScope.UPDATE_SUCCESS}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>${requestScope.UPDATE_SUCCESS}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>

                        <form action="actionWithProducts" method="post" enctype="multipart/form-data">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Sản Phẩm</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã sản phẩm</th>
                                                    <th>Mã Loại</th>
                                                    <th>Tên</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" name="productId" value="${product.productId}" readonly="">
                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="categoryId"  value="${product.categoryId}">
                                                        <input type="text" class="form-control" value="${product.categoryName}">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="title" value="${product.title}">
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Giá</th>
                                                    <th>Số Lượng</th>
                                                    <th>Giảm giá</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" name="price" value="${product.price}">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="quantity" value="${product.quantity}">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="discount" value="${product.discount}">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Hình ảnh</th>
                                                    <th>Lượt Mua</th>
                                                    <th>Ngày Tạo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <img src="thumbnails/products/${product.thumbnail}" alt="Thumbnail" style="max-width: 100px; max-height: 100px; margin-bottom: 10px"
                                                             class="rounded">
                                                        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" accept="image/*">
                                                        

                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="purchases" value="${product.purchases}" readonly="">
                                                    </td>
                                                    <td>
                                                        <input type="text"class="form-control" name="createdAt" value="${product.createdAt}">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mô tả</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <td>
                                                <textarea class="form-control" rows="6" name="description">${product.description}</textarea>
                                            </td>
                                            </tbody>
                                        </table>
                                        <div class="btn-group">
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

    </body>
</html>