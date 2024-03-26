<%-- 
    Document   : categoryManagement
    Created on : Mar 13, 2024, 11:28:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <title>Quản lý danh mục</title>

    <style>
        /* Your existing CSS ... */

        /* Additional styles for the dropdown */
        #sort-by ul {
            width: 100%;
            text-align: left;
            position: absolute;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        #sort-by ul li {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #sort-by ul li:hover {
            background-color: #f4f4f4;
        }

        /* Additional styles from sortPagiBar */
        #sort-by label {
            display: inline-block;
            margin-bottom: 0;
            font-size: 14px;
        }

        #sort-by .ul_col {
            position: relative;
            margin-left: 15px;
            background: #fff;
            width: 145px;
            height: 30px;
            display: inline-flex;
            align-items: center;
            padding: 0 10px;
            font-size: 14px;
            border: 1px solid #E5E5E5;
            border-radius: 5px;
            cursor: pointer;
            background-image: url(//bizweb.dktcdn.net/100/499/932/themes/926650/assets/arrow_down.svg?1705830293643);
            background-repeat: no-repeat;
            background-position: right 10px center;
            list-style: none;
            margin-bottom: 0;
        }

        #sort-by .ul_col .content_ul {
            position: absolute;
            top: 100%;
            left: 0;
            background: #fff;
            width: 100%;
            z-index: 99;
            border: 1px solid #E5E5E5;
            border-radius: 5px;
            padding: 10px;
            list-style: none;
            display: none;
        }

        #sort-by .ul_col .content_ul ul li {
            display: block;
        }

        #sort-by .ul_col:hover .content_ul {
            display: block;

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

                    <c:set var="categorys" value="${requestScope.CATEGORIES}"/>

<!--                    <h1 class="h3 my-4 mb-4 text-gray-800">Danh Mục</h1>-->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4 my-5">
                        <div class="card-header py-3">
                            <div class="row">
                                <div class="col">
                                    <h6 class="m-0 font-weight-bold text-primary">Bảng Danh Mục</h6>
                                </div>

                                <c:if test="${not empty requestScope.DELETE_SUCCESS}">
                                    <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                                        <!-- Nội dung của alert sẽ được thay đổi bằng JavaScript -->
                                        ${requestScope.DELETE_SUCCESS}
                                        <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </c:if>
                                
                                <c:set var="span" value="${requestScope.SPAN}"/>
                                <!-- Add Sort Dropdown -->
                                <div class="col-md-6 text-right right">
                                    <div id="sort-by">
                                        <label class="left">Sắp xếp theo</label>
                                        <ul class="ul_col">
                                            <li>
                                                <span>
                                                   <c:if test="${span != null}">
                                                        ${span}
                                                    </c:if>
                                                    <c:if test="${span == null}">
                                                        Mặc định
                                                    </c:if>
                                                </span>
                                                <ul class="content_ul">
                                                    <li><a href="filterCategories?typeSort=default">Mặc định</a></li>
                                                    <li><a href="filterCategories?typeSort=AtoZ">A → Z</a></li>
                                                    <li><a href="filterCategories?typeSort=ZtoA">Z → A</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Sort Dropdown -->
                            </div>
                        </div>
                        <div class="card-body">
                            <a href="addCategoryPage" class="btn btn-outline-success" style="margin-left: 94%">Thêm</a>
                            <form action="categoryManager" method="get" style="margin-top: 7px">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã sản phẩm</th>
                                                <th>Loại</th>
                                                <th>Hình ảnh</th>
                                                <th>Thao tác</th>      
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="category" items="${categorys}">
                                                <tr>
                                                    <td>#${category.categoryId}</td>
                                                    <td>${category.name}</td>
                                                    <td><img height="100px" width="100px" src="/FurnitureProject/thumbnails/categories/${category.thumbnail}" alt="Thumbnail" class="img-thumbnail rounded" /></td>
                                                    <td>
                                                        <div class="btn-group">

                                                            <a href="categoryDetailManager?categoryId=${category.categoryId}" class="btn btn-outline-info">Sửa</a>

                                                            <a href="updateDeleteCategory?categoryId=${category.categoryId}" class="btn btn-outline-danger" style="margin-left: 5px; margin-right: -30px">Xóa</a>                                                         
                                                        </div>                                                                                  
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
    <script src="/FurnitureProject/assets/js/alert.js"></script>


</body>
</html>