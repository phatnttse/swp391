<%-- 
    Document   : productDetail
    Created on : Feb 28, 2024, 11:35:51 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/FurnitureProject/assets/css/productdetail.css" />

        <link rel="stylesheet" href="assets/css/swiper.css" />
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/bootstrap-4-3-min.css?1708512217480"/>
        <link rel="stylesheet" type="text/css" href="/FurnitureProject/assets/css/popupProduct.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
        <title>Chi tiết sản phẩm</title>

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
            .form-group textarea {
                width: 100%;
                margin-bottom: 15px;
                outline: none;
                font-size: 14px;
                padding: 5px 20px;
                border: 1px solid #e6e6e6
            }
            .button_45 {
                height: 40px;
                line-height: 38px;
                padding: 0 25px;
                background: #d94e28;
                font-size: 15px;
                font-weight: 500;
                color: #fff;
                border-radius: 6px;
                border: none;
                margin-top: 10px;
            }
            .title-form-coment {
                font-size: 18px;
                margin-top: 0;
                margin-bottom: 5px;
                padding-bottom: 15px;
                color: #000;
                font-weight: bold
            }

            #article-comments .article-comment {
                margin-bottom: 30px;
                padding-bottom: 20px;
                border-bottom: 1px dotted #c9c8c5
            }

            #article-comments .article-comment:last-child {
                padding-bottom: 30px
            }

            #article-comments .article-comment-user-image {
                margin: 0;
                float: left;
                width: 80px;
                margin-right: 12px;
                height: 80px;
                border-radius: 0;
                display: block
            }

            #article-comments .article-comment-user-comment {
                display: block;
                float: left;
                width: calc(100% - 95px);
                -webkit-width: calc(100% - 95px);
                -moz-width: calc(100% - 95px);
                -o-width: calc(100% - 95px);
                -os-width: calc(100% - 95px);
                padding-left: 10px;
                word-break: break-word;
                font-size: em(14px)
            }

            #article-comments .user-name-comment {
                margin: 0;
                font-size: 14px;
                line-height: 1;
                font-weight: 700
            }

            #article-comments .user-name-comment strong {
                font-weight: 700
            }

            #article-comments .article-comment-date-bull {
                padding: 5px 0;
                display: block;
                color: #b0b0b0;
                font-size: 12px
            }

            #article-comments .cm {
                font-size: 14px;
                color: #000
            }

            .star-rating {
                unicode-bidi: bidi-override;
                color: #c5c5c5;
                font-size: 25px;
                height: 25px;
                width: 125px;
                margin: 0 auto;
                position: relative;
                padding: 0;
                text-shadow: 0px 1px 0 #a2a2a2;
            }
            .star-rating span {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                overflow: hidden;
            }
            .star-rating span:before {
                content: "\2605\2605\2605\2605\2605";
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
            }
            .star-rating span.filled:before {
                color: #f5c518;
            }
            .star-rating span.half:before {
                color: #f5c518;
                width: 50%;
            }

        </style>
    </head>

    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <c:set var="product" value="${requestScope.product}"/>
        <div class="backdrop__body-backdrop___1rvky"></div>
        <section class="product layout-product">
            <c:if test="${not empty product}">

                <div class="container">
                    <div class="details-product">
                        <div class="product-info">
                            <div class="row">
                                <div class="product-detail-left product-images col-12 col-md-12 col-lg-5 col-xl-5 col-left">
                                    <div class="product-image-block relative">
                                        <div class="swiper-container gallery-top swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
                                            <div class="swiper-wrapper" id="lightgallery" style="
                                                 transition-duration: 0ms;
                                                 transform: translate3d(-1026px, 0px, 0px);">

                                                <a class="swiper-slide" href="${product.thumbnail}" title="Click để xem" style="width: 513px">                                                   
                                                    <img height="540" width="540" src="/FurnitureProject/thumbnails/products/${product.thumbnail}" alt="${product.title}"
                                                         class="img-responsive mx-auto d-block lazy"
                                                         />
                                                </a>

                                                <a
                                                    class="swiper-slide swiper-slide-prev"
                                                    data-hash="1"
                                                    href="${product.thumbnail}"
                                                    title="Click để xem"
                                                    style="width: 513px"
                                                    >
                                                    <img
                                                        height="540"
                                                        width="540"
                                                        src="/FurnitureProject/thumbnails/products/${product.thumbnail}"
                                                        alt="Tủ chậu lavabo phòng tắm kiêm máy giặt"                                                      
                                                        class="img-responsive mx-auto d-block lazy"
                                                        />
                                                </a>

                                                <a
                                                    class="swiper-slide swiper-slide-active"                                                  
                                                    href="${product.thumbnail}"
                                                    title="Click để xem"
                                                    style="width: 513px"
                                                    >
                                                    <img
                                                        height="540"
                                                        width="540"
                                                        src="/FurnitureProject/thumbnails/products/${product.thumbnail}"
                                                        alt="Tủ chậu lavabo phòng tắm kiêm máy giặt"
                                                        class="img-responsive mx-auto d-block lazy"
                                                        />
                                                </a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-12 col-md-12 col-lg-7 col-xl-7 col-right">
                                    <div class="details-pro">
                                        <div class="inventory_quantity">
                                            <span class="mb-break">
                                                <span class="title">Thương hiệu:</span>
                                                <span class="vendor">Lux Furniture</span>
                                            </span>
                                            <span class="line">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                                            <span class="mb-break stock-brand">
                                                <span class="title">Tình trạng:</span>

                                                <span class="a-stock"
                                                      ><span class="a-stock">Còn hàng</span></span
                                                >
                                            </span>


                                        </div>
                                                                             
                                         <div style="padding: 10px 0">
                                            <span class="title">Lượt mua: ${product.purchases}</span>
                                        </div>


                                        <h1 class="title-product">
                                            ${product.title}
                                        </h1>
                                        <form action="buyNow" method="get" class="form-inline">
                                            <div class="price-box clearfix">
                                                <span class="special-price">
                                                    <span class="price product-price">
                                                        <script>
                                                            var totalMoney = parseFloat('${product.discountProduct}');
                                                            var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                            document.write(formattedTotalMoney);
                                                        </script>
                                                    </span>
                                                </span>

                                            </div>

                                            <div class="form-product">

                                                <div class="select-swatch">

                                                    <div class="clearfix form-group">
                                                        <div class="flex-quantity">
                                                            <div class="custom custom-btn-number show">
                                                                <label class="sl section">Số lượng:</label>
                                                                <div class="input_number_product form-control">									
                                                                    <button class="btn_num num_1 button button_qty" onclick="var result = document.getElementById('qty');
                                                                            var qtypro = result.value;
                                                                            if (!isNaN(qtypro) && qtypro > 1)
                                                                                result.value--;
                                                                            return false;" type="button">-</button>
                                                                    <input type="text" id="qty" name="quantity" value="1" maxlength="3" class="form-control prd_quantity" onkeypress="if (isNaN(this.value + String.fromCharCode(event.keyCode)))
                                                                                return false;" onchange="if (this.value === '0')
                                                                                            this.value = '1';">
                                                                    <button class="btn_num num_2 button button_qty" onclick="var result = document.getElementById('qty');
                                                                            var qtypro = result.value;
                                                                            if (!isNaN(qtypro))
                                                                                result.value++;
                                                                            return false;" type="button">+</button>
                                                                </div>

                                                            </div>
                                                            <div class="btn-mua button_actions clearfix">
                                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                                <input type="hidden" name="title" value="${product.title}" />
                                                                <input type="hidden" name="price" value="${product.price}" />
                                                                <input type="hidden" name="thumbnail" value="${product.thumbnail}" />

                                                                <div class="group-button">
                                                                    <button type="button" onclick="addProductToCart(${product.productId}, '${product.title}', '${product.thumbnail}', ${product.discountProduct}, 1)" class="btn btn_base normal_button btn_add_cart add_to_cart btn-cart btn-soldout">Thêm vào giỏ hàng</button>
                                                                    <button type="submit" class="btn btn-lg btn-gray btn_buy btn-buyNow">Mua ngay</button>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="product-policises-wrapper">
                                                            <ul class="product-policises list-unstyled row">

                                                                <li class="media col-12">
                                                                    <div class="mr-3">
                                                                        <img width="32" height="32" class="lazyload loaded" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_1.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_1.png?1708512217480" alt="Miễn phí vận chuyển tại Hà Nội" data-was-processed="true">
                                                                    </div>
                                                                    <div class="media-body"> 
                                                                        Miễn phí vận chuyển tại Tp HCM
                                                                    </div>
                                                                </li>

                                                                <li class="media col-12">
                                                                    <div class="mr-3">
                                                                        <img width="32" height="32" class="lazyload loaded" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_2.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_2.png?1708512217480" alt="Bảo hành chính hãng toàn quốc" data-was-processed="true">
                                                                    </div>
                                                                    <div class="media-body"> 
                                                                        Bảo hành chính hãng toàn quốc
                                                                    </div>
                                                                </li>

                                                                <li class="media col-12">
                                                                    <div class="mr-3">
                                                                        <img width="32" height="32" class="lazyload loaded" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_3.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_3.png?1708512217480" alt="Cam kết chính hãng" data-was-processed="true">
                                                                    </div>
                                                                    <div class="media-body"> 
                                                                        Cam kết chính hãng
                                                                    </div>
                                                                </li>

                                                                <li class="media col-12">
                                                                    <div class="mr-3">
                                                                        <img width="32" height="32" class="lazyload loaded" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_4.png?1708512217480" data-src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/policises_4.png?1708512217480" alt="Đổi trả nếu sản phẩm lỗi" data-was-processed="true">
                                                                    </div>
                                                                    <div class="media-body"> 
                                                                        Đổi trả nếu sản phẩm lỗi
                                                                    </div>
                                                                </li>

                                                            </ul>
                                                        </div>
                                                        <div class="product-hotline">
                                                            <img class="img-full" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/hotline-product.png?1708512217480" alt="Lofi Furniture">
                                                            Hotline &amp; Zalo hỗ trợ 24/7: 
                                                            <a href="tel:19006750">19006750</a>
                                                            liên hệ để được tư vấn thêm
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                    </div>

                    <div id="article-comments">
                        <h5 class="title-form-coment margin-bottom-25">Mô tả</h5>

                        <div class="article-comment clearfix">


                            <div class="article-comment-user-comment">                             
                                <p class="cm">${product.description}</p>
                            </div>
                        </div> 

                    </div>
                </div>
            </c:if>


            <div class="container">
                <div class="productRelate">
                    <div class="block-title">
                        <h2>
                            <a href="" title="Sản phẩm cùng loại">Sản phẩm cùng loại</a>
                        </h2>
                    </div>
                    <c:set var="SameCategory" value="${requestScope.SAME_CATEGORY}"/>
                    <c:if test="${not empty SameCategory}">

                        <div class="margin-am">
                            <div class="product-relate-swiper swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events" style="cursor: grab">
                                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px)">
                                    <c:forEach var="productS" items="${SameCategory}">  
                                        <div class="swiper-slide swiper-slide-active" style="width: 300px; margin-right: 20px">                                   
                                            <div class="item_product_main">
                                                <form action="cart" method="post" class="variants product-action" enctype="multipart/form-data">
                                                    <div class="product-thumbnail">
                                                        <a class="image_thumb" title="Tủ chậu lavabo liền khối 2 tầng">                                                   
                                                            <img class="lazyload loaded" width="480" height="480"
                                                                 src="thumbnails/products/${productS.thumbnail}"
                                                                 alt="Tủ chậu lavabo liền khối 2 tầng"/>
                                                        </a>
                                                        <span class="smart">- 14% </span>

                                                        <div class="action">
                                                            <div class="actions-secondary">
                                                                <div class="actions-primary">
                                                                   <c:if test="${productS.quantity > 0}">
                                                                            <button type="button" onclick="addProductToCart(${productS.productId}, '${productS.title}', '${productS.thumbnail}', ${productS.discountProduct}, 1)" class="btn-cart add_to_cart " title="Thêm vào giỏ hàng">
                                                                                <span class="icon icon-cart">
                                                                                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{
                                                                                            fill:none;
                                                                                            stroke:#000;
                                                                                            stroke-linecap:round;
                                                                                            stroke-linejoin:round;
                                                                                            stroke-width:2px;
                                                                                        }</style></defs><title></title><g><polyline class="cls-1" points="15 31 5 31 6 9 26 9 26.14 12"></polyline><path class="cls-1" d="M11,12V6a5,5,0,0,1,5-5h0a5,5,0,0,1,5,5v6"></path><circle class="cls-1" cx="23" cy="23" r="8"></circle><line class="cls-1" x1="23" x2="23" y1="19" y2="27"></line><line class="cls-1" x1="27" x2="19" y1="23" y2="23"></line></g></svg>
                                                                                </span>
                                                                            </button>
                                                                        </c:if>

                                                                        <c:if test="${productS.quantity == 0}">
                                                                            <button class="btn-cart" title="Hết hàng" type="button" disabled="disabled">
                                                                                <span class="icon icon-outsock">
                                                                                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{
                                                                                            fill:none;
                                                                                            stroke:#000;
                                                                                            stroke-linecap:round;
                                                                                            stroke-linejoin:round;
                                                                                            stroke-width:2px;
                                                                                        }</style></defs><title></title><g><polyline class="cls-1" points="15 31 5 31 6 9 26 9 26.14 12"></polyline><path class="cls-1" d="M11,12V6a5,5,0,0,1,5-5h0a5,5,0,0,1,5,5v6"></path><circle class="cls-1" cx="23" cy="23" r="8"></circle><line class="cls-1" x1="27" x2="19" y1="23" y2="23"></line></g></svg>
                                                                                </span>
                                                                            </button>
                                                                        </c:if>
                                                                </div>
                                                                <button type="button" title="Xem nhanh" onclick="viewFastProduct(${product.productId})"  class="quick-view btn-views">
                                                                    <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"></path></svg>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-info">
                                                        <h3 class="product-name">
                                                            <a href="" title="${productS.title}">${productS.title}</a>                                                       
                                                        </h3>
                                                        <div class="price-box">
                                                            <span class="price">
                                                                <script>
                                                                    var totalMoney = parseInt('${productS.discountProduct}');
                                                                    var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                                    document.write(formattedTotalMoney);
                                                                </script>
                                                            </span>
                                                            <span class="compare-price">${productS.formattedPrice}₫</span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>                               
                            </div>
                        </div>

                    </div>
                </div>
            </c:if>

        </section>
        <div id="popup-cart-desktop" class="popup-cart"></div>
        <div id="quick-view-product" class="quickview-product" style="display: none;"></div>
        <%@include file="../UIcomponents/footer.jsp" %>
        <script src="assets/js/ajaxfunctions.js"></script>
    </body>
</html>
