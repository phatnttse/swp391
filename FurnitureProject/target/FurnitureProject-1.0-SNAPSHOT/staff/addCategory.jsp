<%-- 
    Document   : addCategory
    Created on : Mar 15, 2024, 2:58:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Danh Mục</title>
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

                        <h1 class="h3 my-5 mb-4 text-gray-800">Thêm Danh Mục</h1>

                        <c:if test="${not empty requestScope.ADD_CATEGORY_SUCCESS}">
                            <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                                <!-- Nội dung của alert sẽ được thay đổi bằng JavaScript -->
                                ${requestScope.ADD_CATEGORY_SUCCESS}
                                <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>

                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <form action="addNewCategory" method="post" enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label for="title">Tên danh mục:</label>
                                        <input type="text" class="form-control" id="name" name="name" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="thumbnail">Upload thumbnail:</label>
                                        <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" accept="image/*" required>
                                    </div>

                                    <button  type="submit" class="btn btn-primary">Thêm Danh Mục</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /.container-fluid -->
                <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->


        <script src="/FurnitureProject/assets/js/alert.js"></script>


    </body>
</html>
