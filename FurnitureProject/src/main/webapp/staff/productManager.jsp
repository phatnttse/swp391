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


                                <c:if test="${not empty requestScope.DELETE_SUCCESS}">
                                    <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                                        <!-- Nội dung của alert sẽ được thay đổi bằng JavaScript -->
                                        ${requestScope.DELETE_SUCCESS}
                                        <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </c:if>



                                <div class="col-md-6 text-right right">
                                    <div id="sort-by">
                                        <label class="left">Sắp xếp theo</label>
                                        <ul class="ul_col">
                                            <li>
                                                <span>
                                                    Mặc định
                                                </span>
                                                <ul class="content_ul">
                                                    <li><a href="productManager?typeSort=default">Mặc định</a></li>
                                                    <li><a href="productManager?typeSort=AtoZ">A → Z</a></li>
                                                    <li><a href="productManager?typeSort=ZtoA">Z → A</a></li>
                                                    <li><a href="productManager?typeSort=IncreasePrice">Giá tăng dần</a></li>
                                                    <li><a href="productManager?typeSort=DecreasePrice">Giá giảm dần</a></li>
                                                    <li><a href="productManager?typeSort=Newest">Hàng mới nhất</a></li>
                                                    <li><a href="productManager?typeSort=Oldest">Hàng cũ nhất</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Sort Dropdown -->
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
                                                    <td><img height="100px" width="100px" src="/FurnitureProject/thumbnails/products/${product.thumbnail}" alt="Thumbnail" class="img-thumbnail rounded" /></td>


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

                    <c:set var="page" value="${requestScope.PAGE}"/>
                    <c:if test="${param['typeSort'] != null}">
                        <ul class="pagination justify-content-center my-3">
                            <li class="page-item"><a class="page-link" href="productManager?page=${page - 1}&typeSort=${param['typeSort']}">Previous</a></li>

                            <c:forEach begin="1" end="${requestScope.TOTAL_PAGES}" var="pageNumber">

                                <li class="page-item"><a class="page-link" href="productManager?page=${pageNumber}&typeSort=${param['typeSort']}">${pageNumber}</a></li>

                            </c:forEach>

                            <li class="page-item"><a class="page-link" href="productManager?page=${page + 1}&typeSort=${param['typeSort']}">Next</a></li>

                        </ul>
                    </c:if>
                    <c:if test="${param['sortType'] == null}">
                        <ul class="pagination justify-content-center my-3">
                            <li class="page-item"><a class="page-link" href="productManager?page=${page - 1}">Previous</a></li>
                                <c:forEach begin="1" end="${requestScope.TOTAL_PAGES}" var="pageNumber">

                                <li class="page-item"><a class="page-link" href="productManager?page=${pageNumber}">${pageNumber}</a></li>

                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="productManager?page=${page + 1}">Next</a></li>

                        </ul>

                    </c:if>




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