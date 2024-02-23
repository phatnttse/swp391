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
        <title>Furniture Project</title>
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/homeStyle.css">
        <link rel="stylesheet" href="/FurnitureProject/assets/themify-icons/themify-icons.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    </head>
    <body>      
        <%@include file="../UIcomponents/header3.jsp"%>
        <%@include file="../UIcomponents/slider.jsp"%>

        <c:set var="listHotProduct" value="${requestScope.PRODUCTS_LIST}"/>
        <c:set var="listProductByCategory" value="${requestScope.PRODUCTS_CATEGORY}"/>
        <c:set var="listAllCategory" value="${requestScope.CATEGORY_ALL}"/>


        <!-- Danh mục nổi bật -->
        <section class="section_product_notbat">
            <div class="container">
                <ul class="noibat-menulist">
                    <li class="active">
                        <a href="" title="">Danh Mục Nổi Bật</a>
                    </li>
                   
                </ul>
                <div class="current tab-content">
                    <div class="row row-fix">
                        <c:if test="${not empty listAllCategory}">
                            <c:forEach var="category" items="${listAllCategory}" varStatus="loopStatus">
                                <div class="col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix">
                                    <div class="product-action">
                                        <div class="product-thumbnail">
                                            <a class="image_thumb">
                                                <img width="520" height="520" class="lazyload loaded" src="${category.thumbnail}">
                                            </a>                                                                               
                                        </div> 

                                        <div class="product-info">
                                            <h5 class="product-name">
                                                <a class="line-clamp line-clamp-2" href="" >
                                                    ${category.name}
                                                </a>
                                            </h5>                                                                                                                                                                          
                                        </div>
                                    </div>

                                </div>                           
                            </c:forEach>
                        </c:if>
                    </div>                       
                </div>
            </div>

        </section> 

        <!-- sản phẩm mới -->
        <section class="section_product_notbat">
            <div class="container">
                <ul class="noibat-menulist">
                    <li class="active">
                        <a href="" title="">Sản phẩm mới</a>
                    </li>
                   
                </ul>
                <div class="current tab-content">
                    <div class="row row-fix">
                        <c:if test="${not empty listHotProduct}">
                            <c:forEach var="product" items="${listHotProduct}" varStatus="loopStatus">
                                <div class="col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix">
                                    <div class="product-action">
                                        <div class="product-thumbnail">

                                            <a class="image_thumb">
                                                <img width="520" height="520" class="lazyload loaded" src="${product.thumbnail}">
                                            </a>

                                            <div class="smart">
                                                <span>-${product.discount}</span>
                                            </div>

                                            <a class="btn-wishlist">
                                                <i class="ti-search"></i>
                                            </a>
                                            <div  class="btn-shopping">                                               
                                                <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart" onclick="addProductToCart(${product.productId})"></button>
                                            </div>

                                        </div> 

                                        <div class="product-info">

                                            <h5 class="product-name">
                                                <a class="line-clamp line-clamp-2" href="" >
                                                    ${product.title}
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

        <!-- Sản phẩm theo loại -->
        <section class="section_product_notbat">
            <div class="container">
              
                <div class="block-title">
                    <h2><a href="/collections/all">Sản phẩm</a></h2>
                    <button onclick="loadProductsByCategory(1)">Bồn tắm</button>
                    <button onclick="loadProductsByCategory(2)">Bồn cầu</button>
                    <button onclick="loadProductsByCategory(3)">Sen tắm</button>
                    <button onclick="loadProductsByCategory(4)">Tủ chậu Lavabo</button>
                    <button onclick="loadProductsByCategory(5)">Vòi Lavado</button>
                    <button onclick="loadProductsByCategory(6)">Phụ kiện</button>
                    <!-- Các nút khác tương ứng với danh mục trong cơ sở dữ liệu -->

                </div>
                <div id="product-list">
                    <div class="current tab-content">
                        <div class="row row-fix">
                            <c:if test="${not empty listProductByCategory}">
                                <c:forEach var="productcategory" items="${listProductByCategory}" varStatus="loopStatus">
                                    <div class="col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix">
                                        <div class="product-action">
                                            <div class="product-thumbnail">

                                                <a class="image_thumb">
                                                    <img width="520" height="520" class="lazyload loaded" src="${productcategory.thumbnail}">
                                                </a>                                              
                                                <div class="smart">
                                                    <span>-${productcategory.discount}</span>
                                                </div>

                                                <a class="btn-wishlist">
                                                    <i class="ti-search"></i>
                                                </a>

                                                <div  class="btn-shopping">                                               
                                                    <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart" onclick="addProductToCart(${productcategory.productId})"></button>
                                                </div>

                                            </div> 

                                            <div class="product-info">

                                                <h5 class="product-name">
                                                    <a class="line-clamp line-clamp-2" href="" >
                                                        ${productcategory.title}
                                                    </a>
                                                </h5>

                                                <div class="price-box">
                                                    ${productcategory.price}
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
            </div>

        </section>


        <div class="btn-view">
            <input type="submit" value="XEM TẤT CẢ" />
        </div>


        <div id="content" class="cart-modal"></div>  


        <script>
            // Gọi hàm loadProductsByCategory() khi trang được tải lên với giá trị mặc định
            $(document).ready(function () {
                loadProductsByCategory(1); // 0 hoặc giá trị mặc định tùy thuộc vào logic của hàm loadProductsByCategory()
            });

            function loadProductsByCategory(categoryId) {
                $.ajax({
                    type: "GET",
                    url: "/FurnitureProject/home",
                    data: {categoryId: categoryId},
                    success: function (data) {
                        // Hiển thị dữ liệu HTML trực tiếp lên trang JSP
                        $("#product-list").html(data);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
            function addProductToCart(productId) {
                $.ajax({
                    url: "/FurnitureProject/addProductsToCart",
                    type: "get",
                    data: {
                        productId: productId
                    },
                    success: function (response) {
                        // Kiểm tra phản hồi từ server
                        if (response.includes("Để thực hiện, bạn cần phải đăng nhập!")) {
                            // Nếu phản hồi chứa thông báo đăng nhập, chuyển hướng đến trang đăng nhập
                            window.location.href = "/FurnitureProject/loginPage";
//                            showNotification("Để thực hiện, bạn cần phải đăng nhập!");
                        } else {
                            // Nếu không, hiển thị giỏ hàng
                            const content = document.getElementById("content");
                            content.innerHTML = response;
                            showCartModal();
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                    }
                });
            }
//            function showNotification(message) {
//                // Hiển thị thông báo cho người dùng, ví dụ: sử dụng alert hoặc thêm thông báo vào DOM
//                alert(message);
//            }

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