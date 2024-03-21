<%-- 
    Document   : test
    Created on : Mar 21, 2024, 8:52:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <title>JSP Page</title>
        <style>
            .alert-success {
                color: #155724;
                background-color: #d4edda;
                border-color: #c3e6cb
            }

            .alert-success hr {
                border-top-color: #b1dfbb
            }

            .alert-success .alert-link {
                color: #0b2e13
            }

            .alert-info {
                color: #0c5460;
                background-color: #d1ecf1;
                border-color: #bee5eb
            }

            .alert-info hr {
                border-top-color: #abdde5
            }

            .alert-info .alert-link {
                color: #062c33
            }
            alert-thongbao {
                display: inline-block;
                margin: 0px auto;
                position: fixed;
                transition: all 0.5s ease-in-out 0s;
                z-index: 1031;
                top: 20px;
                right: 20px;
            }
            element.style {
                position: absolute;
                right: 10px;
                top: 5px;
                z-index: 1033;
            }

            .col-xs-11.col-sm-4.alert.alert-success.animated.fadeInDown {
                width: 270px
            }

            .col-xs-11.col-sm-4.alert.alert-success.animated.fadeInDown button.close {
                border: initial;
                background: initial
            }

            .col-xs-11.col-sm-4.alert.alert-warning.animated.bounceInDown {
                width: 270px
            }

            .col-xs-11.col-sm-4.alert.alert-warning.animated.bounceInDown button.close {
                border: initial;
                background: initial
            }

            .col-xs-11.col-sm-4.alert.alert-info.animated.bounceInDown {
                width: 270px
            }

            .col-xs-11.col-sm-4.alert.alert-info.animated.bounceInDown button.close {
                border: initial;
                background: initial
            }
        </style>
    </head>
    <body>

        <div id="alert-wishlist" class="col-xs-11 col-sm-4 alert alert-success animated fadeInDown" style="display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out 0s; z-index: 1031; top: 20px; right: 20px;">
            <button type="button" class="close" style="position: absolute; right: 10px; top: 5px; z-index: 1033;">×</button><span class="glyphicon glyphicon-ok">

            </span> <span data-notify="title"><strong>Tuyệt vời</strong><br></span>
            <span>Bạn vừa thêm 1 sản phẩm vào mục yêu thích thành công bấm 
                <a style="color:#2196f3" href="/san-pham-yeu-thich">vào đây</a> 
                để tới trang yêu thích
            </span>
         
        </div>
        
    </body>
</html>
