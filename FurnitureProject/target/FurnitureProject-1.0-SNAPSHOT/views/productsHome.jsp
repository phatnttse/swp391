<%-- 
    Document   : productsHome
    Created on : Feb 26, 2024, 1:35:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/productshome.css" />
        <link rel="stylesheet" type="text/css" href="/FurnitureProject/assets/css/popupProduct.css">
        <script src="assets/js/product.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
        <title>JSP Page</title>
    </head>
    <body>

        <c:set var="listProductByCategory" value="${requestScope.PRODUCTS_CATEGORY}"/>
        <section class="section_product_tab">
            <div class="container">
                <div class="e-tabs not-dqtab ajax-tab-1">
                    <div class="content">
                        <div class="block-title">
                            <h2><a href="products">Sản phẩm</a></h2>
                            <ul class="tabs tabs-title tab-desktop ajax clearfix">

                                <li class="tab-link has-content current" data-tab="tab-1" data-url="/bon-tam">
                                    <span onclick="loadProductsByCategory(1)" title="Bồn tắm">Bồn tắm</span>
                                </li>

                                <li class="tab-link has-content" data-tab="tab-2" data-url="/bon-cau">
                                    <span onclick="loadProductsByCategory(2)" title="Bồn cầu">Bồn cầu</span>
                                </li>

                                <li class="tab-link has-content" data-tab="tab-3" data-url="/sen-tam">
                                    <span onclick="loadProductsByCategory(3)" title="Sen tắm">Sen tắm</span>
                                </li>

                                <li class="tab-link" data-tab="tab-4" data-url="/tu-chau-lavabo">
                                    <span onclick="loadProductsByCategory(4)" title="Tủ chậu Lavabo">Tủ chậu Lavabo</span>
                                </li>

                                <li class="tab-link" data-tab="tab-5" data-url="/voi-lavabo">
                                    <span onclick="loadProductsByCategory(5)" title="Vòi Lavado">Vòi Lavado</span>
                                </li>

                                <li class="tab-link" data-tab="tab-6" data-url="/phu-kien">
                                    <span onclick="loadProductsByCategory(6)" title="Phụ kiện">Phụ kiện</span>
                                </li>

                            </ul>
                        </div>

                        <div id="product-list" class="tab-1 tab-content current">
                            <div class="contentfill">

                                <div class="swipertab swiper-container products-view-grid swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events swiper-container-multirow">


                                    <div class="swiper-wrapper" style="width: 1600px; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                                        <c:forEach var="product" items="${listProductByCategory}" varStatus="loopStatus">
                                            <div class="swiper-slide swiper-slide-active" style="width: 300px; margin-right: 20px;">
                                                <div class="item_product_main">

                                                    <form action="" method="post" class="variants product-action " enctype="multipart/form-data">
                                                        <div class="product-thumbnail">
                                                            <a class="image_thumb" href="LoadProductDetailController?productId=${product.productId}" title="${product.title}">
                                                                <img class="lazyload loaded" width="480" height="480" src="thumbnails/products/${product.thumbnail}"  alt="${product.title}" >
                                                            </a>
                                                            <span class="smart">-
                                                                ${product.discount}% 
                                                            </span>
                                                            <a href="" class="btn-compare js-btn-wishlist setWishlist btn-views" data-wish="bon-tam-massage-dat-goc" tabindex="0" title="Thêm vào yêu thích">
                                                                <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"></path></svg>
                                                            </a>

                                                            <div class="action">
                                                                <div class="actions-secondary">
                                                                    <div class="actions-primary">

                                                                        <input type="hidden" name="" value="">

                                                                        <button type="button" class="btn-cart add_to_cart " title="Thêm vào giỏ hàng" onclick="addProductToCart(${product.productId}, '${product.title}', '${product.thumbnail}', ${product.discountProduct}, 1)">
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
                                                                    <button type="button" title="Xem nhanh" onclick="viewFastProduct(${product.productId})"  class="quick-view btn-views">
                                                                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"></path></svg>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-name"><a href="" title="${product.title}">${product.title}</a></h3>
                                                            <div class="price-box">
                                                                <script>
                                                                    var totalMoney = parseFloat('${product.discountProduct}');
                                                                    var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                    document.write(formattedTotalMoney);
                                                                </script>

                                                                <span class="compare-price">
                                                                    <script>
                                                                        var totalMoney = parseFloat('${product.price}');
                                                                        var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                        document.write(formattedTotalMoney);
                                                                    </script>
                                                                </span>

                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>
                                    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span></div>
                                </div>


                            </div>
                        </div>

                        <div class="tab-2 tab-content">
                            <div class="contentfill">


                            </div>

                            <div class="tab-3 tab-content">
                                <div class="contentfill">

                                </div>
                            </div>

                            <div class="tab-4 tab-content">
                                <div class="contentfill">

                                </div>
                            </div>

                            <div class="tab-5 tab-content">
                                <div class="contentfill">

                                </div>
                            </div>

                            <div class="tab-6 tab-content">
                                <div class="contentfill">

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
        </section>
        <div id="quick-view-product" class="quickview-product" style="display: none;"></div>

        <script src="assets/js/ajaxfunctions.js"></script>

    </body>
</html>
