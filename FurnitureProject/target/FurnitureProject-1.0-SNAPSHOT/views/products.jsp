<%-- 
    Document   : customer
    Created on : Dec 14, 2023, 9:58:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="vi">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" type="text/css" href="assets/css/productStyle.css">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Products Page</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <div class="bodywrap">

            <div class="layout-collection"> 
                <%@include file="../UIcomponents/breadCrumb.jsp" %> 
                <div class="container">
                    <div class="row">
                        <aside class="dqdt-sidebar col-lg-3 col-12">
                            <div class="section-box-bg">
                                <aside class="aside-item collection-category aside-cate">
                                    <div class="aside-title">
                                        Danh mục sản phẩm
                                    </div>
                                    <div class="aside-content aside-content-sub clearfix">

                                        <ul class="navbar-pills nav-category">


                                            <li class="nav-item">
                                                <a href="/den-trang-tri" class="nav-link" title="Đèn trang trí">Đèn trang trí </a>
                                                <span class="Collapsible__Plus"></span>
                                                <ul class="dropdown-menu">

                                                    <li class="nav-item ">
                                                        <a class="nav-link" href="/den-chum" title="Đèn chùm">Đèn chùm </a>
                                                    </li>                                                                            

                                                    <li class="nav-item ">
                                                        <a class="nav-link" href="/den-am-tran" title="Đèn âm trần">Đèn âm trần </a>
                                                    </li>

                                                    <li class="nav-item ">
                                                        <a class="nav-link" href="/den-tha-tran" title="Đèn thả trần">Đèn thả trần </a>
                                                    </li>

                                                    <li class="nav-item ">
                                                        <a class="nav-link" href="/den-cay-den-ban" title="Đèn cây - đèn bàn">Đèn cây - đèn bàn </a>
                                                    </li>

                                                </ul>
                                            </li>

                                        </ul>

                                    </div>
                                </aside>
                            </div>
                            <div class="clearfix"></div>
                            <div class="filter-content">
                                <div class="filter-container">
                                    <aside class="aside-item filter-price">
                                        <div class="aside-title">
                                            <h2><span>Chọn mức giá</span></h2>
                                        </div>
                                        <div class="aside-content filter-group content_price">
                                            <ul>


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label data-filter="200-000d" for="filter-100-000d-200-000d">
                                                            <input type="checkbox">
                                                            <i class="fa"></i> 
                                                            Từ 100.000đ - 200.000đ							
                                                        </label>
                                                    </span>
                                                </li>	


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label data-filter="200-000d" for="filter-100-000d-200-000d">
                                                            <input type="checkbox">
                                                            <i class="fa"></i> 
                                                            Từ 100.000đ - 200.000đ							
                                                        </label>
                                                    </span>
                                                </li>	


                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label data-filter="200-000d" for="filter-100-000d-200-000d">
                                                            <input type="checkbox">
                                                            <i class="fa"></i> 
                                                            Từ 100.000đ - 200.000đ							
                                                        </label>
                                                    </span>
                                                </li>		

                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label data-filter="200-000d" for="filter-100-000d-200-000d">
                                                            <input type="checkbox">
                                                            <i class="fa"></i> 
                                                            Từ 100.000đ - 200.000đ							
                                                        </label>
                                                    </span>
                                                </li>	

                                            </ul>
                                        </div>
                                    </aside>

                                    <aside class="aside-item aside-itemxx filter-type">
                                        <div class="aside-title">
                                            <h2 class="title-filter title-head margin-top-0"><span>Loại</span></h2>
                                        </div>
                                        <div class="aside-content filter-group">
                                            <ul>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>                                                                      
                                            </ul>
                                        </div>
                                    </aside>
                                    <aside class="aside-item aside-itemxx filter-type">
                                        <div class="aside-title">
                                            <h2 class="title-filter title-head margin-top-0"><span>Loại</span></h2>
                                        </div>
                                        <div class="aside-content filter-group">
                                            <ul>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>
                                                <li class="filter-item filter-item--check-box filter-item--green">
                                                    <span>
                                                        <label for="filter-ban-trang-tri">
                                                            <input type="checkbox">
                                                            <i class="fa"></i>
                                                            Bàn trang trí
                                                        </label>
                                                    </span>
                                                </li>                                                                      
                                            </ul>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </aside>

                        <div class="block-collection col-lg-9 col-12">
                            <div class="section-box-bg">
                                <h1 class="title-page d-md-block d-none">Tất cả sản phẩm</h1>
                                <div class="category-products products-view-grid list_hover_pro">
                                    <div id="sort-by">
                                        <label class="left"><img width="16" height="16" alt="Sắp xếp" src="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/sort.png?1701660633333">Sắp xếp: </label>

                                        <ul id="sortBy">
                                            <li><span>Mặc định</span>
                                                <ul>								
                                                    <li><a href="" title="Mặc định">Mặc định</a></li>
                                                    <li><a href="" title="A → Z">A → Z</a></li>
                                                    <li><a href="" title="Z → A">Z → A</a></li>
                                                    <li><a href="" title="Giá tăng dần">Giá tăng dần</a></li>
                                                    <li><a href="" title="Giá giảm dần">Giá giảm dần</a></li>
                                                    <li><a href="" title="Hàng mới nhất">Hàng mới nhất</a></li>
                                                    <li><a href="" title="Hàng cũ nhất">Hàng cũ nhất</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="category-products products-view-grid list_hover_pro">
                                        <div class="row row-fix">
                                            <c:set var="listProduct" value="${requestScope.PRODUCTS_LIST}"/>
                                            <c:if test="${not empty listProduct}">
                                                <c:forEach var="product" items="${listProduct}">
                                                    <div class="col-6 col-md-4 col-xl-4 col-fix">
                                                        <div class="item_product_main">
                                                            <div class="product-action">
                                                                <div class="product-thumbnail">

                                                                    <a class="image_thumb">
                                                                        <img width="520" height="520" class="lazyload loaded" src="assets/img/products/${product.image}">
                                                                    </a>

                                                                    <div class="smart">
                                                                        <span>-${product.discount}</span>
                                                                    </div>

                                                                    <a class="btn-wishlist" title="Xem nhanh">
                                                                        <i class="ti-search"></i>
                                                                    </a>

                                                                    <div class="badge">
                                                                        <span class="new">${product.status}</span>
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

                                                                    <div class="btn-shopping">
                                                                        <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart" onclick="addProductToCart(${product.productId})"></button>
                                                                    </div>

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
                        </div>
                    </div>
                </div>
            </div>
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
    </script>

    <%@include file="../UIcomponents/footer.jsp" %>
</body>
</html>