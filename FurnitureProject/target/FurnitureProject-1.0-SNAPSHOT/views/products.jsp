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
        <link rel="stylesheet" type="text/css" href="/FurnitureProject/assets/css/collection.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <title>Sản phẩm</title>
        <style>
            .backdrop__body-backdrop___1rvky {
                position: fixed;
                opacity: 0;
                width: 100%;
                left: 0;
                top: 0 !important;
                right: 0;
                bottom: 0;
                background-color: #363636;
                z-index: 9;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out
            }

            @media (max-width: 991px) {
                .backdrop__body-backdrop___1rvky {
                    z-index:9
                }
            }

            .backdrop__body-backdrop___1rvky.active {
                visibility: visible;
                opacity: 0.5
            }
        </style>
    </head>
    <body>
        <c:set var="listProductByCategory" value="${requestScope.CATEGORY_LIST}"/>

        <div class="backdrop__body-backdrop___1rvky"></div>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
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

                                    <div class="filter-containers">	
                                        <div class="filter-container__selected-filter" style="display: none;">
                                            <div class="filter-container__selected-filter-header clearfix">
                                                <span class="filter-container__selected-filter-header-title">Bạn chọn</span>
                                                <a href="" class="filter-container__clear-all" title="Bỏ hết">Bỏ hết</a>
                                            </div>
                                            <div class="filter-container__selected-filter-list clearfix">
                                                <ul>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
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
                                            <ul>

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-duoi-500-000d">
                                                            <input type="checkbox" id="filter-duoi-500-000d"  data-group="Khoảng giá" data-field="price_min" data-text="Dưới 500.000đ" value="(<500000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            Giá dưới 500.000đ
                                                        </label>
                                                    </span>
                                                </li>


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-500-000d-1-000-000d">
                                                            <input type="checkbox" id="filter-500-000d-1-000-000d"  data-group="Khoảng giá" data-field="price_min" data-text="500.000đ - 1.000.000đ" value="(>500000 AND <1000000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            500.000đ - 1.000.000đ							
                                                        </label>
                                                    </span>
                                                </li>	


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-1-000-000d-3-000-000d">
                                                            <input type="checkbox" id="filter-1-000-000d-3-000-000d"  data-group="Khoảng giá" data-field="price_min" data-text="1.000.000đ - 3.000.000đ" value="(>1000000 AND <3000000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            1.000.000đ - 3.000.000đ							
                                                        </label>
                                                    </span>
                                                </li>	

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-3-000-000d-5-000-000d">
                                                            <input type="checkbox" id="filter-3-000-000d-5-000-000d"  data-group="Khoảng giá" data-field="price_min" data-text="3.000.000đ - 5.000.000đ" value="(>3000000 AND <5000000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            3.000.000đ - 5.000.000đ							
                                                        </label>
                                                    </span>
                                                </li>	

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-5-000-000d-7-000-000d">
                                                            <input type="checkbox" id="filter-5-000-000d-7-000-000d"  data-group="Khoảng giá" data-field="price_min" data-text="5.000.000đ - 7.000.000đ" value="(>5000000 AND <7000000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            5.000.000đ - 7.000.000đ							
                                                        </label>
                                                    </span>
                                                </li>	
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-tren7-000-000d">
                                                            <input type="checkbox" id="filter-tren7-000-000d"  data-group="Khoảng giá" data-field="price_min" data-text="Trên 7.000.000đ" value="(>7000000)" data-operator="OR">
                                                            <i class="fa"></i>
                                                            Giá trên 7.000.000đ
                                                        </label>
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </aside>

                                    <aside class="aside-item filter-type">
                                        <div class="aside-title">Loại sản phẩm 
                                            <span class="nd-svg collapsible-plus">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="aside-content filter-group">
                                            <ul class="filter-type">


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <label data-filter="cảm ứng" for="filter-cam-ung">
                                                        <input type="checkbox" id="filter-cam-ung"  data-group="Loại" data-field="product_type.filter_key" data-text="Cảm ứng" value="(&quot;Cảm ứng&quot;)" data-operator="OR">
                                                        <i class="fa"></i>
                                                        Cảm ứng
                                                    </label>
                                                </li>

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <label data-filter="treo tường" for="filter-treo-tuong">
                                                        <input type="checkbox" id="filter-treo-tuong" onchange="toggleFilter(this)" data-group="Loại" data-field="product_type.filter_key" data-text="Treo tường" value="(&quot;Treo tường&quot;)" data-operator="OR">
                                                        <i class="fa"></i>
                                                        Treo tường
                                                    </label>
                                                </li>

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <label data-filter="tự động" for="filter-tu-dong">
                                                        <input type="checkbox" id="filter-tu-dong"  data-group="Loại" data-field="product_type.filter_key" data-text="Tự động" value="(&quot;Tự động&quot;)" data-operator="OR">
                                                        <i class="fa"></i>
                                                        Tự động
                                                    </label>
                                                </li>

                                            </ul>
                                        </div>
                                    </aside>

                                    <aside class="aside-item filter-vendor">
                                        <div class="aside-title">Thương hiệu 
                                            <span class="nd-svg collapsible-plus">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="aside-content filter-group">
                                            <ul class="filter-vendor">

                                                <li class="filter-item filter-item--check-box filter-item--green ">
                                                    <label data-filter="mission" for="filter-mission" class="mission">
                                                        <input type="checkbox" id="filter-mission" data-group="Hãng" data-field="vendor.filter_key" data-text="Mission" value="(&quot;Mission&quot;)" data-operator="OR">
                                                        <i class="fa"></i>
                                                        Mission
                                                    </label>
                                                </li>
                                            </ul>
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
                                                    <li><a href="" onclick="">Mặc định</a></li>								
                                                    <li><a href="" onclick="">A → Z</a></li>
                                                    <li><a href="" onclick="">Z → A</a></li>
                                                    <li><a href="" onclick="">Giá tăng dần</a></li>
                                                    <li><a href="" onclick="">Giá giảm dần</a></li>
                                                    <li><a href="" onclick="">Hàng mới nhất</a></li>
                                                    <li><a href="" onclick="">Hàng cũ nhất</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="category-products">

                            <div class="products-view products-view-grid list_hover_pro">
                                <div class="row">
                                    <c:set var="listProduct" value="${requestScope.PRODUCTS_LIST}"/>
                                    <c:if test="${not empty listProduct}">
                                        <c:forEach var="product" items="${listProduct}">

                                            <div class="col-6 col-xl-4 col-lg-4 col-md-4">
                                                <div class="item_product_main">
                                                    <form action="" method="post" class="variants product-action " enctype="multipart/form-data">
                                                        <div class="product-thumbnail">
                                                            <a class="image_thumb" href="LoadProductDetailController?productId=${product.productId}" title="${product.title}">
                                                                <img class="lazyload" width="480" height="480" src="${product.thumbnail}" alt="${product.title}">
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

                                                                        <button type="button" onclick="addProductToCart(${product.productId}, '${product.title}', '${product.thumbnail}', ${product.price})" class="btn-cart add_to_cart " title="Thêm vào giỏ hàng">
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
                                                                    <a title="Xem nhanh" href="" class="quick-view btn-views">
                                                                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"></path></svg>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name"><a href="" title="${product.title}">${product.title}</a></h3>
                                                            <div class="price-box">
                                                                <span class="price">${product.formattedPrice}₫</span>
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

                            <div class="pagenav">
                                <nav class="clearfix relative nav_pagi w_100 ">
                                    <ul class="pagination clearfix">
                                        <li class="page-item disabled"><a class="page-link" href="#">
                                                <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-left fa-w-6"><path fill="currentColor" d="M4.2 247.5L151 99.5c4.7-4.7 12.3-4.7 17 0l19.8 19.8c4.7 4.7 4.7 12.3 0 17L69.3 256l118.5 119.7c4.7 4.7 4.7 12.3 0 17L168 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 264.5c-4.7-4.7-4.7-12.3 0-17z" class=""></path></svg>
                                            </a></li>
                                        <li class="active page-item disabled"><a class="page-link" href="">1</a></li>

                                        <li class="page-item"><a class="page-link" onclick="" href="">2</a></li>

                                        <li class="page-item"><a class="page-link" onclick="" href="">3</a></li>

                                        <li class="page-item hidden-xs"><a class="page-link" onclick=" href ="">
                                                <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" class="svg-inline--fa fa-angle-right fa-w-6"><path fill="currentColor" d="M187.8 264.5L41 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 392.7c-4.7-4.7-4.7-12.3 0-17L122.7 256 4.2 136.3c-4.7-4.7-4.7-12.3 0-17L24 99.5c4.7-4.7 12.3-4.7 17 0l146.8 148c4.7 4.7 4.7 12.3 0 17z" class=""></path></svg>
                                            </a></li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
                <div id="open-filters" class="open-filters d-lg-none d-xl-none">
                    <i class="fa fa-filter"></i>
                    <span>Lọc</span>
                </div>
            </div>
        </div>  

        <div id="popup-cart-desktop" class="popup-cart"></div>

        <script>
            function addProductToCart(productId, title, thumbnail, price) {
                $.ajax({
                    url: "/FurnitureProject/addProductsToCart",
                    type: "post",
                    data: {
                        productId: productId,
                        title: title,
                        thumbnail: thumbnail,
                        price: price
                    },
                    success: function (response) {
                        // Kiểm tra phản hồi từ server
                        if (response.includes("Để thực hiện, bạn cần phải đăng nhập!")) {
                            // Nếu phản hồi chứa thông báo đăng nhập, chuyển hướng đến trang đăng nhập
                            window.location.href = "/FurnitureProject/loginPage";
                            showNotification("Để thực hiện, bạn cần phải đăng nhập!");
                        } else {
                            // Nếu không, hiển thị giỏ hàng
                            const content = document.getElementById("popup-cart-desktop");
                            content.innerHTML = response;
                            showCartModal();
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                    }
                });
            }
            function showNotification(message) {
                // Hiển thị thông báo cho người dùng, ví dụ: sử dụng alert hoặc thêm thông báo vào DOM
                alert(message);
            }
            function showCartModal() {
                const popupcart = document.querySelector('.popup-cart');
                const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');
                // Hiển thị giỏ hàng
                popupcart.classList.add('active');
                backdrop.classList.add('active');
                // Khởi tạo bộ lắng nghe sự kiện cho nút đóng giỏ hàng
                initializeCloseEvent();
            }

            function initializeCloseEvent() {
                const iconClose = document.querySelector('.js-popup-close');
                if (iconClose) {
                    iconClose.addEventListener('click', hideCartModal);
                }
            }

            function hideCartModal() {
                const popupcart = document.querySelector('.popup-cart');
                const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');
                popupcart.classList.remove('active');
                backdrop.classList.remove('active');
            }

            function addProductQuantity(userId, productId) {
                $.ajax({
                    url: "/FurnitureProject/productQuantity",
                    type: "post",
                    data: {
                        userId: userId,
                        productId: productId
                    },
                    success: function (response) {
                        // Parse JSON response từ servlet
                        var products = JSON.parse(response);
                        var totalPrice = 0;
                        var newHTML = '';
                        // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
                        if (products.length === 0) {
                            hideCartModal();
                        } else {
                            // Tạo HTML mới cho giỏ hàng
                            newHTML +=
                                    '<div id="cart-popup-container" class="cartPopupContainer">' +
                                    '<form action="cart" method="post" class="cart ajaxcart cartpopup">' +
                                    '<div class="cart-header-info"><div>Thông tin sản phẩm</div><div>Đơn giá</div><div>Số lượng</div><div>Thành tiền</div></div>' +
                                    '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">'
                                    ;
                            // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                            products.forEach(function (product) {
                                if (product.quantity > 0) {
                                    newHTML += '<div class="ajaxcart__row">';
                                    newHTML += '<div class="ajaxcart__product cart_product">';
                                    newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                                    newHTML += '<img width="80" height="80" src="' + product.thumbnail + '" alt="' + product.title + '">';
                                    newHTML += '</a>';
                                    newHTML += '<div class="grid__item cart_info">';
                                    newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                                    newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                                    newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                    newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half cart_select">';
                                    newHTML += '<div class="ajaxcart__qty input-group-btn">';
                                    newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                                    newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                                    newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                    newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                }
                            });
                            products.forEach(function (product) {
                                totalPrice += product.price * product.quantity;
                            });
                            newHTML += '</div>' +
                                    '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                                    '<div class="row">' +
                                    '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                                    '<div class="ajaxcart__subtotal">' +
                                    '<div class="cart__subtotal">' +
                                    '<div class="cart__col-6">Tổng tiền:</div>' +
                                    '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                                    '</div>' +
                                    '</div>' +
                                    '<div class="cart__btn-proceed-checkout-dt">' +
                                    '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</form>' +
                                    '</div>';

                        }

                        // Thay đổi nội dung của phần tử giỏ hàng
                        $("#cart-popup-container").html(newHTML);
                    },
                    error: function (xhr) {
                        console.error("Lỗi khi phân tích cú pháp JSON: ", error);
                    }
                });
            }

            // Hàm để định dạng số tiền
            function formatCurrency(amount) {
                return amount.toLocaleString('vi-VN') + '₫';
            }


            function reduceProductQuantity(userId, productId) {
                $.ajax({
                    url: "/FurnitureProject/productQuantity",
                    type: "get",
                    data: {
                        userId: userId,
                        productId: productId
                    },
                    success: function (response) {
                        // Parse JSON response từ servlet
                        var products = JSON.parse(response);
                        var totalPrice = 0;
                        var newHTML = '';
                        // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
                        if (products.length === 0) {
                            hideCartModal();
                        } else {
                            // Tạo HTML mới cho giỏ hàng
                            newHTML +=
                                    '<div id="cart-popup-container" class="cartPopupContainer">' +
                                    '<form action="cart" method="post" class="cart ajaxcart cartpopup">' +
                                    '<div class="cart-header-info"><div>Thông tin sản phẩm</div><div>Đơn giá</div><div>Số lượng</div><div>Thành tiền</div></div>' +
                                    '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">'
                                    ;
                            // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                            products.forEach(function (product) {
                                if (product.quantity > 0) {
                                    newHTML += '<div class="ajaxcart__row">';
                                    newHTML += '<div class="ajaxcart__product cart_product">';
                                    newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                                    newHTML += '<img width="80" height="80" src="' + product.thumbnail + '" alt="' + product.title + '">';
                                    newHTML += '</a>';
                                    newHTML += '<div class="grid__item cart_info">';
                                    newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                                    newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                                    newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                    newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half cart_select">';
                                    newHTML += '<div class="ajaxcart__qty input-group-btn">';
                                    newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                                    newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                                    newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '<div class="grid">';
                                    newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                    newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                    newHTML += '</div>';
                                }
                            });
                            products.forEach(function (product) {
                                totalPrice += product.price * product.quantity;
                            });
                            newHTML += '</div>' +
                                    '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                                    '<div class="row">' +
                                    '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                                    '<div class="ajaxcart__subtotal">' +
                                    '<div class="cart__subtotal">' +
                                    '<div class="cart__col-6">Tổng tiền:</div>' +
                                    '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                                    '</div>' +
                                    '</div>' +
                                    '<div class="cart__btn-proceed-checkout-dt">' +
                                    '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</form>'+
                                    '</div>';

                        }

                        // Thay đổi nội dung của phần tử giỏ hàng
                        $("#cart-popup-container").html(newHTML);
                    },
                    error: function (xhr) {
                        console.error("Lỗi khi phân tích cú pháp JSON: ", error);
                    }
                });
            }
        </script>


        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>
