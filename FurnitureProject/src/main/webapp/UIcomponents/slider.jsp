<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/jquery.js?1708512217480" type="text/javascript"></script>
	<script src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/swiper.js?1708512217480" type="text/javascript"></script>
        <script src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/lazy.js?1708512217480" type="text/javascript"></script>
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/swiper.css">
    </head>
    <body>
        <section class="section_slider">
            <div class="home-slider swiper-container gallery-top">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="clearfix" title="Slider 1">
                            <picture>
                                <source 
                                    media="(min-width: 1200px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_1.jpg?1708512217480">
                                <source 
                                    media="(min-width: 992px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_1.jpg?1708512217480">
                                <source 
                                    media="(min-width: 569px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_1.jpg?1708512217480">
                                <source 
                                    media="(max-width: 567px)"
                                    srcset="//bizweb.dktcdn.net/thumb/large/100/499/932/themes/926650/assets/slider_1.jpg?1708512217480">
                                <img width="1920" height="850" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/lazy.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_1.jpg?1708512217480" alt="Slider 1" class="img-responsive lazyload" />
                            </picture>
                        </div>
                        <div class="slider-text d-none d-md-block">
                            <div class="container">
                                <div class="slider-content">
                                    <h2 class="title">Đương đại cổ điển</h2>
                                    <div class="desc">Những vật liệu tốt nhất kết hợp với kỹ năng sản xuất truyền thống tạo nên vẻ ngoài hoàn hảo</div>
                                    <a class="button clearfix" href="products" title="Mua ngay">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="clearfix" title="Slider 2">
                            <picture>
                                <source 
                                    media="(min-width: 1200px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_2.jpg?1708512217480">
                                <source 
                                    media="(min-width: 992px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_2.jpg?1708512217480">
                                <source 
                                    media="(min-width: 569px)"
                                    srcset="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_2.jpg?1708512217480">
                                <source 
                                    media="(max-width: 567px)"
                                    srcset="//bizweb.dktcdn.net/thumb/large/100/499/932/themes/926650/assets/slider_2.jpg?1708512217480">
                                <img width="1920" height="850" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/lazy.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/slider_2.jpg?1708512217480" alt="Slider 2" class="img-responsive lazyload" />
                            </picture>
                        </div>
                        <div class="slider-text d-none d-md-block">
                            <div class="container">
                                <div class="slider-content">
                                    <h2 class="title">Thiết kế tinh tế</h2>
                                    <div class="desc">Đi đầu trong thiết kế phòng tắm sang trọng</div>
                                    <a class="button clearfix" href="products" title="Mua ngay">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
        <script>
            var swiper = new Swiper('.home-slider', {
                loop: true,
                autoplay: {
                    delay: 5000,
                },
                speed: 2600,
                effect: 'fade',
                pagination: {
                    el: '.home-slider .swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.home-slider .swiper-button-next',
                    prevEl: '.home-slider .swiper-button-prev',
                },
            });
        </script>
    </body>
</html>
