<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="/FurnitureProject/assets/css/cartStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Giỏ Hàng</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>
        <div>
            <c:set var="cart" value="${sessionScope.CART}"/>

            
                <section class="main-cart-page main-container col1-layout">
                    <div class="main container cartpcstyle">
                        <div class="wrap_background_aside">
                            <div class="row">
                                <div class="col-xl-12 col-12 col-cart-left">
                                    <div class="cart-page d-xl-block d-none">
                                        <div class="drawer__inner">
                                            <div class="CartPageContainer">
                                                <c:if test="${not empty cart}">
                                                <form id="products" action="cart" method="post" class="cart ajaxcart cartpage">
                                                    <div class="cart-header-info">
                                                        <div>Thông tin sản phẩm</div>
                                                        <div>Đơn giá</div>
                                                        <div>Số lượng</div>
                                                        <div>Thành tiền</div>
                                                    </div>
                                                    <div 
                                                        class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">
                                                        <c:forEach var="product" items="${cart}">
                                                            <c:set var="total_money" value="${product.price * product.quantity}" />
                                                            <c:set var="total_amount" value="${total + product.price * product.quantity}" />
                                                            <div class="ajaxcart__row">
                                                                <div class="ajaxcart__product cart_product">
                                                                    <a href=""
                                                                       class="ajaxcart__product-image cart_image"
                                                                       title="Tủ chậu bo tròn kèm tủ gương thông minh"><img
                                                                            src="${product.thumbnail}"
                                                                            alt="${product.title}"></a>
                                                                    <div class="grid__item cart_info">
                                                                        <div class="ajaxcart__product-name-wrapper cart_name">
                                                                            <a href=""
                                                                               class="ajaxcart__product-name h4"
                                                                               title="${product.title}">${product.title}</a>
                                                                            <a class="cart__btn-remove remove-item-cart ajaxifyCart--remove"
                                                                               href="">Xóa</a>

                                                                        </div>
                                                                        <div class="grid">
                                                                            <div class="grid__item one-half text-right cart_prices">
                                                                                <span class="cart-price" data-price="${product.price}">${product.price}</span>
                                                                            </div>

                                                                        </div>
                                                                        <div class="grid">
                                                                            <div class="grid__item one-half cart_select">
                                                                                <div class="ajaxcart__qty input-group-btn">
                                                                                    <button type="button"
                                                                                            class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count"
                                                                                            onclick="reduceProductQuantity('${product.userId}', ${product.productId})"
                                                                                            >
                                                                                        -
                                                                                    </button>
                                                                                    <input id="quantity_${product.productId}" type="text" name=""
                                                                                           value="${product.quantity}"
                                                                                           class="ajaxcart__qty-num number-sidebar"
                                                                                           maxlength="3" value="1" min="0"                                                                              
                                                                                           pattern="[0-9]*">
                                                                                    <button type="button"
                                                                                            class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count"
                                                                                            onclick="addProductQuantity('${product.userId}', ${product.productId})"
                                                                                            >
                                                                                        +
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="grid">
                                                                            <div class="grid__item one-half text-right cart_prices">
                                                                                <span class="cart-price">${total_money}</span>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                    <div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">
                                                                <div class="ajaxcart__subtotal">
                                                                    <div class="cart__subtotal">
                                                                        <div class="cart__col-6">Tổng tiền:</div>
                                                                        <div id="totalPrice" class="text-right cart__totle"><span
                                                                                class="total-price">${total_amount}₫</span></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cart__btn-proceed-checkout-dt">
                                                                    <button  type="submit"
                                                                            class="button btn btn-default cart__btn-proceed-checkout"
                                                                            title="Thanh toán">Thanh
                                                                        toán</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                            <c:if test="${empty cart}">
                                                <div>
                                                    <center>
                                                        <h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3>
                                                    </center>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-mobile-page d-block d-xl-none">
                                    <div class="CartMobileContainer"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>



            <%@include file="../UIcomponents/footer.jsp" %>

            <script>
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
                                newHTML = '<div><center><h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3></center></div>';
                            } else {
                                // Tạo HTML mới cho giỏ hàng
                                newHTML += '<form id="content" action="cart" method="post" class="cart ajaxcart cartpage">' +
                                        '<div class="cart-header-info">' +
                                        '<div>Thông tin sản phẩm</div>' +
                                        '<div>Đơn giá</div>' +
                                        '<div>Số lượng</div>' +
                                        '<div>Thành tiền</div>' +
                                        '</div>' +
                                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">';
                                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                                products.forEach(function (product) {
                                    if (product.quantity > 0) {
                                        newHTML += '<div class="ajaxcart__row">';
                                        newHTML += '<div class="ajaxcart__product cart_product">';
                                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                                        newHTML += '<img src="' + product.thumbnail + '" alt="' + product.title + '">';
                                        newHTML += '</a>';
                                        newHTML += '<div class="grid__item cart_info">';
                                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                                        newHTML += '</div>';
                                        newHTML += '<div class="grid">';
                                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                        newHTML += '<span class="cart-price" data-price="' + product.price + '">' + product.price + '</span>';
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
                                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + (product.price * product.quantity) + '</span>';
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
                                        '<div class="text-right cart__totle"><span class="total-price">' + totalPrice + '</span></div>' +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="cart__btn-proceed-checkout-dt">' +
                                        '<button type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</form>';
                            }

                            // Thay đổi nội dung của phần tử giỏ hàng
                            $("#products").html(newHTML);
                        },
                        error: function (xhr) {
                            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
                        }
                    });
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
                                newHTML = '<div><center><h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3></center></div>';
                            } else {
                                // Tạo HTML mới cho giỏ hàng
                                newHTML += '<form id="content" action="/cart" method="post" class="cart ajaxcart cartpage">' +
                                        '<div class="cart-header-info">' +
                                        '<div>Thông tin sản phẩm</div>' +
                                        '<div>Đơn giá</div>' +
                                        '<div>Số lượng</div>' +
                                        '<div>Thành tiền</div>' +
                                        '</div>' +
                                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">';
                                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                                products.forEach(function (product) {
                                    if (product.quantity > 0) {
                                        newHTML += '<div class="ajaxcart__row">';
                                        newHTML += '<div class="ajaxcart__product cart_product">';
                                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                                        newHTML += '<img src="' + product.thumbnail + '" alt="' + product.title + '">';
                                        newHTML += '</a>';
                                        newHTML += '<div class="grid__item cart_info">';
                                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                                        newHTML += '</div>';
                                        newHTML += '<div class="grid">';
                                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                                        newHTML += '<span class="cart-price" data-price="' + product.price + '">' + product.price + '</span>';
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
                                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + (product.price * product.quantity) + '</span>';
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
                                        '<div class="text-right cart__totle"><span class="total-price">' + totalPrice + '</span></div>' +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="cart__btn-proceed-checkout-dt">' +
                                        '<button onclick="" type="button" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</form>';
                            }

                            // Thay đổi nội dung của phần tử giỏ hàng
                            $("#products").html(newHTML);
                        },
                        error: function (xhr) {
                            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
                        }
                    });
                }
            </script>
    </body>
</html>
