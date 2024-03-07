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
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content" style="position: relative;">
            
                    <div class="container ng-scope" ng-app="checkOrderApp" ng-controller="checkOrderCtrl">
                        <div class="os-search-test row">                         
                            <c:set var="listOrder" value="${sessionScope.ALL_ORDER}"/>
                            <div id="os-show" class="col-md-12 ">
                                <div class="panel-group ng-scope" id="accordion" ng-if="data.orders.length > 0" style="">
                                    <div class="panel-body" style="padding-top:0px;">
                                        <div id="accordion-item">
                                            <ul ng-repeat="order in data.orders" class="ng-scope">

                                                <c:if test="${not empty listOrder}">

                                                    <c:forEach var="order" items="${listOrder}">
                                                        <li class="orf row">
                                                            <div class="col-md-7 ng-binding">
                                                                <p>
                                                                </p><h4> <b class="ng-binding"><span class="thong-tin-ma-don-hang">Mã đơn hàng</span>: ${order.orderId} </b> </h4> <br>
                                                                <span class="thong-tin-ho-va-ten-khach-hang">Họ và tên khách hàng</span>: ${order.name}<br>
                                                                <span class="thong-tin-so-dien-thoai">Số điện thoại</span>: <span class="order-phone ng-binding">${order.phone}</span><br>
                                                                <span class="thong-tin-email">Email</span>: <span class="order-email ng-binding">${order.email}</span><br>
                                                                <span class="thong-tin-ngay-mua">Ngày mua</span>:  <span class="ng-binding">${order.createdAt}</span><br>
                                                                <span class="thong-tin-dia-chi-giao">Địa chỉ giao hàng</span>: ${order.address}
                                                                <br>
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
                                                            <div class="col-md-5">
                                                                <h4><b class="thong-tin-gia-tri-don-hang">Giá trị đơn hàng</b></h4>
                                                                <p style="font-size:28px;">
                                                                    <span style="font-size:28px;color:#FF0000;" class="ng-binding">${order.formattedPrice}</span>
                                                                    <span style="font-size:18px;color:#000000;"><span class="thong-tin-don-vi-tien-te">VNĐ</span></span>
                                                                </p>
                                                                <br>
                                                                <a href="AllOrderDetail?orderId=${order.orderId}">Xem chi tiết đơn hàng của bạn</a>                                                              
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                        </div>                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                            
                    <script>
                        
                    </script>

                    <%@include file="../UIcomponents/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
