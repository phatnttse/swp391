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
        <link rel="stylesheet" href="assets/css/hotcategorynew.css">
        <title>JSP Page</title>
    </head>
    <body>
<!--    <c:set var="listAllCategory" value="${requestScope.CATEGORY_ALL}"/>-->
    <c:set var="countProductByCategory" value="${requestScope.COUNT_PRODUCT}"/>
    <div class="section_collection">
        <div class="container">
            <div class="block-title">
                <h2>Danh mục nổi bật</h2>
            </div>
            <div class="block-content">
                <div class="collection-swiper swiper-container">
                    <div class="swiper-wrapper">
                        <c:if test="${not empty countProductByCategory}">
                            <c:forEach var="category" items="${countProductByCategory}" varStatus="loopStatus">
                                <div class="swiper-slide">
                                    <div class="item">
                                        <div class="image">
                                            <a href="product-category?categoryId=${category.categoryId}" title="${category.name}"><img class="lazyload" width="300" height="300" src="/FurnitureProject/thumbnails/categories/${category.thumbnail}" alt="${category.name}"/></a>
                                        </div>
                                        <div class="info">
                                            <h3>
                                                <a href="product-category?categoryId=${category.categoryId}" title="${category.name}">
                                                    ${category.name}
                                                    <span class="icon-wrap">
                                                        <svg viewBox="0 0 14 10" fill="none" aria-hidden="true" focusable="false" role="presentation" class="icon icon-arrow" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.537.808a.5.5 0 01.817-.162l4 4a.5.5 0 010 .708l-4 4a.5.5 0 11-.708-.708L11.793 5.5H1a.5.5 0 010-1h10.793L8.646 1.354a.5.5 0 01-.109-.546z" fill="currentColor"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="count">${category.countProduct} sản phẩm</span>
                                                </a>
                                            </h3>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="assets/js/hotecategorynew.js"></script>

</body>
</html>