<%-- 
    Document   : checkout
    Created on : Feb 24, 2024, 5:16:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/checkout.css"/>
        <title>Thanh Toán</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER_INFO}"/>
        <c:set var="order_details" value="${sessionScope.ORDER_DETAILS}"/>

        <div id="checkout" class="content">
            <form id="checkoutForm" action="orders" method="post">
                <div class="wrap">
                    <main class="main">
                        <header class="main__header">
                            <div class="logo logo--left">
                                <h1 class="shop__name">
                                    <a href="home">Lofi Furniture</a>
                                </h1>
                            </div>
                        </header>
                        <div class="main__content">
                            <article class="animate-floating-labels row">
                                <div class="col col--two">
                                    <section class="section">
                                        <div class="section__header">
                                            <div class="layout-flex">
                                                <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                    <span>Thông tin nhận hàng</span>
                                                </h2>

                                            </div>
                                        </div>
                                        <c:if test="${user != null}">
                                            <div class="section__content">
                                                <div class="fieldset">
                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="email" class="field__label">Email <span style="color:red"> *</span>
                                                            </label>
                                                            <input name="email" id="email" type="email" class="field__input"
                                                                   value="${user.email}">
                                                        </div>
                                                    </div>

                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="name" class="field__label">Họ và tên <span style="color:red"> *</span>
                                                            </label>
                                                            <input name="name" id="name" type="text" class="field__input"
                                                                   value="${user.name}">
                                                        </div>
                                                    </div>

                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="phone" class="field__label">Số điện thoại <span style="color:red"> *</span>
                                                            </label>
                                                            <input name="phone" id="phone" type="phone" class="field__input"
                                                                   value="${user.phone}" required>
                                                        </div>
                                                    </div>

                                                    <div class="field ">
                                                        <div class="field__input-wrapper">
                                                            <label for="billingAddress" class="field__label">
                                                                Địa chỉ <span style="color:red"> *</span>
                                                            </label>
                                                            <input name="billingAddress" id="billingAddress" type="text"
                                                                   class="field__input" value="${user.address}" required>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${user == null}">
                                            <div class="section__content">
                                                <div class="fieldset">
                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="email" class="field__label">Email <span style="color:red"> *</span>
                                                            </label>
                                                            <input name="email" id="email" type="email" class="field__input"
                                                                   value="${param.email}">
                                                        </div>
                                                    </div>

                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="name" class="field__label">Họ và tên <span style="color:red"> *
                                                            </label>
                                                            <input name="name" id="name" type="text" class="field__input"
                                                                   value="${param.name}">
                                                        </div>
                                                    </div>

                                                    <div class="field  field--show-floating-label">
                                                        <div class="field__input-wrapper">
                                                            <label for="phone" class="field__label">Số điện thoại <span style="color:red"> *
                                                            </label>
                                                            <input name="phone" id="phone" type="phone" class="field__input"
                                                                   value="${param.phone}" required>
                                                        </div>
                                                    </div>

                                                    <div class="field ">
                                                        <div class="field__input-wrapper">
                                                            <label for="billingAddress" class="field__label">
                                                                Địa chỉ <span style="color:red">*</span> 
                                                            </label>
                                                            <input name="billingAddress" id="billingAddress" type="text"
                                                                   class="field__input" value="${param.address}" required>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:if>

                                    </section>

                                    <div class="fieldset">
                                        <h3 class="visually-hidden">Ghi chú</h3>
                                        <div class="field ">
                                            <div class="field__input-wrapper">
                                                <label for="note" class="field__label">
                                                    Ghi chú (tùy chọn)
                                                </label>
                                                <textarea name="note" id="note" class="field__input"></textarea>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="col col--two">
                                    <section class="section">
                                        <div class="section__header">
                                            <div class="layout-flex">
                                                <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                    <i class="fa fa-truck fa-lg section__title--icon hide-on-desktop"></i>
                                                    Vận chuyển
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="section__content" id="shippingMethodList">
                                            <div class="alert alert--loader spinner spinner--active hide">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="spinner-loader">
                                                <use href="#spinner"></use>
                                                </svg>
                                            </div>

                                            <div class="alert alert--info">
                                                Vui lòng nhập thông tin giao hàng
                                            </div>
                                        </div>
                                    </section>

                                    <section class="section">
                                        <div class="section__header">
                                            <div class="layout-flex">
                                                <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                    <i
                                                        class="fa fa-credit-card fa-lg section__title--icon hide-on-desktop"></i>
                                                    Thanh toán
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="section__content">

                                            <div class="content-box">
                                                <div class="content-box__row">
                                                    <div class="radio-wrapper">
                                                        <div class="radio__input">
                                                            <input id="cod" name="paymentMethod" type="radio" value="Thu hộ (COD)" class="input-radio" required> 
                                                        </div>
                                                        <label for="cod" class="radio__label">
                                                            <span id="cod" class="radio__label__primary">Thu hộ (COD)</span>
                                                            <span class="radio__label__accessory">
                                                                <img height="80px" width="80px" src="https://www.coolmate.me/images/COD.svg"
                                                                     alt="VNPAY">
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="content-box__row">
                                                    <div class="radio-wrapper">
                                                        <div class="radio__input">
                                                            <input id="vnpay" name="paymentMethod" type="radio" value="vnPay" class="input-radio" required>
                                                        </div>
                                                        <label for="vnpay" class="radio__label">
                                                            <span class="radio__label__primary">VNPAY</span>
                                                            <span class="radio__label__accessory">
                                                                <img height="80px" width="80px" src="https://s-vnba-cdn.aicms.vn/vnba-media/23/8/16/vnpay-logo_64dc3da9d7a11.jpg"
                                                                     alt="VNPAY">
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </article>
                        </div>
                    </main>

                    <aside class="sidebar">
                        <div class="sidebar__header">
                            <h2 class="sidebar__title">
                                Đơn hàng (${requestScope.NUMBER_PRODUCT} sản phẩm)
                            </h2>
                        </div>
                        <div class="sidebar__content">
                            <div id="order-summary" class="order-summary order-summary--is-collapsed">
                                <div class="order-summary__sections">
                                    <div
                                        class="order-summary__section order-summary__section--product-list order-summary__section--is-scrollable order-summary--collapse-element">
                                        <table class="product-table">
                                            <caption class="visually-hidden">Chi tiết đơn hàng</caption>
                                            <thead class="product-table__header">
                                                <tr>
                                                    <th>
                                                        <span class="visually-hidden">Ảnh sản phẩm</span>
                                                    </th>
                                                    <th>
                                                        <span class="visually-hidden">Mô tả</span>
                                                    </th>
                                                    <th>
                                                        <span class="visually-hidden">Sổ lượng</span>
                                                    </th>
                                                    <th>
                                                        <span class="visually-hidden">Đơn giá</span>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${order_details != null}">
                                                    <c:forEach var="product" items="${order_details}">
                                                        <c:set var="total_money" value="${product.price * product.quantity}" />
                                                        <c:set var="total_amount" value="${total_amount + product.price * product.quantity}" />
                                                        <tr class="product">
                                                            <td class="product__image">
                                                                <div class="product-thumbnail">
                                                                    <div class="product-thumbnail__wrapper">
                                                                        <img src="thumbnails/products/${product.thumbnail}"
                                                                             alt="" class="product-thumbnail__image">
                                                                    </div>
                                                                    <span class="product-thumbnail__quantity">${product.quantity}</span>
                                                                </div>
                                                            </td>
                                                            <th class="product__description">
                                                                <span class="product__description__name">
                                                                    ${product.title}
                                                                </span>
                                                            </th>
                                                            <td class="product__quantity visually-hidden"><em>Số lượng:</em> 2
                                                            </td>
                                                            <td class="product__price">
                                                                <script>
                                                                    var totalMoney = parseInt('${total_money}');
                                                                    var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                    document.write(formattedTotalMoney);
                                                                </script>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="order-summary__section order-summary__section--total-lines order-summary--collapse-element"
                                         id="orderSummary">
                                        <table class="total-line-table">
                                            <caption class="visually-hidden">Tổng giá trị</caption>
                                            <thead>
                                                <tr>
                                                    <td><span class="visually-hidden">Mô tả</span></td>
                                                    <td><span class="visually-hidden">Giá tiền</span></td>
                                                </tr>
                                            </thead>
                                            <tbody class="total-line-table__tbody">
                                                <tr class="total-line total-line--subtotal">
                                                    <th class="total-line__name">
                                                        Tạm tính
                                                    </th>
                                                    <td class="total-line__price">
                                                        <script>
                                                            var totalMoney = parseInt('${total_amount}');
                                                            var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                            document.write(formattedTotalMoney);
                                                        </script>
                                                    </td>
                                                </tr>

                                                <tr class="total-line total-line--shipping-fee">
                                                    <th class="total-line__name">
                                                        Phí vận chuyển
                                                    </th>
                                                    <td class="total-line__price">0
                                                    </td>
                                                </tr>

                                            </tbody>
                                            <tfoot class="total-line-table__footer">
                                                <tr class="total-line payment-due">
                                                    <th class="total-line__name">
                                                        <span class="payment-due__label-total">
                                                            Tổng cộng
                                                        </span>
                                                    </th>
                                                    <td class="total-line__price">
                                                        <span class="payment-due__price">
                                                            <script>
                                                                var totalMoney = parseInt('${total_amount}');
                                                                var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                document.write(formattedTotalMoney);
                                                            </script>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div
                                        class="order-summary__nav field__input-btn-wrapper hide-on-mobile layout-flex--row-reverse">
                                        <input type="hidden" name="amount" value="<c:out value='${total_amount}'/>" />
                                        <button type="submit" class="btn btn-checkout spinner">
                                            <span class="spinner-label">ĐẶT HÀNG</span>
                                        </button>

                                        <a href="cart" class="previous-link">
                                            <i class="previous-link__arrow">❮</i>
                                            <span class="previous-link__content">Quay về giỏ hàng</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </form>
        </div>
    </body>
</html>
