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
        <c:set var="cart" value="${sessionScope.CART}"/>
        <header class="banner">
            <div class="wrap">
                <div class="logo logo--left">
                    <h1 class="shop__name">
                        <a href="/">Lofi Furniture</a>
                    </h1>
                </div>
            </div>
        </header>
<!--        <aside>
            <button class="order-summary-toggle">
                <span class="wrap">
                    <span class="order-summary-toggle__inner">
                        <span class="order-summary-toggle__text expandable">
                            Đơn hàng (3)
                        </span>
                        <span class="order-summary-toggle__total-recap">68.750.000₫</span>
                    </span>
                </span>
            </button>
        </aside>-->

        <div id="checkout" class="content">
            <form id="checkoutForm" method="post">
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
                                                <a href="">
                                                    <i class="fa fa-user-circle-o fa-lg"></i>
                                                    <span>Đăng nhập</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="section__content">
                                            <div class="fieldset">
                                                <div class="field  field--show-floating-label">
                                                    <div class="field__input-wrapper">
                                                        <label for="email" class="field__label">Email</label>
                                                        <input name="email" id="email" type="email" class="field__input"
                                                               value="">
                                                    </div>
                                                </div>

                                                <div class="field  field--show-floating-label">
                                                    <div class="field__input-wrapper">
                                                        <label for="name" class="field__label">Họ và tên</label>
                                                        <input name="name" id="name" type="text" class="field__input"
                                                               value="">
                                                    </div>
                                                </div>

                                                <div class="field  field--show-floating-label">
                                                    <div class="field__input-wrapper">
                                                        <label for="phone" class="field__label">Số điện thoại</label>
                                                        <input name="phone" id="phone" type="phone" class="field__input"
                                                               value="">
                                                    </div>
                                                </div>

                                                <div class="field ">
                                                    <div class="field__input-wrapper">
                                                        <label for="billingAddress" class="field__label">
                                                            Địa chỉ
                                                        </label>
                                                        <input name="billingAddress" id="billingAddress" type="text"
                                                               class="field__input" value="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
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
                                            <div class="alert alert--loader spinner spinner--active hide"
                                                 data-bind-show="isLoadingShippingMethod">
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
                                                            <input name="paymentMethod" type="radio" class="input-radio">
                                                        </div>
                                                        <label for="paymentMethod-673383" class="radio__label">
                                                            <span class="radio__label__primary">Thu hộ (COD)</span>
                                                            <span class="radio__label__accessory">
                                                                <span class="radio__label__icon">
                                                                    <i class="payment-icon payment-icon--4"></i>
                                                                </span>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="content-box__row">
                                                    <div class="radio-wrapper">
                                                        <div class="radio__input">
                                                            <input name="paymentMethod" type="radio" class="input-radio">
                                                        </div>
                                                        <label for="paymentMethod-673381" class="radio__label">
                                                            <span class="radio__label__primary">Chuyển khoản</span>
                                                            <span class="radio__label__accessory">
                                                                <span class="radio__label__icon">
                                                                    <i class="payment-icon payment-icon--3"></i>
                                                                </span>
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
                                Đơn hàng (3)
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
                                            <c:forEach var="product" items="${cart}">
                                                <tr class="product">
                                                    <td class="product__image">
                                                        <div class="product-thumbnail">
                                                            <div class="product-thumbnail__wrapper">
                                                                <img src="${product.thumbnail}"
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
                                                        ${product.price/1000 * product.quantity}₫
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                                
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
                                                    <td class="total-line__price">68.750.000₫</td>
                                                </tr>

                                                <tr class="total-line total-line--shipping-fee">
                                                    <th class="total-line__name">
                                                        Phí vận chuyển
                                                    </th>
                                                    <td class="total-line__price">-
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
                                                        <span class="payment-due__price">68.750.000₫</span>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div
                                        class="order-summary__nav field__input-btn-wrapper hide-on-mobile layout-flex--row-reverse">
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