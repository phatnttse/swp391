<%-- 
    Document   : hotcategory
    Created on : Feb 23, 2024, 10:58:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <link rel="stylesheet" href="assets/css/hotcategory.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Hot Categories Section -->
  <div class="hot-category-container">
    <h2 class="category-title">Danh mục nổi bật</h2>
    <!-- Swiper -->
    <div class="swiper-container hotcategorySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href="your-category-link-1.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/bon-cau.jpg?v=1699504384923" />
            <div class="card-details">
              <button class="category-button">
                  <h3 class="button-title">Bồn cầu</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="your-category-link-2.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/bon-tam.jpg?v=1699504371993" />
            <div class="card-details">
              <button class="category-button">
                <h3 class="button-title">Bồn tắm</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="your-category-link-3.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/chau-lavabo.jpg?v=1699504446760" />
            <div class="card-details">
              <button class="category-button">
                <h3 class="button-title">Tủ Chậu Lavabo</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="your-category-link-4.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/guong.jpg?v=1699504456387" />
            <div class="card-details">
              <button class="category-button">
                <h3 class="button-title">Gương</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="your-category-link-5.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/sen-tam.jpg?v=1699504399643" />
            <div class="card-details">
              <button class="category-button">
                <h3 class="button-title">Sen Tắm</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="your-category-link-6.html">
            <img src="https://bizweb.dktcdn.net/thumb/large/100/499/932/collections/voi-lavabo.jpg?v=1699504435520" />
            <div class="card-details">
              <button class="category-button">
                <h3 class="button-title">Vòi Lavabo</h3>
                <span class="product-count">6 sản phẩm</span>
              </button>
            </div>
          </a>
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <!-- Initialize Swiper -->
  <script src="assets/js/hotcategory2.js"></script>
    </body>
</html>
