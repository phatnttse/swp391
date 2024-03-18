<%-- 
    Document   : categoryDetailManager
    Created on : Mar 15, 2024, 1:31:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết danh mục</title>
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
                        <c:set var="category" value="${requestScope.CATEGORY_DETAIL}" />
                        <!-- Content Row -->

                        <h1 class="h3 my-5 mb-4 text-gray-800">Danh Mục</h1>

                        <c:if test="${not empty requestScope.UPDATE_SUCCESS}">
                            <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                                <!-- Nội dung của alert sẽ được thay đổi bằng JavaScript -->
                                ${requestScope.UPDATE_SUCCESS}
                                <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>

                        <form action="updateDeleteCategory" method="post" enctype="multipart/form-data" style="margin-top: 7px">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bảng Danh Mục Chi Tiết</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã sản phẩm</th>
                                                    <th>Loại</th>
                                                    <th>Thumbnail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" name="categoryId" value="${category.categoryId}" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="name" value="${category.name}">
                                                    </td>
                                                    <td>
                                                        <img height="100px" width="100px" src="/FurnitureProject/thumbnails/categories/${category.thumbnail}" alt="Thumbnail" class="img-thumbnail rounded"
                                                             style="margin-bottom: 10px"/>
                                                        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" accept="image/*">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="btn-group">
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
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
        
        <script src="/FurnitureProject/assets/js/alert.js"></script>


    </body>
</html>
