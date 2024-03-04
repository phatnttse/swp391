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
        <style>
            .pagination {
                display: inline-block;
                padding-left: 0;
                margin: 18px 0;
                border-radius: 4px
            }

            .pagination>li {
                display: inline
            }

            .pagination>li>a,.pagination>li>span {
                position: relative;
                float: left;
                padding: 7px 12px;
                line-height: 1.428571429;
                text-decoration: none;
                color: #357ebd;
                background-color: #fff;
                border: 1px solid #ddd;
                margin-left: -1px
            }

            .pagination>li:first-child>a,.pagination>li:first-child>span {
                margin-left: 0;
                border-bottom-left-radius: 4px;
                border-top-left-radius: 4px
            }

            .pagination>li:last-child>a,.pagination>li:last-child>span {
                border-bottom-right-radius: 4px;
                border-top-right-radius: 4px
            }

            .pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover {
                color: #245681;
                background-color: #eee;
                border-color: #ddd
            }

            .pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover {
                z-index: 2;
                color: #fff;
                background-color: #357ebd;
                border-color: #357ebd;
                cursor: default
            }

            .pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover {
                color: #999;
                background-color: #fff;
                border-color: #ddd;
                cursor: not-allowed
            }

            .pagination-lg>li>a,.pagination-lg>li>span {
                padding: 10px 16px;
                font-size: 16px
            }

            .pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span {
                border-bottom-left-radius: 6px;
                border-top-left-radius: 6px
            }

            .pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span {
                border-bottom-right-radius: 6px;
                border-top-right-radius: 6px
            }

            .pagination-sm>li>a,.pagination-sm>li>span {
                padding: 4px 10px;
                font-size: 11px
            }

            .pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span {
                border-bottom-left-radius: 3px;
                border-top-left-radius: 3px
            }

            .pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span {
                border-bottom-right-radius: 3px;
                border-top-right-radius: 3px
            }

            .pager {
                padding-left: 0;
                margin: 18px 0;
                list-style: none;
                text-align: center
            }

            .pager:after,.pager:before {
                content: " ";
                display: table
            }

            .pager:after {
                clear: both
            }

            .pager li {
                display: inline
            }

            .pager li>a,.pager li>span {
                display: inline-block;
                padding: 5px 14px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px
            }

            .pager li>a:focus,.pager li>a:hover {
                text-decoration: none;
                background-color: #eee
            }

            .pager .next>a,.pager .next>span {
                float: right
            }

            .pager .previous>a,.pager .previous>span {
                float: left
            }

            .pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span {
                color: #999;
                background-color: #fff;
                cursor: not-allowed
            }

        </style>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content" style="position: relative;">
                    <style>
                        #os-search-box-test{
                            border-radius:5px;
                            padding:10px;
                            border: thin solid rgba(228,228,228,1);
                            box-shadow: 3px 3px 3px #ccc;
                            background:rgba(228,228,228,1);
                        }

                        .check-order-text{
                            color:rgba(0,0,0,1);
                        }
                        #os-search-box-test label.check-order-text{
                            color:rgba(0,0,0,1);
                        }
                        #os-search-box-test p.check-order-text {
                            color:rgba(0,0,0,1);
                        }
                        .btn-text{
                            color:rgba(255,255,255,1);
                        }
                        #search{
                            background-color:rgba(53,126,189,1);
                        }
                        #os-search-box-test h5.title-text{
                            color:rgba(0,0,0,1);
                        }
                    </style>

                    <div class="container ng-scope" ng-app="checkOrderApp" ng-controller="checkOrderCtrl">
                        <div class="os-search-test row">
                            <!--                            <div class="col-md-5">
                                                            <div id="os-search-box-test">
                                                                <h5 class="title-text"><b><i class="fa fa-search"></i> <span class="tieu-de-custom">Kiểm tra đơn hàng của bạn</span></b></h5>
                                                                <hr class="title-text">
                                                                <form name="form" ng-submit="submit()" novalidate="" class="ng-valid ng-dirty ng-valid-parse ng-submitted ng-valid-email" style="">
                                                                    <div ng-init="model.StoreId = 3544"></div>
                                                                    <div ng-init="config.CheckType = 4"></div>
                            
                                                                    <div ng-init="model.CheckType = 1"></div>
                            
                                                                    <div class="check-type">
                                                                        <label class="check-order-text"><span class="tieu-de-lua-chon">Kiểm tra bằng</span></label>
                                                                        <br>
                                                                        <div class="radio-inline">
                                                                             ngIf: config.CheckType == 1 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 5 <div ng-if="config.CheckType == 1 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 5" class="ng-scope">
                                                                                <input type="radio" ng-model="model.CheckType" value="1" name="CheckType" class="ng-valid ng-dirty ng-touched" style="">
                                                                                <span class="check-order-text so-dien-thoai">Số điện thoại</span>
                                                                            </div> end ngIf: config.CheckType == 1 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 5 
                                                                             ngIf: config.CheckType == 2 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 7 <div ng-if="config.CheckType == 2 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 7" class="ng-scope">
                                                                                <input type="radio" ng-model="model.CheckType" value="2" name="CheckType" class="ng-valid ng-dirty ng-touched" style="">
                                                                                <span class="check-order-text email-custom">Email</span>
                                                                            </div> end ngIf: config.CheckType == 2 || config.CheckType == 4 || config.CheckType == 6 || config.CheckType == 7 
                                                                             ngIf: config.CheckType == 3 || config.CheckType == 4 || config.CheckType == 5 || config.CheckType == 7 <div ng-if="config.CheckType == 3 || config.CheckType == 4 || config.CheckType == 5 || config.CheckType == 7" class="ng-scope">
                                                                                <input type="radio" ng-model="model.CheckType" value="3" name="CheckType" class="ng-valid ng-dirty ng-touched ng-valid-parse" style="">
                                                                                <span class="check-order-text phone-and-email-check">Số điện thoại và Email</span>
                                                                            </div> end ngIf: config.CheckType == 3 || config.CheckType == 4 || config.CheckType == 5 || config.CheckType == 7 
                                                                        </div>
                                                                    </div>
                                                                     ngIf: model.CheckType != 2 <div class="form-group ng-scope" ng-if="model.CheckType != 2" style="">
                                                                        <label for="PhoneNumber" class="control-label check-order-text"><span class="so-dien-thoai">Số điện thoại</span></label>
                                                                        <input type="text" value="" name="PhoneNumber" id="PhoneNumber" placeholder="0909 xxx xxx" data-val-regex-pattern="^[0-9]*$" data-val-regex="Chỉ được nhập số" data-val="true" class="form-control ng-pristine ng-untouched ng-valid" ng-model="model.PhoneNumber" fdprocessedid="ky4tcb">
                                                                        <span data-valmsg-replace="true" data-valmsg-for="PhoneNumber" class="field-validation-valid text-danger"></span>
                                                                    </div> end ngIf: model.CheckType != 2 
                                                                     ngIf: model.CheckType != 1 <div class="form-group ng-scope" ng-if="model.CheckType != 1" style="">
                                                                        <label for="EmailAddress" class="control-label check-order-text"><span class="email-custom">Địa chỉ Email</span></label>
                                                                        <input type="email" value="" name="EmailAddress" id="EmailAddress" placeholder="email@gmail.com" data-val-email="Địa chỉ Email không hợp lệ" data-val="true" class="form-control ng-pristine ng-untouched ng-valid ng-valid-email" ng-model="model.EmailAddress" fdprocessedid="dezv8f">
                                                                        <span data-valmsg-replace="true" data-valmsg-for="EmailAddress" class="field-validation-valid text-danger"></span>
                                                                    </div> end ngIf: model.CheckType != 1 
                                                                    <div style="vertical-align: middle;">
                                                                        <p class="pull-left content-preview check-order-text">
                            
                                                                        </p>
                                                                        <button name="search" class="btn pull-right" type="submit" id="search" fdprocessedid="bycpov">
                                                                            <span class="btn-text btn-kiem-tra-custom">Kiểm tra</span>
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                                <div class="clearfix"></div>
                                                            </div> #os-search-box-test 
                                                        </div>-->

                            <!-- Modal -->
                            <c:set var="listOrder" value="${sessionScope.ALL_ORDER}"/>

                            <div id="os-show" class="col-md-12 ">
                                <!-- ngIf: data.orders.length == 0 -->
                                <!-- ngIf: data.orders.length > 0 --><div class="panel-group ng-scope" id="accordion" ng-if="data.orders.length > 0" style="">
                                    <div class="panel-body" style="padding-top:0px;">
                                        <div id="accordion-item">
                                            <!-- ngRepeat: order in data.orders -->
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
                                                                <!-- ngIf: order.fulfillments.length > 0 -->
                                                                <br>
                                                                <br>
                                                                <span style="color:red;">
                                                                    <span class="thong-tin-trang-thai-thanh-toan">Trạng thái đơn hàng</span>: <b ng-bind="order.financial_status" class="ng-binding">${order.statusName}</b><br>
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
                                                                
<!--                                                                <p style="font-size:28px;">
                                                                    <span style="font-size:18px;color:#333333;"><span class="thong-tin-so-luong-san-pham">Số lượng sản phẩm</span> : </span>
                                                                    <span style="font-size:28px;color:#FF0000;" class="ng-binding">1</span>
                                                                </p>-->
                                                            </div>
                                                        </li>
                                                    </c:forEach>

                                                </c:if>
                                            </ul><!-- end ngRepeat: order in data.orders -->
                                        </div>

                                        <div class="col-md-12">
                                            <ul class="pagination ng-isolate-scope ng-valid" boundary-links="true" total-items="totalItems" max-size="maxSize" items-per-page="data.page_size" rotate="false" ng-model="data.page" previous-text="‹" next-text="›" first-text="«" last-text="»" ng-change="pageChanged()">
                                                <!-- ngIf: ::boundaryLinks --><li ng-if="::boundaryLinks" ng-class="{disabled: noPrevious() || ngDisabled}" class="pagination-first ng-scope disabled"><a href="" ng-click="selectPage(1, $event)" class="ng-binding">«</a></li><!-- end ngIf: ::boundaryLinks -->
                                                <!-- ngIf: ::directionLinks --><li ng-if="::directionLinks" ng-class="{disabled: noPrevious() || ngDisabled}" class="pagination-prev ng-scope disabled"><a href="" ng-click="selectPage(page - 1, $event)" class="ng-binding">‹</a></li><!-- end ngIf: ::directionLinks -->
                                                <!-- ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active,disabled: ngDisabled & amp; & amp;!page.active}" class="pagination-page ng-scope active"><a href="" ng-click="selectPage(page.number, $event)" class="ng-binding">1</a></li><!-- end ngRepeat: page in pages track by $index -->
                                                <!-- ngIf: ::directionLinks --><li ng-if="::directionLinks" ng-class="{disabled: noNext() || ngDisabled}" class="pagination-next ng-scope disabled"><a href="" ng-click="selectPage(page + 1, $event)" class="ng-binding">›</a></li><!-- end ngIf: ::directionLinks -->
                                                <!-- ngIf: ::boundaryLinks --><li ng-if="::boundaryLinks" ng-class="{disabled: noNext() || ngDisabled}" class="pagination-last ng-scope disabled"><a href="" ng-click="selectPage(totalPages, $event)" class="ng-binding">»</a></li><!-- end ngIf: ::boundaryLinks -->
                                            </ul>
                                        </div>

                                    </div>
                                </div><!-- end ngIf: data.orders.length > 0 --><!-- panel-group -->
                            </div>
                        </div><!-- os-search -->

                    </div>
                    <script>
                        window.onmessage = function (e) {
                            if (e.data != null && e.data != undefined) {
                                if (e.data.pEmail != null && e.data.pEmail != undefined) {
                                    setInterval(function () {
                                        var objectCheckOrderChangeContent = e.data;
                                        $(".tieu-de-custom").text(objectCheckOrderChangeContent.pTieuDe);
                                        $(".tieu-de-lua-chon").text(objectCheckOrderChangeContent.pTieuDeLuaChon);
                                        $(".so-dien-thoai").text(objectCheckOrderChangeContent.pSoDienThoai);
                                        $(".email-custom").text(objectCheckOrderChangeContent.pEmail);
                                        $(".phone-and-email-check").text(objectCheckOrderChangeContent.pSoDienThoaiVaEmail);
                                        $(".btn-kiem-tra-custom").text(objectCheckOrderChangeContent.pNutKiemTra);

                                        $(".thong-tin-ma-don-hang").text(objectCheckOrderChangeContent.pThongTinTieuDeMaDonHang);
                                        $(".thong-tin-ho-va-ten-khach-hang").text(objectCheckOrderChangeContent.pThongTinHoVaTenKH);
                                        $(".thong-tin-so-dien-thoai").text(objectCheckOrderChangeContent.pThongTinSoDienThoai);
                                        $(".thong-tin-email").text(objectCheckOrderChangeContent.pThongTinEmail);
                                        $(".thong-tin-ngay-mua").text(objectCheckOrderChangeContent.pThongTinNgayMua);
                                        $(".thong-tin-dia-chi-giao").text(objectCheckOrderChangeContent.pThongTinDiaChiGiao);
                                        $(".thong-tin-gia-tri-don-hang").text(objectCheckOrderChangeContent.pThongTinGiaTriDonHang);
                                        $(".thong-tin-don-vi-tien-te").text(objectCheckOrderChangeContent.pThongTinDonViTienTe);
                                        $(".thong-tin-so-luong-san-pham").text(objectCheckOrderChangeContent.pThongTinSoLuongSanPham);
                                        $(".thong-tin-trang-thai-thanh-toan").text(objectCheckOrderChangeContent.pThongTinTrangThaiThanhToan);
                                        $(".thong-tin-trang-thai-giao-hang").text(objectCheckOrderChangeContent.pThongTinTrangThaiGiaoHang);
                                        $.each($("b[ng-bind='order.financial_status']"), function () {
                                            var content = $(this).text();
                                            if (content == "Đơn hàng chờ xác nhận") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiDonHangChoXacNhan);
                                            }
                                            if (content == "Chờ thanh toán") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiChoThanhToan);
                                            }
                                            if (content == "Đã thanh toán") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiDaThanhToan);
                                            }
                                            if (content == "Thanh toán một phần") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiThanhToanMotPhan);
                                            }
                                            if (content == "Đơn hàng được hoàn trả") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiDonHangDuocHoanTra);
                                            }
                                            if (content == "Hủy bỏ đơn hàng") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiHuyBoDonHang);
                                            }
                                            if (content == "Đơn hàng được hoàn trả một phần") {
                                                $(this).text(objectCheckOrderChangeContent.pTrangThaiDonHangDuocHoanTraMotPhan);
                                            }
                                        });

                                        $.each($("b[ng-bind='order.fulfillment_status']"), function () {
                                            var content = $(this).text();
                                            if (content == "Chưa vận chuyển") {
                                                $(this).text(objectCheckOrderChangeContent.pGiaoHangChuaVanChuyen);
                                            }
                                            if (content == "Đã vận chuyển") {
                                                $(this).text(objectCheckOrderChangeContent.pGiaoHangDaVanChuyen);
                                            }
                                            if (content == "Vận chuyển một phần") {
                                                $(this).text(objectCheckOrderChangeContent.pGiaoHangVanChuyenMotPhan);
                                            }
                                        });

                                    }, 100);
                                }
                            }
                        };
                    </script>

                    <%@include file="../UIcomponents/footer.jsp" %>

                    <div class="resize-sensor" style="position: absolute; inset: 0px; overflow: scroll; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: scroll; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; width: 333px; height: 1141px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: scroll; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; width: 200%; height: 200%"></div></div></div></div>
            </div>
        </div>
    </body>
</html>
