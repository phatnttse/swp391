<%-- 
    Document   : home
    Created on : Dec 11, 2023, 5:37:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Furniture Project</title>
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
        <link rel="stylesheet" href="/FurnitureProject/assets/js/product.js" />
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <style>
            .backdrop__body-backdrop___1rvky {
                position: fixed;
                opacity: 0;
                width: 100%;
                left: 0;
                top: 0 !important;
                right: 0;
                bottom: 0;
                background-color: #363636;
                z-index: 9;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out
            }

            @media (max-width: 991px) {
                .backdrop__body-backdrop___1rvky {
                    z-index:9
                }
            }

            .backdrop__body-backdrop___1rvky.active {
                visibility: visible;
                opacity: 0.5
            }
        </style>

    </head>
    <body>      
        <div class="backdrop__body-backdrop___1rvky"></div>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/slider.jsp"%>
        <%@include file="../views/hotcategory.jsp"%>
       

        <c:set var="listProductByCategory" value="${requestScope.PRODUCTS_CATEGORY}"/>
        
        <%@include file="../views/productset.jsp"%>
        
        <%@include file="../views/productsHome.jsp"%>
        
         <%@include file="../views/abouthome.jsp"%>
        


         
        
        <div id="popup-cart-desktop" class="popup-cart"></div>


        <script>
            function loadProductsByCategory(categoryId) {
                $.ajax({
                    type: "POST",
                    url: "/FurnitureProject/category",
                    data: {categoryId: categoryId},
                    success: function (data) {
                        // Hiển thị dữ liệu HTML trực tiếp lên trang JSP
                        $("#product-list").html(data);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
            function addProductToCart(productId, title, thumbnail, price) {
                $.ajax({
                    url: "/FurnitureProject/addProductsToCart",
                    type: "post",
                    data: {
                        productId: productId,
                        title: title,
                        thumbnail: thumbnail,                     
                        price: price
                    },
                    success: function (response) {
                        // Kiểm tra phản hồi từ server
                        if (response.includes("Để thực hiện, bạn cần phải đăng nhập!")) {
                            // Nếu phản hồi chứa thông báo đăng nhập, chuyển hướng đến trang đăng nhập
                            window.location.href = "/FurnitureProject/loginPage";
                            showNotification("Để thực hiện, bạn cần phải đăng nhập!");
                        } else {
                            // Nếu không, hiển thị giỏ hàng
                            const content = document.getElementById("popup-cart-desktop");
                            content.innerHTML = response;
                            showCartModal();
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                    }
                });
            }
            function showNotification(message) {
                // Hiển thị thông báo cho người dùng, ví dụ: sử dụng alert hoặc thêm thông báo vào DOM
                alert(message);
            }

            function showCartModal() {
                const popupcart = document.querySelector('.popup-cart');
                const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');
              
                // Hiển thị giỏ hàng
                popupcart.classList.add('active');
                backdrop.classList.add('active');
                // Khởi tạo bộ lắng nghe sự kiện cho nút đóng giỏ hàng
                initializeCloseEvent();
            }

            function initializeCloseEvent() {
                const iconClose = document.querySelector('.js-popup-close');
                if (iconClose) {
                    iconClose.addEventListener('click', hideCartModal);
                }
            }

            function hideCartModal() {
                const popupcart = document.querySelector('.popup-cart');
                const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');
                popupcart.classList.remove('active');
                backdrop.classList.remove('active');
            }
        </script>

    </body>
</html>
<%@include file="../UIcomponents/footer.jsp" %>