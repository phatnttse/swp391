<%-- 
    Document   : header3
    Created on : Feb 23, 2024, 12:07:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/header.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="banner-top">
            <div class="container">
                <div class="cover">
                    <a href="products" title="Lofi Furniture"><img
                            src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/banner-top.png?1708512217480"
                            alt="Lofi Furniture" class="img-fluid"></a>
                </div>
            </div>
        </div>

        <div class="top-bar">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6 d-none d-md-block">
                        <ul class="top-bar-left">
                            <li>
                                <a href="tel:19006750" title="tel:19006750">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <path
                                        d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z">
                                    </path>
                                    </svg>
                                    <span>1900 6750</span>
                                </a>
                            </li>
                            <li>
                                <a href="mailto:support@sapo.vn" title="support@sapo.vn">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <path
                                        d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z">
                                    </path>
                                    </svg>
                                    <span>support@fpt.vn</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <ul class="ul-control">                      
                            <li>
                                <a href="/apps/kiem-tra-don-hang" title="Kiểm tra đơn hàng"><img
                                        src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/box.png?1708512217480"
                                        class="img-fluid" alt="Lofi Furniture"> Kiểm tra đơn hàng</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <header id="header">
            <div class="header-top">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3 col-6">

                            <a href="home" class="logo" title="Logo">
                                <img src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/logo.png?1708512217480"
                                     alt="Lofi Furniture" class="img-fluid">
                            </a>

                        </div>
                        <div class="col-xl-6 col-lg-5 col-12 search-header">
                            <div class="search-smart">
                                <form action="/search" method="get" class="search-form header-search-form" role="search">
                                    <input type="text" name="query" required
                                           class="input-group-field auto-search search-auto form-control"
                                           placeholder="Nhập tên sản phẩm..." autocomplete="off">
                                    <input type="hidden" name="type" value="product" />
                                    <button class="btn btn-default" type="submit" aria-label="Tìm kiếm">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100"
                                             style="enable-background:new 0 0 100 100;" xml:space="preserve">
                                        <g>
                                        <g>
                                        <path
                                            d="M42.334,82.668C20.094,82.668,2,64.574,2,42.334S20.094,2,42.334,2c22.239,0,40.333,18.094,40.333,40.334
                                            S64.573,82.668,42.334,82.668z M42.334,11.116c-17.214,0-31.218,14.004-31.218,31.218S25.12,73.552,42.334,73.552
                                            c17.213,0,31.217-14.004,31.217-31.218S59.547,11.116,42.334,11.116z">
                                        </path>
                                        </g>
                                        <g>
                                        <path
                                            d="M93.442,98c-1.166,0-2.333-0.445-3.223-1.335L64.666,71.111c-1.78-1.779-1.78-4.666,0-6.445
                                            c1.778-1.78,4.667-1.78,6.445,0l25.554,25.554c1.78,1.779,1.78,4.666,0,6.445C95.776,97.555,94.608,98,93.442,98z">
                                        </path>
                                        </g>
                                        </g>
                                        </svg>
                                    </button>

                                    <div class="search-suggest">
                                        <div class="list-search list-search-style">
                                        </div>
                                        <div class="list-search2 list-search-style">
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <c:set var="user" value="${sessionScope.USER_INFO}"/>                  
                        <div class="col-xl-3 col-lg-3 col-6 header-control">
                            <div class="ul-control">
                                <c:if test="${empty user}">
                                    <div class="header-account d-lg-block d-none">
                                        <a href="/account" title="Tài khoản của bạn" rel="nofollow">
                                            <img src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/account.png?1708512217480"
                                                 alt="Lofi Furniture" width="25" height="25" class="icon">
                                            <span class="info">Tài khoản</span>
                                        </a>
                                        <div class="drop-account">
                                            <a href="loginPage">Đăng nhập</a>
                                            <a href="registerPage">Đăng ký</a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty user}">
                                    <div class="header-account d-lg-block d-none">
                                        <a href="#" title="Tài khoản của bạn" rel="nofollow">
                                            <img src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/account.png?1708512217480"
                                                 alt="Lofi Furniture" width="25" height="25" class="icon">
                                            <span class="info">${user.given_name}</span>
                                        </a>
                                        <div class="drop-account">                                          
                                            <a href="accountInfo">Tài khoản</a>
                                            <c:if test="${user.role == 2}">
                                                <li><a href="adminPage">Quản lý</a></li>
                                            </c:if>
                                            <a href="logOut">Đăng xuất</a>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="header-wish">
                                    <a href="/san-pham-yeu-thich" class="wishlist_header" title="Sản phẩm yêu thích">
                                        <span class="headerWishlistCount count-item">0</span>
                                        <img src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/wish-icon.png?1708512217480"
                                             alt="Lofi Furniture" width="25" height="25" class="icon">
                                        <span class="info">Yêu thích</span>
                                    </a>
                                </div>

                                <div class="header-cart block-cart">
                                    <a href="cart" aria-label="Giỏ hàng" title="Giỏ hàng">
                                        <span class="count_item_pr count-item">0</span>
                                        <img src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/shopping-cart.png?1708512217480"
                                             alt="Lofi Furniture" width="25" height="25" class="icon">
                                        <span class="info">Giỏ hàng</span>
                                    </a>                                   
                                </div>                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <div class="header-menu">
                        <div class="header-menu-des">
                            <nav class="header-nav">
                                <div class="user-menu d-lg-none">                                                                     
                                </div>
                                <ul class="item_big">
                                    <li class="nav-item active ">
                                        <a class="a-img" href="home" title="Trang chủ">
                                            Trang chủ
                                        </a>
                                    </li>

                                    <li class="nav-item ">
                                        <a class="a-img" href="introducePage" title="Giới thiệu">
                                            Giới thiệu
                                        </a>
                                    </li>
                                    <li class="nav-item   has-mega">
                                        <a class="a-img" href="products" title="Sản phẩm">
                                            Sản phẩm
                                        </a>

                                    </li>

                                    <li class="nav-item">
                                        <a class="a-img" href="/tin-tuc" title="Tin tức">
                                            Tin tức
                                        </a>
                                    </li>

                                    <li class="nav-item ">
                                        <a class="a-img" href="contactPage" title="Liên hệ">
                                            Liên hệ
                                        </a>
                                    </li>                                                        
                                </ul>
                            </nav>                           
                            <div class="flash-scroll">
                                <a href="javascript:;" data-href=".section_flash_sale" class="scroll-down">
                                    <img width="12"
                                         src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/menu_icon_3.png?1708512217480"
                                         alt="Lofi Furniture"> Hot Sale
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
