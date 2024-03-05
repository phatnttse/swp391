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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
        <link rel="stylesheet" href="/FurnitureProject/assets/js/product.js" />
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
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
        <div class="backdrop__body-backdrop___1rvky"></div>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/slider.jsp"%>
        <%@include file="../views/hotcategory.jsp"%>


        <c:set var="listProductByCategory" value="${requestScope.PRODUCTS_CATEGORY}"/>

        <%@include file="../views/productset.jsp"%>

        <%@include file="../views/productsHome.jsp"%>

        <%@include file="../views/abouthome.jsp"%>





        <div id="popup-cart-desktop" class="popup-cart">


        </div>

    <df-messenger
        intent="WELCOME"
        chat-title="Lofi_Furniture_Support"
        agent-id="cf3b1e72-2c0d-43b8-b9d4-e26ce22ec3bd"
        language-code="en"
        ></df-messenger>
    <script>

        /**
         * view Product
         * @param {type} categoryId
         * @returns {undefined}
         */

        function addProductToCart(productId) {
            $.ajax({
                url: "/FurnitureProject/addProductsToCart",
                type: "GET",
                data: {
                    productId: productId,

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


        /**
         * 
         * @param {type} categoryId
         * @returns {undefined}
         */
        function loadProductsByCategory(categoryId) {
            $.ajax({
                type: "POST",
                url: "/FurnitureProject/category",
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
                                '<div class="cartPopupContainer">' +
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
                                '<div class="cartPopupContainer">' +
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
    </script>

</body>
</html>
<%@include file="../UIcomponents/footer.jsp" %>