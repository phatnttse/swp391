<%-- 
    Document   : home
    Created on : Dec 11, 2023, 5:37:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="stylesheet" href="assets/css/homeStyle.css">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <body>      
        <%@include file="../UIcomponents/header.jsp"%>
        <div class="slider">
            <div class="slider-body">
                <h2 class="slider-hashtag">#Furnitures</h2>
                <h2 class="slider-heading">Xu hướng nội thất</h2>
                <p class="slider-des">Đồ nội thất cao cấp đến thương hiệu nội thất hàng đầu Việt nam</p>
                <button class="buy-btn">Mua Ngay</button>
            </div>
        </div>
        <c:set var="listSale" value="${requestScope.SALE_LIST}"/>
        <c:set var="listProduct" value="${requestScope.PRODUCTS_LIST}"/>


        <section class="section_flashsale_product">
            <div class="container">
                <ul class="sale-menulist">                 
                    <li class="active">
                        <a href="registerPage" title="">Khuyến mãi đặc biệt</a>
                    </li>
                    <li class="fire">
                        <img src="assets/img/products/sale-bag.png">
                    </li>
                </ul>
                <div class="current tab-content">
                    <div class="row row-fix">
                        <c:if test="${not empty listSale}">
                            <c:forEach var="sale" items="${listSale}" varStatus="loopStatus">
                                <div class="col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix">
                                    <div class="product-action">
                                        <div class="product-thumbnail">
                                            <a class="image_thumb">
                                                <img width="520" height="520" class="lazyload loaded" src="assets/img/products/${sale.image}">
                                            </a>
                                            <div class="smart">
                                                <span>-${sale.discount}</span>
                                            </div>
                                            <a class="btn-wishlist">
                                                <i class="ti-search"></i>
                                            </a>
                                            <div class="badge">
                                                <span class="new">${sale.status}</span>
                                            </div>
                                        </div> 
                                        <div class="product-info">
                                            <h5 class="product-name">
                                                <a class="line-clamp line-clamp-2" href="" >
                                                    ${sale.name}
                                                </a>
                                            </h5>
                                            <div class="price-box">
                                                ${sale.price}
                                                <span class="compare-price">170.000₫</span>

                                            </div>
                                            <div class="btn-shopping">                                               
                                                <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart" onclick="addProductToCart(${sale.productId})"></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>                           
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="btn-view">
                        <input type="submit" value="XEM TẤT CẢ" />
                    </div>
                </div>
            </div>
        </section>


        <section class="section_product_notbat">
            <div class="container">
                <ul class="noibat-menulist">
                    <li class="active">
                        <a href="loginPage" title="">Top bán chạy</a>
                    </li>
                    <li class="active">
                        <a href="registerPage" title="">Hàng mới về</a>
                    </li>
                </ul>
                <div class="current tab-content">
                    <div class="row row-fix">
                        <c:if test="${not empty listProduct}">
                            <c:forEach var="product" items="${listProduct}" varStatus="loopStatus">
                                <div class="col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix">
                                    <div class="product-action">
                                        <div class="product-thumbnail">

                                            <a class="image_thumb">
                                                <img width="520" height="520" class="lazyload loaded" src="assets/img/products/${product.image}">
                                            </a>

                                            <div class="smart">
                                                <span>-${product.discount}</span>
                                            </div>

                                            <a class="btn-wishlist">
                                                <i class="ti-search"></i>
                                            </a>


                                            <div class="badge">
                                                <span class="new">${product.status}</span>
                                            </div>

                                            <div  class="btn-shopping">                                               
                                                <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart" onclick="addProductToCart(${product.productId})"></button>
                                            </div>

                                        </div> 

                                        <div class="product-info">

                                            <h5 class="product-name">
                                                <a class="line-clamp line-clamp-2" href="" >
                                                    ${product.name}
                                                </a>
                                            </h5>

                                            <div class="price-box">
                                                ${product.price}
                                                <span class="compare-price">170.000₫</span>

                                            </div>

                                        </div>


                                    </div>

                                </div>                           
                            </c:forEach>
                        </c:if>
                    </div>                       
                </div>
            </div>

        </section>
        <div class="btn-view">
            <input type="submit" value="XEM TẤT CẢ" />
        </div>

        
        <div id="content" class="cart-modal"></div>  


         <script>
            function addProductToCart(productId) {
                $.ajax({
                    url: "/FurnitureProject/addProductsToCart",
                    type: "get",
                    data: {
                        productId: productId
                    },
                    success: function (response) {
                        const content = document.getElementById("content");
                        // Thêm nội dung sản phẩm mới vào giỏ hàng
                        content.innerHTML = response;
                        // Hiển thị giỏ hàng
                        showCartModal();
                    },
                    error: function (xhr) {
                        // Xử lý lỗi
                    }
                });
            }

            function showCartModal() {
                const cartModal = document.querySelector('.cart-modal');
                // Hiển thị giỏ hàng
                cartModal.style.display = 'block';
                // Khởi tạo bộ lắng nghe sự kiện cho nút đóng giỏ hàng
                initializeCloseEvent();
            }

            function initializeCloseEvent() {
                const iconClose = document.querySelector('.js-modal-close2');
                if (iconClose) {
                    iconClose.addEventListener('click', hideCartModal);
                }
            }

            function hideCartModal() {
                const content = document.getElementById("content");
                content.innerHTML = '';
            }
        </script>

    </body>
</html>
<%@include file="../UIcomponents/footer.jsp" %>