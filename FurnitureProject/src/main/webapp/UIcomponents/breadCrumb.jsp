<%-- 
    Document   : breadcrumb
    Created on : Dec 27, 2023, 6:30:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/breadcrumb.css"/>       
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
    </head>
    <body>
        <c:set var="uri" value="${pageContext.request.requestURI}" />
        <c:set var="registerURI" value="/FurnitureProject/views/register.jsp"/>
        <c:set var="loginURI" value="/FurnitureProject/views/login.jsp"/>
        <c:set var="productsURI" value="/FurnitureProject/views/products.jsp"/>
        <c:set var="accountInfoURI" value="/FurnitureProject/views/accountInfo.jsp"/>
        <c:set var="searchProductsURI" value="/FurnitureProject/views/searchProducts.jsp"/>

        <div class="bread-crumb" style="background: url(assets/img/breadcrumb.webp) center no-repeat;">
            <div class="breadcrumb-body">

                <c:if test="${uri eq registerURI}">
                    <div class="title-bread-crumb">Đăng ký tài khoản</div>
                    <ul class="breadcrumb-des">
                        <li class="home">
                            <a href="home">
                                <span>Trang chủ</span>                      
                            </a>
                            <i class="ti-angle-right"></i>
                        </li>
                        <li>
                            <strong>
                                <span>Đăng ký tài khoản</span>
                            </strong>
                        </li>
                    </ul>                  
                </c:if>

                <c:if test="${uri eq loginURI}">
                    <div class="title-bread-crumb">Đăng nhập tài khoản</div>
                    <ul class="breadcrumb-des">
                        <li class="home">
                            <a href="home">
                                <span>Trang chủ</span>                      
                            </a>
                            <i class="ti-angle-right"></i>
                        </li>
                        <li>
                            <strong>
                                <span>Đăng nhập tài khoản</span>
                            </strong>
                        </li>
                    </ul>
                </c:if>

                <c:if test="${uri eq productsURI}">
                    <div class="title-bread-crumb">Tất cả sản phẩm</div>
                    <ul class="breadcrumb-des">
                        <li class="home">
                            <a href="home">
                                <span>Trang chủ</span>                      
                            </a>
                            <i class="ti-angle-right"></i>
                        </li>
                        <li>
                            <strong>
                                <span>Tất cả sản phẩm</span>
                            </strong>
                        </li>
                    </ul>
                </c:if>

                <c:if test="${uri eq accountInfoURI}">
                    <div class="title-bread-crumb">Thông tin tài khoản</div>
                    <ul class="breadcrumb-des">
                        <li class="home">
                            <a href="home">
                                <span>Trang chủ</span>                      
                            </a>
                            <i class="ti-angle-right"></i>
                        </li>
                        <li>
                            <strong>
                                <span>Thông tin tài khoản</span>
                            </strong>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${uri eq searchProductsURI}">
                    <div class="title-bread-crumb">Tìm kiếm sản phẩm</div>
                    <ul class="breadcrumb-des">
                        <li class="home">
                            <a href="home">
                                <span>Trang chủ</span>                      
                            </a>
                            <i class="ti-angle-right"></i>
                        </li>
                        <li>
                            <strong>
                                <span>Tìm kiếm sản phẩm</span>
                            </strong>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>
    </body>
</html>
