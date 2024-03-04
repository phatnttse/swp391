<%-- 
    Document   : orderdetail
    Created on : Mar 4, 2024, 12:41:06 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiết đơn hàng</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/orderdetail.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
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
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <c:set var="listOrderDetail" value="${requestScope.ORDER_DETAIL}"/>
        <c:set var="listOrderDetailV2" value="${requestScope.ORDER_DETAIL}"/>



        <c:if test="${not empty listOrderDetailV2}">

            <c:forEach var="orderDetailV2" items="${listOrderDetailV2}">
                <section class="h-100 gradient-custom">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-lg-10 col-xl-8">
                                <div class="card" style="border-radius: 10px;">
                                    <div class="card-header px-4 py-5">
                                        <h5 class="text-muted mb-0">Thông tin đơn hàng của, ${orderDetailV2.name} <span style="color: #d94e28e3;"></span>!</h5>
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <p class="lead fw-normal mb-0" style="color: #d94e28e3;">Biên lai</p>
                                            <p class="small text-muted mb-0">Mã đơn hàng : ${orderDetailV2.order_id}</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <p class="text-muted mb-0">Hình ảnh</p>

                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0">Tên sản phẩm</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Màu sắc</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Đơn giá</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Số lượng</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Thành tiền</p>
                                            </div>
                                        </div>
                                        <c:if test="${not empty listOrderDetail}">

                                            <c:forEach var="orderDetail" items="${listOrderDetail}">
                                                <c:set var="total_money" value="${orderDetail.price * orderDetail.quantity}" />
                                                <c:set var="total_amount" value="${total_amount + orderDetail.price * orderDetail.quantity}" />
                                                <div class="card shadow-0 border mb-4">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <img src="${orderDetail.thumbnail}"
                                                                     class="img-fluid" alt="">
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0">${orderDetail.title}</p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0 small">White</p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0 small">
                                                                    <script>
                                                                var totalMoney = parseFloat('${orderDetail.price}');
                                                                var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                document.write(formattedTotalMoney);
                                                                    </script>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0 small">${orderDetail.quantity}</p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0 small">
                                                                    <script>
                                                                var totalMoney = parseFloat('${orderDetail.total_money}');
                                                                var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                document.write(formattedTotalMoney);
                                                                    </script>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </c:if>

                                        <div class="d-flex justify-content-between pt-2">
                                            <p class="fw-bold mb-0">Chi tiết đơn hàng</p>
                                        </div>

                                        <div class="d-flex justify-content-between pt-2">
                                            <p class="text-muted mb-0">Số hóa đơn : LF-${orderDetailV2.order_id}</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="text-muted mb-0">Ngày tạo hóa đơn : ${orderDetailV2.createAt}</p>
                                        </div>

                                    </div>
                                    <div class="card-footer border-0 px-4 py-5"
                                         style="background-color: #d94e28e3; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Tổng tiền: <span class="h2 mb-0 ms-2">
                                                <script>
                                            var totalMoney = parseFloat('${total_amount}');
                                            var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                            document.write(formattedTotalMoney);
                                                </script>
                                            </span></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:forEach>

        </c:if>




        <%@include file="../UIcomponents/footer.jsp" %>
        <script>
            function formatCurrency(amount) {
                return amount.toLocaleString('vi-VN') + '₫';
            }

            function formatAndDisplayPrice(priceElementId, price) {
                var formattedPrice = parseFloat(price).toLocaleString('vi-VN') + '₫';
                document.getElementById(priceElementId).textContent = formattedPrice;
            }

        </script>
    </body>
</html>
