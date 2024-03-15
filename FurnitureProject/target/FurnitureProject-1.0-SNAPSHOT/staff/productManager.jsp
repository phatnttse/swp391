<%-- 
    Document   : productManagement
    Created on : Mar 4, 2024, 12:33:48 AM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
    <style>
        .filter-section {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        ưw
        .filter-label {
            margin-right: 10px;
        }

        .filter-select {
            margin-right: 10px;
            padding: 8px;
            border-radius: 5px;
        }

        .filter-btn {
            margin-left: 10px;
        }
        a {
            cursor: pointer;
        }


    </style>

    <title>Product Page</title>
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

                    <c:set var="products" value="${requestScope.PRODUCTS}"/>

                    <h1 class="h3 my-5 mb-4 text-gray-800">Quản lý Sản Phẩm</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div class="row">
                                <div class="col">
                                    <h6 class="m-0 font-weight-bold text-primary">Bảng Sản Phẩm</h6>
                                </div>
                                <div class="col">

                                    <form action="productManagement" method="get" class="form-inline float-right mt-3">
                                        <div class="form-group mx-2">
                                            <label for="combinedFilter" class="mr-2">Chọn:</label>
                                            <select class="form-control filter-select" id="combinedFilter" name="combinedFilter">
                                                <option value="productId">Mã Sản Phẩm</option>
                                                <option value="price">Giá</option>
                                                <option value="category">Loại</option>
                                            </select>
                                        </div>

                                        <div id="filterOptions" class="form-group mx-2">
                                            <!-- Options for Mã Sản Phẩm -->
                                            <select class="form-control filter-select" id="productIdFilter" name="productIdFilter">
                                                <option value="asc">Tăng Dần</option>
                                                <option value="desc">Giảm Dần</option>
                                            </select>

                                            <!-- Options for Giá -->
                                            <select class="form-control filter-select" id="priceFilter" name="priceFilter">
                                                <option value="asc">Tăng Dần</option>
                                                <option value="desc">Giảm Dần</option>
                                            </select>

                                            <!-- Options for Loại -->
                                            <select class="form-control filter-select" id="categoryFilter" name="categoryFilter">
                                                <option value="Bồn tắm">Bồn tắm</option>
                                                <option value="Bồn cầu">Bồn cầu</option>
                                                <option value="Sen tắm">Sen tắm</option>
                                                <option value="Tủ chậu Lavabo">Tủ chậu Lavabo</option>
                                                <option value="Vòi Lavabo">Vòi Lavabo</option>
                                                <option value="Phụ kiện">Phụ kiện</option>
                                                <!-- Add other categories as needed -->
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary mb-2">Lọc</button>

                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="productManagement" method="get">
                                <div class="table-responsive">
                                    <p style="color: red">${requestScope.DELETE_SUCCESS}</p>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                        <a href="addProductPage" class="btn btn-outline-success" style="margin-left: 93%; margin-bottom: 10px; margin-top: -16px">Thêm</a>
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Loại</th>
                                            <th>Tên</th>
                                            <th>Giá</th>
                                            <th>Thumbnail</th>                                                
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td>#${product.productId}</td>
                                                    <td>${product.categoryName}</td>
                                                    <td>${product.title}</td>
                                                    <td>${product.formattedPrice}đ</td>                                          
                                                    <td><img height="100px" width="100px" src="thumbnails/products/${product.thumbnail}" alt="Thumbnail" class="img-thumbnail rounded" /></td>


                                                    <td>
                                                        <div class="btn-group">

                                                            <!-- Detail Button -->
                                                            <a href="productDetailManager?productId=${product.productId}" class="btn btn-outline-info">Chi Tiết</a>


                                                            <!-- Delete Button -->
                                                            <a href="actionWithProducts?productId=${product.productId}" class="btn btn-outline-danger" style="margin-left: 5px">Xóa</a>                                                         
                                                        </div>
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
    <script type="text/javascript">
        $(document).ready(function () {
            // Initially hide all filter options
            $("#filterOptions select").hide();

            // Show filter options based on selected filter type
            $("#combinedFilter").change(function () {
                // Hide all options
                $("#filterOptions select").hide();

                // Show options for the selected filter
                var selectedFilter = $(this).val();
                $("#" + selectedFilter + "Filter").show();
            });
        });

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