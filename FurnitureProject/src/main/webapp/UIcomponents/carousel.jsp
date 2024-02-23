<%-- 
    Document   : carousel
    Created on : Feb 22, 2024, 9:13:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/carousel2.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Owl Carousel -->
        <div class="owl-carousel">
            <!-- Slide 1 -->
            <div class="item">
                <div class="slide-content-wrapper">
                    <div class="slide-content">
                        <h1>Đương đại cổ điển</h1>
                        <p>Những vật liệu tốt nhất kết hợp với kỹ năng sản xuất truyền thống tạo nên vẻ ngoài hoàn hảo.</p>
                        <a href="#" class="buy-now-btn">Mua Ngay</a>
                    </div>
                </div>
                <img src="assets/img/slider_1.webp" alt="" />
            </div>

            <!-- Slide 2 -->
            <div class="item">
                <div class="slide-content-wrapper">
                    <div class="slide-content">
                        <h1>Thiết kế tinh tế</h1>
                        <p>Đi đầu trong thiết kế phòng tắm sang trọng.</p>
                        <a href="#" class="buy-now-btn">Mua Ngay</a>
                    </div>
                </div>
                <img src="assets/img/slider_2.webp" alt="" />
            </div>

            <!-- Add more slides if needed -->
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="/FurnitureProject/assets/js/carousel2.js"></script>
    </body>
</html>
