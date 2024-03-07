<%-- 
    Document   : vnpay_pay
    Created on : Mar 5, 2024, 12:28:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Thanh Toán</title>
        <style>
            /* Reset margin and padding */
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                line-height: 1.6; 
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
            }
            .header {
                text-align: center;
                margin-bottom: 20px;            
            }
            .header h3 {
                margin: 0;
                font-size: 24px;
                
            }
            .form-group {
                margin-bottom: 20px;
            }
            .footer {
                text-align: center;
                margin-top: 20px;
            }
            .footer p {
                margin: 0;
            }
            .btn-outline-info {
                display: block;
                margin: 0 auto;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="header clearfix">

                <img height="160px" width="160px" src="https://s-vnba-cdn.aicms.vn/vnba-media/23/8/16/vnpay-logo_64dc3da9d7a11.jpg"
                     alt="VNPAY" class="rounded">
            </div>
            <h3 class="">Thanh toán đơn hàng</h3>
            <div class="table-responsive">
                <form action="/FurnitureProject/eWalletPayment" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label style="font-size: 20px; margin-right: 10px" for="amount">Số tiền:</label>                      
                        <span style="font-size: 20px; color: #2a9dcc"  >${sessionScope.AMOUNT}₫</span>
                        <input type="hidden" name="amount" value="${sessionScope.AMOUNT}" />
                    </div>
                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                        <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                        <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                        <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                        <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                        <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                        <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="vn">
                        <label for="language">Tiếng việt</label><br>
                        <input type="radio" id="language" name="language" value="en">
                        <label for="language">Tiếng anh</label><br>

                    </div>
                    <button type="submit" class="btn btn-outline-info">Thanh toán</button>
                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2024</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>
