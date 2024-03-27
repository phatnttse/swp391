<%-- 
    Document   : order
    Created on : Mar 3, 2024, 4:29:41 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Đơn Hàng</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/bootstrap-4-3-min.css?1708512217480">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/order.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <style>
            .star-rating input[type="radio"] {
                display: none;
            }
            .star-rating label {
                font-size: 30px;
                cursor: pointer;
            }
            .star-rating label:before {
                content: '★';
            }
            .star-rating input[type="radio"]:checked ~ label {
                color: orange;
            }

        </style>

    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>

        <div class="container-fluid">
            <form action="/FurnitureProject/cancelOrder" method="post" id="cancelOrderForm">
                <div class="row">
                    <div class="col-md-12 main-content" style="position: relative;">
                        <div class="container ng-scope">
                            <div class="os-search-test row">                         
                                <c:set var="listOrder" value="${requestScope.ALL_ORDER}"/>
                                <c:if test="${listOrder != null}">
                                    <div id="os-show" class="col-md-12 ">
                                        <div class="panel-group ng-scope" id="accordion">
                                            <div class="panel-body" style="padding-top:0px;">
                                                <div id="accordion-item">
                                                    <ul class="ng-scope">
                                                        <c:if test="${not empty listOrder}">
                                                            <c:forEach var="order" items="${listOrder}">

                                                                <c:if test="${order.status < 7}">
                                                                    <li class="orf row">
                                                                        <div class="col-md-7">
                                                                            <p>
                                                                            </p><h4> <b class="ng-binding"><span class="thong-tin-ma-don-hang">Mã đơn hàng</span>: ${order.orderId} </b> </h4> <br>
                                                                            <span class="thong-tin-ho-va-ten-khach-hang">Họ và tên khách hàng</span>: ${order.name}<br>
                                                                            <span class="thong-tin-so-dien-thoai">Số điện thoại</span>: <span class="order-phone ng-binding">${order.phone}</span><br>
                                                                            <span class="thong-tin-email">Email</span>: <span class="order-email ng-binding">${order.email}</span><br>
                                                                            <span class="thong-tin-ngay-mua">Ngày mua</span>:  <span class="ng-binding">${order.createdAt}</span><br>
                                                                            <span class="thong-tin-dia-chi-giao">Địa chỉ giao hàng</span>: ${order.address}
                                                                            <br>
                                                                            <br>

                                                                            <span style="color:red;">
                                                                                <span class="thong-tin-trang-thai-thanh-toan">Trạng thái thanh toán</span>: <b class="ng-binding">
                                                                                    <c:if test="${order.paymentStatus == true}">
                                                                                        Đã thanh toán
                                                                                    </c:if>
                                                                                    <c:if test="${order.paymentStatus == false}">
                                                                                        Chưa thanh toán
                                                                                    </c:if>
                                                                                </b><br>
                                                                            </span>
                                                                            <span style="color:red;">
                                                                                <span class="thong-tin-trang-thai-thanh-toan">Trạng thái đơn hàng</span>: <b class="ng-binding">${order.statusName}</b><br>
                                                                            </span>
                                                                            <p></p>
                                                                        </div>
                                                                        <div class="col-md-5 my-3">
                                                                            <h4><b class="thong-tin-gia-tri-don-hang">Giá trị đơn hàng</b></h4>
                                                                            <p style="font-size:28px;">
                                                                                <span style="font-size:28px;color:#FF0000;" class="ng-binding">${order.formattedPrice}</span>
                                                                                <span style="font-size:18px;color:#000000;"><span class="thong-tin-don-vi-tien-te">VNĐ</span></span>
                                                                            </p>
                                                                            <br>
                                                                            <a href="AllOrderDetail?orderId=${order.orderId}">Xem chi tiết đơn hàng của bạn</a><br><br><br><br><br> 

                                                                            <c:if test="${order.status != 6 && order.status != 5}">
                                                                                <input type="hidden" name="orderId" value="${order.orderId}" />
                                                                                <span style="color:red;margin-top: 20px;font-weight: 600">
                                                                                    <a href="#" class="cancel-order-link" data-order-id="${order.orderId}">Huỷ đơn hàng</a>
                                                                                </span>
                                                                            </c:if>

                                                                        </div>
                                                                    </li>  
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${empty listOrder}">
                                                            <div>
                                                                <center>
                                                                    <h3 class="" style="margin-top: 20px;">Bạn chưa có đơn hàng nào</h3>
                                                                </center>
                                                            </div>
                                                        </c:if>
                                                    </ul>
                                                </div>                                      
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${listOrder == null}">
                                    <div>
                                        <center>
                                            <div class="title-block-page" style="margin: 40px">
                                                <h1 class="title-head">Bạn chưa có đơn hàng nào</h1>
                                            </div>
                                        </center>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Popup Huỷ Đơn Hàng -->
                <div class="modal" id="cancelOrderModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Chọn lý do huỷ đơn hàng</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">                      
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="reason" id="reason1" value="Thay đổi địa chỉ nhận hàng">
                                    <label class="form-check-label" for="reason1">
                                        Thay đổi địa chỉ nhận hàng
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="reason" id="reason2" value="Tìm thấy ưu đãi tốt hơn">
                                    <label class="form-check-label" for="reason2">
                                        Tìm thấy ưu đãi tốt hơn
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="reason" id="reason3" value="Không thích sản phẩm này nữa">
                                    <label class="form-check-label" for="reason3">
                                        Thay đổi ý kiến
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="reason" id="reason4" value="Lý do khác">
                                    <label class="form-check-label" for="reason4">
                                        Lý do khác
                                    </label>
                                </div>
                                <div class="form-floating">
                                    <textarea class="form-control" placeholder="Lý do khác" id="otherReason" name="reason"></textarea>
                                    <label for="otherReason">Lý do khác (nếu có)</label>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-danger" id="submitCancelOrder">Xác nhận Huỷ đơn hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <%@include file="../UIcomponents/footer.jsp" %>


        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lắng nghe sự kiện khi click vào link Huỷ đơn hàng
                const cancelOrderLinks = document.querySelectorAll('.cancel-order-link');
                cancelOrderLinks.forEach(link => {
                    link.addEventListener('click', function (e) {
                        e.preventDefault();
                        // Mở popup Huỷ đơn hàng
                        $('#cancelOrderModal').modal('show');
                    });
                });

                // Lắng nghe sự kiện khi click vào nút Đóng hoặc Xác nhận Huỷ đơn hàng
                document.querySelectorAll('[data-bs-dismiss="modal"]').forEach(button => {
                    button.addEventListener('click', function () {
                        // Ẩn popup Huỷ đơn hàng
                        $('#cancelOrderModal').modal('hide');
                    });
                });
            });

            document.querySelectorAll('.star-rating .star').forEach(function (star) {
                star.onclick = function () {
                    var ratingValue = this.getAttribute('data-value');
                    console.log('Đánh giá: ' + ratingValue + ' sao'); // Thay thế bằng hành động gửi đánh giá đến server
                    // Đánh dấu các ngôi sao đã chọn
                    document.querySelectorAll('.star-rating .star').forEach(function (otherStar) {
                        otherStar.style.color = otherStar.getAttribute('data-value') <= ratingValue ? '#f5c518' : '#c5c5c5';
                    });
                };
            });



        </script>
    </body>
</html>
