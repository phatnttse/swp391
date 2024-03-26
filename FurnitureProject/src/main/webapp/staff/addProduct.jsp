<%-- 
    Document   : Addproduct
    Created on : Mar 5, 2024, 1:58:20 AM
    Author     : mac
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <title>Thêm sản phẩm</title>

        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>
    <body>

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

                        <h1 class="h3 my-4 mb-4 text-gray-800">Thêm Sản Phẩm Mới</h1>

                        <c:if test="${not empty requestScope.ADD_PRODUCT_SUCCESS}">
                            <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                                <!-- Nội dung của alert sẽ được thay đổi bằng JavaScript -->
                                ${requestScope.ADD_PRODUCT_SUCCESS}
                                <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>

                        <c:set var="categories" value="${requestScope.CATEGORIES}"/>
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <form action="addNewProduct" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="category">Loại danh mục:</label>
                                        <select class="form-control" id="categoryId" name="categoryId">
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.categoryId}">${category.name}</option>
                                            </c:forEach>
                                        </select>                                                                             
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Tên sản phẩm:</label>
                                        <input type="text" class="form-control" id="title" name="title" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Giá:</label>
                                        <input type="text" class="form-control" id="price" name="price" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="quantity">Số lượng:</label>
                                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="discount">Giảm Giá:</label>
                                        <input type="number" class="form-control" id="discount" name="discount" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="thumbnail">Upload thumbnail:</label>
                                        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Mô tả:</label>
                                        <textarea class="form-control" id="description" name="description" rows="6" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
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

        <script src="/FurnitureProject/assets/js/alert.js"></script>

    </body>
</body>
</html>