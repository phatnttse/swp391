<%-- 
    Document   : test
    Created on : Feb 23, 2024, 10:22:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/breadcrumb.css">
        <script src="../assets/js/breadcrumb.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <section class="bread-crumb" style="background-image: url('//bizweb.dktcdn.net/100/499/932/themes/926650/assets/breadcrumb-bg.jpg?1708512217480')">
            <div class="container">
                <div class="title-breadcrumb" id="page-title">
                    Giới thiệu
                </div>

                <ul class="breadcrumb">
                    <li class="home">
                        <a href="/" onclick="changePageTitle('Trang chủ')"><span>Trang chủ</span></a>						
                        <span class="mr_lr">&nbsp;<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="svg-inline--fa fa-chevron-right fa-w-10"><path fill="currentColor" d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z" class=""></path></svg>&nbsp;</span>
                    </li>

                    <li><a href="#" onclick="changePageTitle('Giới thiệu')"><strong><span>Giới thiệu</span></strong></a></li>
                </ul>
            </div>
        </section>
    </body>
</html>
