<%-- 
    Document   : searchProducts
    Created on : Dec 29, 2023, 10:00:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="stylesheet" type="text/css" href="assets/css/searchProductsStyle.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadCrumb.jsp" %> 
        <c:set var="searchList" value="${requestScope.SEARCH_RESULT}"/>
        <div class="bodywrap">
            <section class="signup search-main wrap_background background_white clearfix">
                <div class="container">
                    <div class="category-products">
                        <div class="products-view-grid">
                            <div class="row row-fix">
                                <div class="col-12 col-fix">
                                    <h1 class="title-page">
                                        <span>
                                            Có
                                            <c:if test="${requestScope.FOUND_RESULT == null}" >
                                                0
                                            </c:if>                                            
                                          ${requestScope.FOUND_RESULT} kết quả tìm kiếm phù hợp
                                        </span>
                                    </h1>
                                </div>                               
                                    <c:forEach var="product" items="${searchList}">
                                        <div class="col-lg-3 col-fix">                                 
                                            <form action="" method="" class="variants product-action">
                                                <div class="product-thumbnail">
                                                    <a class="image_thumb">
                                                        <img width="520" height="520" class="lazyload loaded" src="${product.thumbnail}">
                                                    </a>
                                                    <div class="smart">
                                                        <span>-${product.discount}</span>
                                                    </div>

                                                    <a class="btn-wishlist">
                                                        <i class="ti-search"></i>
                                                    </a>                                                 
                                                </div> 

                                                <div class="product-info">

                                                    <h5 class="product-name">
                                                        <a class="line-clamp line-clamp-2" href="" >
                                                            ${product.title}
                                                        </a>
                                                    </h5>

                                                    <div class="price-box">
                                                        ${product.price}
                                                        <span class="compare-price">170.000₫</span>
                                                    </div>
                                                    <div class="btn-shopping">
                                                        <button type="submit" title="Thêm vào giỏ hàng" class="ti-shopping-cart"></button>
                                                    </div>
                                                </div>
                                            </form>                                   
                                        </div>
                                    </c:forEach>                                                            
                            </div>
                        </div>

                    </div>
                </div>

            </section>
        </div>
        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>
