<%-- 
    Document   : checkOutSuccess
    Created on : Feb 29, 2024, 12:46:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="thankyou-page">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="Lofi Furniture - Cảm ơn" />
        <title>Thanh Toán Thành Công</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lipis/flag-icons@6.6.6/css/flag-icons.min.css" />
        <link rel="stylesheet" href="assets/css/checkoutsuccess.css">



    </head>
    <c:set var="order" value="${sessionScope.ORDER_SUCCESS}"/>
    <c:set var="order_details" value="${sessionScope.ORDER_DETAILS}"/>
    <body data-no-turbolink>

        <div class="content">
            <form>
                <div class="wrap wrap--mobile-fluid">
                    <main class="main main--nosidebar">
                        <header class="main__header">
                            <div class="logo logo--left">

                                <h1 class="shop__name">
                                    <a href="home">Lofi Furniture</a>
                                </h1>

                            </div>
                        </header>
                        <div class="main__content">
                            <article class="row">
                                <div class="col col--primary">
                                    <section class="section section--icon-heading">
                                        <div class="section__icon unprintable">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="72px" height="72px">
                                            <g fill="none" stroke="#8EC343" stroke-width="2">
                                            <circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
                                            <path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
                                            </g>
                                            </svg>
                                        </div>
                                        <div class="thankyou-message-container">
                                            <h2 class="section__title">Cảm ơn bạn đã đặt hàng</h2>

                                            <p class="section__text">
                                                Một email xác nhận đã được gửi tới ${order.email}. <br/>
                                                Xin vui lòng kiểm tra email của bạn
                                            </p>


                                        </div>
                                    </section>
                                </div>
                                <div class="col col--secondary">
                                    <aside class="order-summary order-summary--bordered order-summary--is-collapsed" id="order-summary">
                                        <div class="order-summary__header">
                                            <div class="order-summary__title">
                                                Đơn hàng #1011
                                                <span class="unprintable">(1)</span>
                                            </div>
                                            <div class="order-summary__action hide-on-desktop unprintable">
                                                <a data-toggle="#order-summary" data-toggle-class="order-summary--is-collapsed" class="expandable">
                                                    Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                        <div class="order-summary__sections">
                                            <div class="order-summary__section order-summary__section--product-list order-summary__section--is-scrollable order-summary--collapse-element">
                                                <table class="product-table">
                                                    <c:forEach var="product" items="${order_details}">
                                                        <c:set var="total_money" value="${product.price * product.quantity}" />
                                                        <c:set var="total_amount" value="${total_amount + product.price * product.quantity}" />
                                                        <tbody>

                                                            <tr class="product">
                                                                <td class="product__image">
                                                                    <div class="product-thumbnail">
                                                                        <div class="product-thumbnail__wrapper">
                                                                            <img src="${product.thumbnail}" alt="" class="product-thumbnail__image" />
                                                                        </div>
                                                                        <span class="product-thumbnail__quantity unprintable">${product.quantity}</span>
                                                                    </div>
                                                                </td>
                                                                <th class="product__description">
                                                                    <span class="product__description__name">${product.title}</span>


                                                                </th>
                                                                <td class="product__quantity printable-only">
                                                                    x 1
                                                                </td>
                                                                <td class="product__price">

                                                                    <script>
                                                                        var totalMoney = parseInt('${product.price}');
                                                                        var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                        document.write(formattedTotalMoney);
                                                                    </script>

                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <div class="order-summary__section">
                                                <table class="total-line-table">
                                                    <tbody class="total-line-table__tbody">


                                                        <tr class="total-line total-line--subtotal">
                                                            <th class="total-line__name">Tạm tính</th>
                                                            <td class="total-line__price"><script>
                                                                var totalMoney = parseInt('${total_money}');
                                                                var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                document.write(formattedTotalMoney);
                                                                </script>
                                                            </td>
                                                        </tr>

                                                        <tr class="total-line total-line--shipping-fee">
                                                            <th class="total-line__name">Phí vận chuyển</th>
                                                            <td class="total-line__price">
                                                                0
                                                            </td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                            <div class="order-summary__section">
                                                <table class="total-line-table">
                                                    <tbody class="total-line-table__tbody">
                                                        <tr class="total-line payment-due">
                                                            <th class="total-line__name">
                                                                <span class="payment-due__label-total">Tổng cộng</span>
                                                            </th>
                                                            <td class="total-line__price">
                                                                <span class="payment-due__price"><script>
                                                                    var totalMoney = parseInt('${total_amount}');
                                                                    var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                    document.write(formattedTotalMoney);
                                                                    </script>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </aside>
                                </div>
                                <div class="col col--primary">
                                    <section class="section">
                                        <div class="section__content section__content--bordered">

                                            <div class="row">

                                                <div class="col col--md-two">
                                                    <h2>Thông tin mua hàng</h2>
                                                    <p>${order.address}</p>

                                                    <p>${order.email}</p>


                                                    <p>${order.phone}</p>

                                                </div>

                                                <div class="col col--md-two">
                                                    <h2>Địa chỉ nhận hàng</h2>

                                                    <p>${order.address}</p>

                                                    <p>${order.phone}</p>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col col--md-two">
                                                    <h2>Phương thức thanh toán</h2>
                                                    <p>${order.paymentMethod}</p>
                                                </div>
                                                <div class="col col--md-two">
                                                    <h2>Phương thức vận chuyển</h2>
                                                    <p>Giao hàng tận nơi</p>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="section unprintable">
                                        <div class="field__input-btn-wrapper field__input-btn-wrapper--floating">
                                            <a href="/FurnitureProject/products" class="btn btn--large">Tiếp tục mua hàng</a>
                                            <span class="text-icon-group text-icon-group--large icon-print" onclick="window.print()">
                                                <i class="fa fa-print"></i>
                                                <span>In </span>
                                            </span>
                                        </div>
                                    </section>
                                </div>
                            </article>
                        </div>
                    </main>
                </div>
            </form>
        </div>
    </body>
</html>
