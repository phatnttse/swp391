<%-- 
    Document   : header
    Created on : Dec 14, 2023, 6:18:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="stylesheet" href="assets/css/headerStyle.css">      
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">                      
            <div class="col-lg-3 col-12">
                <a href="home" class="logo" >
                    <img class="img-responsive" src="assets/img/logo.webp" alt="Logo">
                </a>
            </div>

            <div class="col-lg-6 col-12 header-menu">

                <ul class="item-big">
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="products">Sản phẩm</a></li>
                    <li><a href="#">Hệ thống</a></li>
                    <li><a href="#">Tin tức</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>                                
            </div>

            <c:set var="user" value="${sessionScope.USER_INFO}"/>
            <div class="col-lg-3 col-12 header-menu">

                <ul class="ul-control">
                    <li>     
                        <button type="submit" value="" name="" class="js-search-product ti-search" onclick="showSearchTool()"></button>
                    </li>
                    <c:if test="${empty user}">
                        <li>
                            <a href="#" class="ti-user"></a>

                            <div class="menu-user">
                                <ul>
                                    <li><a href="registerPage">Đăng ký</a></li>                     
                                    <li><a href="loginPage">Đăng nhập</a></li>
                                </ul>
                            </div>

                        </li>
                    </c:if>
                    <c:if test="${not empty user}">
                        <li>                           
                            <c:if test="${sessionScope.LOGIN_WITH_GOOGLE == null}">
                                <img width="50px" style="border-radius: 50%" src="assets/img/users/${user.picture}">
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_WITH_GOOGLE != null}">
                                <img width="50px" style="border-radius: 50%" src="${user.picture}"> 
                            </c:if>  
                            <div class="menu-user">
                                <ul>
                                    <li>
                                        <p style="font-weight: 600">Xin chào, ${user.name}</p>
                                    </li>
                                    <c:if test="${user.role == 1 or user.role == 0}">
                                        <li><a href="accountInfo">Tài khoản</a></li>
                                            <c:if test="${user.role == 1}">
                                            <li><a href="adminPage">Quản lý</a></li>
                                            </c:if>
                                        <li><a href="logOut">Đăng xuất</a></li>
                                        </c:if>
                                </ul>                            
                            </div>                               
                        </c:if>
                    </li>

                    <li>
                        <a href="#" class="ti-heart"></a>
                    </li>
                    
                    <li>
                        <a href="cartPage" class="ti-shopping-cart-full"></a>
                    </li>
                </ul>
            </div>             
        </div>
            
            
        <div class="modal">
            <form action="searchProducts" method="GET">
                <div class="modal-container js-modal-container">
                    <div class="modal-close js-modal-close">
                        <i class="ti-close"></i>
                    </div>

                    <header class="modal-header">
                        <h4>Thanh tìm kiếm</h4>
                    </header>

                    <div class="modal-body">
                        <input type="text" name="searchvalue" value="${param.searchvalue}" placeholder="Nhập tên sản phẩm">

                    </div>
                    <div class="modal-btn">
                        <button type="submit" class="ti-search"></button>
                    </div>

                </div>
            </form>
        </div>

       
        <script>
            const searchProducts = document.querySelector('.js-search-product');
            const modal = document.querySelector('.modal');
            const modalClose = document.querySelector('.js-modal-close');
            function showSearchTool() {
                modal.classList.add('open');
                event.preventDefault();
            }
            function hideSearchTool() {
                modal.classList.remove('open');
            }

            searchProducts.addEventListener('click', showSearchTool);
            modalClose.addEventListener('click', hideSearchTool);
        </script>
        
    </body>
</html>


