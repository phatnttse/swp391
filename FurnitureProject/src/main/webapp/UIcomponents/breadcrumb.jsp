<%-- 
    Document   : test
    Created on : Feb 23, 2024, 10:22:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/breadCrumb.css">    
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="uri" value="${pageContext.request.requestURI}" />
        <c:set var="registerURI" value="/FurnitureProject/views/register.jsp"/>
        <c:set var="loginURI" value="/FurnitureProject/views/login.jsp"/>
        <c:set var="productsURI" value="/FurnitureProject/views/products.jsp"/>
        <c:set var="accountInfoURI" value="/FurnitureProject/views/accountInfo.jsp"/>
        <c:set var="searchProductsURI" value="/FurnitureProject/views/searchProducts.jsp"/>
        <c:set var="introduceURI" value="/FurnitureProject/views/introduce.jsp"/>
        <c:set var="contactURI" value="/FurnitureProject/views/contact.jsp"/>
        <c:set var="cartURI" value="/FurnitureProject/views/cart.jsp"/>
        <c:set var="orderURI" value="/FurnitureProject/views/order.jsp"/>
        <c:set var="productDetailURI" value="/FurnitureProject/views/productdetail.jsp"/>
        <c:set var="orderDetailURI" value="/FurnitureProject/views/orderdetail.jsp"/>
        <c:set var="editProfileURI" value="/FurnitureProject/views/editProfile.jsp"/>
        <c:set var="changePasswordURI" value="/FurnitureProject/views/changePassword.jsp"/>


        <section class="bread-crumb" style="background-image: url('//bizweb.dktcdn.net/100/499/932/themes/926650/assets/breadcrumb-bg.jpg?1708512217480')"> 
            <c:if test="${uri eq loginURI}">
                <div class="title-breadcrumb">Đăng nhập tài khoản
                </div>
            </c:if>
            <c:if test="${uri eq accountInfoURI}">
                <div class="title-breadcrumb">Thông tin tài khoản
                </div>
            </c:if>
            <c:if test="${uri eq registerURI}">
                <div class="title-breadcrumb">Đăng ký tài khoản
                </div>                                              
            </c:if>
            <c:if test="${uri eq productsURI}">
                <div class="title-breadcrumb">Sản phẩm
                </div>                                 
            </c:if>
            <c:if test="${uri eq searchProductsURI}">
                <div class="title-breadcrumb">Tìm kiếm sản phẩm
                </div>                        
            </c:if>
            <c:if test="${uri eq introduceURI}">
                <div class="title-breadcrumb">Giới thiệu
                </div>                  
            </c:if>
            <c:if test="${uri eq cartURI}">
                <div class="title-breadcrumb">Giỏ Hàng
                </div>                  
            </c:if>
            <c:if test="${uri eq contactURI}">
                <div class="title-breadcrumb">Liên Hệ
                </div>                  
            </c:if>
            <c:if test="${uri eq orderURI}">
                <div class="title-breadcrumb">Đơn Hàng
                </div>                  
            </c:if>
            <c:if test="${uri eq productDetailURI}">
                <div class="title-breadcrumb">Chi tiết sản phẩm
                </div>                  
            </c:if>
            <c:if test="${uri eq orderDetailURI}">
                <div class="title-breadcrumb">Chi tiết đơn hàng
                </div>                  
            </c:if>
            <c:if test="${uri eq editProfileURI}">
                <div class="title-breadcrumb">Chỉnh sửa hồ sơ
                </div>                  
            </c:if>
             <c:if test="${uri eq changePasswordURI}">
                <div class="title-breadcrumb">Đổi mật khẩu
                </div>                  
            </c:if>

            <ul class="breadcrumb">
                <li class="home">
                    <a href="home">
                        <span>Trang chủ</span>
                    </a>
                    <span class="mr_lr">
                        &nbsp;
                        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="svg-inline--fa fa-chevron-right fa-w-10">
                        <path fill="currentColor" d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z" class=""></path>
                        </svg>
                        &nbsp;
                    </span>
                </li>
                <li>
                    <c:if test="${uri eq accountInfoURI}">
                        <strong>
                            <span>Thông tin tài khoản</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq registerURI}">                                               
                        <strong>
                            <span>Đăng ký tài khoản</span>
                        </strong>                            
                    </c:if>
                    <c:if test="${uri eq productsURI}">                          
                        <strong>
                            <span>Sản phẩm</span>
                        </strong>
                    </c:if>

                    <c:if test="${uri eq loginURI}">
                        <strong>
                            <span>Đăng nhập tài khoản</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq searchProductsURI}">              
                        <strong>
                            <span>Tìm kiếm sản phẩm</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq introduceURI}">                               
                        <strong>
                            <span>Giới thiệu</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq cartURI}">                               
                        <strong>
                            <span>Giỏ Hàng</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq contactURI}">                               
                        <strong>
                            <span>Liên Hệ</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq orderURI}">                               
                        <strong>
                            <span>Đơn Hàng</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq productDetailURI}">                               
                        <strong>
                            <span>Chi Tiết Sản Phẩm</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq orderDetailURI}">                               
                        <strong>
                            <span>Chi Tiết Đơn Hàng</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq editProfileURI}">                               
                        <strong>
                            <span>Chỉnh sửa hồ sơ</span>
                        </strong>
                    </c:if>
                    <c:if test="${uri eq changePasswordURI}">                               
                        <strong>
                            <span>Đổi mật khẩu</span>
                        </strong>
                    </c:if>

                </li>
            </ul>

        </section>





    </body>
</html>
