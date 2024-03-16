<%-- 
    Document   : customer
    Created on : Dec 14, 2023, 9:58:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" type="text/css" href="/FurnitureProject/assets/css/collectionall.css">
        <link rel="stylesheet" type="text/css" href="/FurnitureProject/assets/css/popupProduct.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
        <title>Sản phẩm</title>
        <style>
            .custom-filter-button {
                color: #fff;
                background-color: #d94e28;
                border-color: #d94e28;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
                    border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .custom-filter-button:hover {
                background-color: #138496;
                border-color: #117a8b;
            }

            .custom-filter-button:focus {
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
            }

            .custom-filter-button:disabled {
                background-color: #6c757d;
                border-color: #6c757d;
            }

        </style>

    </head>
    <body>
        <c:set var="listProductByCategory" value="${requestScope.CATEGORY_LIST}"/>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <div class="backdrop__body-backdrop___1rvky"></div>
        <div class="layout-collection">
            <div class="container">
                <div class="row">
                    <aside class="dqdt-sidebar sidebar col-lg-3 col-12 padding-10">
                        <div class="aside-content aside-content-menu">
                            <div class="title-head">
                                Danh mục sản phẩm
                            </div>
                            <nav class="nav-category">
                                <ul class="nav navbar-pills">
                                    <c:if test="${not empty listProductByCategory}">
                                        <c:forEach var="category" items="${listProductByCategory}">
                                            <li class="nav-item  relative">
                                                <a class="nav-link pr-5"  href="/FurnitureProject/product-category?categoryId=${category.categoryId}" title="Đèn chùm">${category.name}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>

                        <div class="aside-filter clearfix">
                            <div class="aside-hidden-mobile">
                                <div class="filter-container">

                                    <div class="clearfix"></div>

                                    <aside class="aside-item filter-price">
                                        <div class="aside-title">Chọn mức giá 
                                            <span class="nd-svg collapsible-plus">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="aside-content filter-group">
                                            <form action="LoadProductByPriceController" method="get" id="myForm">
                                                <ul>

                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-duoi-500-000d">
                                                                <input type="checkbox" id="filter-duoi-500-000d"   name="price" value="${0}" >
                                                                <i class="fa"></i>
                                                                Giá dưới 500.000đ
                                                            </label>
                                                        </span>
                                                    </li>


                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-500-000d-1-000-000d">
                                                                <input type="checkbox" id="filter-500-000d-1-000-000d"   name="price" value="${1}">
                                                                <i class="fa"></i>
                                                                500.000đ - 1.000.000đ							
                                                            </label>
                                                        </span>
                                                    </li>	

                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-1-000-000d-3-000-000d">
                                                                <input type="checkbox" id="filter-1-000-000d-3-000-000d"  name="price" value="${2}" >
                                                                <i class="fa"></i>
                                                                1.000.000đ - 3.000.000đ							
                                                            </label>
                                                        </span>
                                                    </li>	

                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-3-000-000d-5-000-000d">
                                                                <input type="checkbox" id="filter-3-000-000d-5-000-000d"   name="price" value="${3}" >
                                                                <i class="fa"></i>
                                                                3.000.000đ - 5.000.000đ							
                                                            </label>
                                                        </span>
                                                    </li>	

                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-5-000-000d-7-000-000d">
                                                                <input type="checkbox" id="filter-5-000-000d-7-000-000d"  name="price" value="${4}">
                                                                <i class="fa"></i>
                                                                5.000.000đ - 7.000.000đ							
                                                            </label>
                                                        </span>
                                                    </li>	
                                                    <li class="filter-item filter-item--check-box filter-item--green">
                                                        <span>
                                                            <label for="filter-tren7-000-000d">
                                                                <input type="checkbox" id="filter-tren7-000-000d" name="price" value="${5}">
                                                                <i class="fa"></i>
                                                                Giá trên 7.000.000đ
                                                            </label>
                                                        </span>
                                                    </li>
                                                </ul>
                                                <button type="submit" class="btn custom-filter-button">Lọc</button>
                                            </form>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </div>
                    </aside>

                    <div class="block-collection col-lg-9 col-12">
                        <div class="collection-title">
                            <h1 class="title-page">Tất cả sản phẩm</h1>

                            <div class="sortPagiBar clearfix">
                                <div class="sort-cate clearfix">
                                    <div id="sort-by">
                                        <label class="left">Sắp xếp theo</label>
                                        <ul class="ul_col">
                                            <li>
                                                <span>
                                                    Mặc định 
                                                </span>
                                                <ul class="content_ul">                    
                                                    <li><a href="SortProductController?sortType=default" >Mặc định</a></li>								
                                                    <li><a href="SortProductController?sortType=AtoZ" >A → Z</a></li>
                                                    <li><a href="SortProductController?sortType=ZtoA" >Z → A</a></li>
                                                    <li><a href="SortProductController?sortType=IncreasePrice" >Giá tăng dần</a></li>
                                                    <li><a href="SortProductController?sortType=DecreasePrice" >Giá giảm dần</a></li>
                                                    <li><a href="SortProductController?sortType=Newest" >Hàng mới nhất</a></li>
                                                    <li><a href="SortProductController?sortType=Oldest" >Hàng cũ nhất</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="productPagination" class="category-products">

                            <div class="products-view products-view-grid list_hover_pro">
                                <div class="row">
                                    <c:set var="listProduct" value="${requestScope.PRODUCTS_LIST}"/>
                                    <c:if test="${not empty listProduct}">
                                        <c:forEach var="product" items="${listProduct}">                                    
                                            <div  class="col-6 col-xl-4 col-lg-4 col-md-4">
                                                <div class="item_product_main">
                                                    <form action="" method="post" class="variants product-action " enctype="multipart/form-data">
                                                        <div class="product-thumbnail">
                                                            <a class="image_thumb" href="LoadProductDetailController?productId=${product.productId}" title="${product.title}">
                                                                <img class="lazyload" width="480" height="480" src="thumbnails/products/${product.thumbnail}" alt="${product.title}">
                                                            </a>
                                                            <span class="smart">-
                                                                ${product.discount}% 
                                                            </span>
                                                            <a href="" class="btn-compare js-btn-wishlist setWishlist btn-views"  title="Thêm vào yêu thích">
                                                                <svg width="24" height="24"><path d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"></path></svg>
                                                            </a>

                                                            <div class="action">
                                                                <div class="actions-secondary">
                                                                    <div class="actions-primary">

                                                                        <button type="button" onclick="addProductToCart(${product.productId}, '${product.title}', '${product.thumbnail}', ${product.discountProduct}, 1)" class="btn-cart add_to_cart " title="Thêm vào giỏ hàng">
                                                                            <span class="icon icon-cart">
                                                                                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{
                                                                                        fill:none;
                                                                                        stroke:#000;
                                                                                        stroke-linecap:round;
                                                                                        stroke-linejoin:round;
                                                                                        stroke-width:2px;
                                                                                    }</style></defs><title></title><g><polyline class="cls-1" points="15 31 5 31 6 9 26 9 26.14 12"></polyline><path class="cls-1" d="M11,12V6a5,5,0,0,1,5-5h0a5,5,0,0,1,5,5v6"></path><circle class="cls-1" cx="23" cy="23" r="8"></circle><line class="cls-1" x1="23" x2="23" y1="19" y2="27"></line><line class="cls-1" x1="27" x2="19" y1="23" y2="23"></line></g></svg>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <button type="button" title="Xem nhanh" onclick="viewFastProduct(${product.productId})" class="quick-view btn-views">
                                                                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"></path></svg>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name"><a href="" title="${product.title}">${product.title}</a></h3>
                                                            <div class="price-box">
                                                                <script>
                                                                    var totalMoney = parseInt('${product.discountProduct}');
                                                                    var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                    document.write(formattedTotalMoney);
                                                                </script>
                                                                <span class="compare-price">${product.formattedPrice}₫</span>
                                                            </div>
                                                        </div>
                                                    </form>	
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>		                            			
                                </div>
                            </div>

                            <c:set var="page" value="${requestScope.PAGE}"/>
                            <c:set var="uri" value="${pageContext.request.requestURI}" />
                            
                            <c:if test="${param['sortType'] == null && param['price'] == null}">
                                 <div class="pagenav">
                                    <nav class="clearfix relative nav_pagi w_100 ">
                                        <ul class="pagination clearfix">
                                            <c:if test="${page == 1}">
                                                <li class="page-item disabled"><a class="page-link" href="#">
                                                        <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-left fa-w-6"><path fill="currentColor" d="M4.2 247.5L151 99.5c4.7-4.7 12.3-4.7 17 0l19.8 19.8c4.7 4.7 4.7 12.3 0 17L69.3 256l118.5 119.7c4.7 4.7 4.7 12.3 0 17L168 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 264.5c-4.7-4.7-4.7-12.3 0-17z" class=""></path></svg>
                                                    </a></li> 
                                                </c:if>
                                                <c:if test="${page > 1}">
                                                <li class="page-item"><a href="productPagination?page=${page - 1}" class="page-link" href="#">
                                                        <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-left fa-w-6"><path fill="currentColor" d="M4.2 247.5L151 99.5c4.7-4.7 12.3-4.7 17 0l19.8 19.8c4.7 4.7 4.7 12.3 0 17L69.3 256l118.5 119.7c4.7 4.7 4.7 12.3 0 17L168 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 264.5c-4.7-4.7-4.7-12.3 0-17z" class=""></path></svg>
                                                    </a></li> 
                                                </c:if>


                                            <c:forEach begin="1" end="${requestScope.TOTAL_PAGES}" var="pageNumber">
                                                <c:set var="numberPage" value="${pageNumber}" />
                                                <c:choose>
                                                    <c:when test="${pageNumber == page}">
                                                        <li class="page-item active">
                                                            <a class="page-link" href="productPagination?page=${pageNumber}">${pageNumber}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a class="page-link" href="productPagination?page=${pageNumber}">${pageNumber}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <li class="page-item hidden-xs"><a href="productPagination?page=${page + 1}"class="page-link">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-right fa-w-6"><path fill="currentColor" d="M187.8 264.5L41 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 392.7c-4.7-4.7-4.7-12.3 0-17L122.7 256 4.2 136.3c-4.7-4.7-4.7-12.3 0-17L24 99.5c4.7-4.7 12.3-4.7 17 0l146.8 148c4.7 4.7 4.7 12.3 0 17z" class=""></path></svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </c:if>

                            <c:if test="${param['sortType'] != null}">
                                <div class="pagenav">
                                    <nav class="clearfix relative nav_pagi w_100 ">
                                        <ul class="pagination clearfix">
                                            <c:if test="${page == 1}">
                                                <li id="prevPage" class="page-item disabled"><a class="page-link" href="#">
                                                        <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-left fa-w-6"><path fill="currentColor" d="M4.2 247.5L151 99.5c4.7-4.7 12.3-4.7 17 0l19.8 19.8c4.7 4.7 4.7 12.3 0 17L69.3 256l118.5 119.7c4.7 4.7 4.7 12.3 0 17L168 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 264.5c-4.7-4.7-4.7-12.3 0-17z" class=""></path></svg>
                                                    </a></li> 
                                                </c:if>
                                                <c:if test="${page > 1}">
                                                <li class="page-item"><a href="productPagination?page=${page - 1}&sortType=${param['sortType']}" class="page-link" href="#">
                                                        <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-left fa-w-6"><path fill="currentColor" d="M4.2 247.5L151 99.5c4.7-4.7 12.3-4.7 17 0l19.8 19.8c4.7 4.7 4.7 12.3 0 17L69.3 256l118.5 119.7c4.7 4.7 4.7 12.3 0 17L168 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 264.5c-4.7-4.7-4.7-12.3 0-17z" class=""></path></svg>
                                                    </a></li> 
                                                </c:if>


                                            <c:forEach begin="1" end="${requestScope.TOTAL_PAGES}" var="pageNumber">
                                                <c:set var="numberPage" value="${pageNumber}" />
                                                <c:choose>
                                                    <c:when test="${pageNumber == page}">
                                                        <li class="page-item active">
                                                            <a class="page-link" href="productPagination?page=${pageNumber}&sortType=sortType=${param['sortType']}">${pageNumber}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a class="page-link" href="productPagination?page=${pageNumber}&sortType=${param['sortType']}">${pageNumber}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <li class="page-item hidden-xs"><a href="productPagination?page=${page + 1}&sortType=${param['sortType']}"class="page-link">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-right fa-w-6"><path fill="currentColor" d="M187.8 264.5L41 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 392.7c-4.7-4.7-4.7-12.3 0-17L122.7 256 4.2 136.3c-4.7-4.7-4.7-12.3 0-17L24 99.5c4.7-4.7 12.3-4.7 17 0l146.8 148c4.7 4.7 4.7 12.3 0 17z" class=""></path></svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
                <div id="open-filters" class="open-filters d-lg-none d-xl-none">
                    <i class="fa fa-filter"></i>
                    <span>Lọc</span>
                </div>
            </div>
        </div>
    <df-messenger
        intent="WELCOME"
        chat-title="Lofi_Furniture_Support"
        agent-id="cf3b1e72-2c0d-43b8-b9d4-e26ce22ec3bd"
        language-code="en">            
    </df-messenger>

    <div id="popup-cart-desktop" class="popup-cart"></div>
    <div id="quick-view-product" class="quickview-product" style="display: none;"></div>

    <script src="assets/js/ajaxfunctions.js"></script>



    <%@include file="../UIcomponents/footer.jsp" %>
</body>
</html>
