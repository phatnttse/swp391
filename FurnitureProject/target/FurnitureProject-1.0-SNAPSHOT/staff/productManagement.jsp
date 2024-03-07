<%-- 
    Document   : productManagement
    Created on : Mar 4, 2024, 12:33:48 AM
    Author     : mac
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        /* ... (previous styles) ... */

        .filter-section {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

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


        /* ... (remaining styles) ... */
    </style>

    <title>Product Page</title>
</head>
<body>

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
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="productManagement">
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

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#">                     
                    <span>Pages</span>
                </a>                 
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
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
                                <a class="dropdown-item" href="#">
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
                                                    <td><img height="100px" width="100px" src="${product.thumbnail}" alt="Thumbnail" class="img-thumbnail rounded" /></td>

                                                    <td>
                                                        <div class="btn-group">
                                                            <!--ADD Button-->
                                                            <a href="addProductPage" class="btn btn-outline-success">ADD</a>

                                                            <!-- Detail Button -->
                                                            <a href="productdetailmanagement?productId=${product.productId}" class="btn btn-outline-info">Detail</a>

                                                            <!-- Delete Button -->
                                                            <a href="DeleteProductsController?productId=${product.productId}" class="btn btn-outline-danger">Xóa</a>                                                         
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

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
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
    </script>

</body>
</body>
</html>
