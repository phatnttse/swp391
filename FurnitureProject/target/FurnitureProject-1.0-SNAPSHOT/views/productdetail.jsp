<%-- 
    Document   : productDetail
    Created on : Feb 28, 2024, 11:35:51 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="assets/css/productdetail.css" />
        <script src="assets/js/productdetail.js"></script>
        <link rel="stylesheet" href="assets/css/swiper.css" />
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/bootstrap-4-3-min.css?1708512217480"/>          
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/bootstrap-4-3-min.css?1708512217480"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <title>ProductDetail</title>
    </head>

    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>
        <c:set var="product" value="${requestScope.product}"/>
        <c:if test="${not empty product}">
            <section class="product layout-product">
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
                                                    <img height="540" width="540" src="${product.thumbnail}" alt="Tủ chậu lavabo phòng tắm kiêm máy giặt"
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
                                                        src="${product.thumbnail}"
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
                                                        src="${product.thumbnail}"
                                                        alt="Tủ chậu lavabo phòng tắm kiêm máy giặt"
                                                        class="img-responsive mx-auto d-block lazy"
                                                        />
                                                </a>
                                            </div>

                                        </div>
                                        <div
                                            class="swiper-container gallery-thumbs swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events swiper-container-free-mode swiper-container-thumbs"
                                            >
                                            <div
                                                class="swiper-wrapper"
                                                style="transition-duration: 0ms"
                                                >
                                                <div
                                                    class="swiper-slide swiper-slide-visible swiper-slide-active"
                                                    data-hash="0"
                                                    style="width: 120.75px; margin-right: 10px"
                                                    >
                                                    <div class="p-100">
                                                        <img
                                                            src="${product.thumbnail}"
                                                            alt="Tủ chậu lavabo phòng tắm kiêm máy giặt"
                                                            class="lazy"
                                                            />
                                                    </div>
                                                </div>

                                                <div
                                                    class="swiper-slide swiper-slide-visible swiper-slide-next"
                                                    data-hash="1"
                                                    style="width: 120.75px; margin-right: 10px"
                                                    >
                                                    <div class="p-100">
                                                        <img src="${product.thumbnail}" alt="${product.title}" class="lazy"/>
                                                    </div>
                                                </div>

                                                <div
                                                    class="swiper-slide swiper-slide-visible swiper-slide-thumb-active"
                                                    data-hash="2"
                                                    style="width: 120.75px; margin-right: 10px"
                                                    >
                                                    <div class="p-100">
                                                        <img src="${product.thumbnail}" alt="Tủ chậu lavabo phòng tắm kiêm máy giặt" class="lazy"/>
                                                    </div>
                                                </div>
                                            </div>                                        
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-12 col-lg-7 col-xl-7 col-right">
                                    <div class="details-pro">
                                        <div class="inventory_quantity">
                                            <span class="mb-break">
                                                <span class="title">Thương hiệu:</span>
                                                <span class="vendor">Lofi Furniture</span>
                                            </span>
                                            <span class="line">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                                            <span class="mb-break stock-brand">
                                                <span class="title">Tình trạng:</span>

                                                <span class="a-stock"
                                                      ><span class="a-stock">Còn hàng</span></span
                                                >
                                            </span>
                                        </div>

                                        <h1 class="title-product">
                                            ${product.title}
                                        </h1>
                                        <form
                                            enctype="multipart/form-data" action="cart" method="post"
                                            class="form-inline"
                                            >
                                            <div class="price-box clearfix">
                                                <span class="special-price">
                                                    <span class="price product-price">
                                                        <script>
                                                            var totalMoney = parseFloat('${product.discountProduct}');
                                                            var formattedTotalMoney = totalMoney.toLocaleString('vi-VN') + '₫';
                                                            document.write(formattedTotalMoney);
                                                        </script>
                                                    </span>
                                                    <meta itemprop="price" content="13500000" />
                                                    <meta itemprop="priceCurrency" content="VND" />
                                                </span>

                                            </div>

                                            <div class="form-product">

                                                <div class="select-swatch">


                                                    <div id="variant-swatch-0" class="swatch clearfix" data-option="option1" data-option-index="0">
                                                        <div class="header">Kích thước:</div>
                                                        <div class="select-swap">  


                                                            <div data-value="120cm" class="n-sd swatch-element 120cm ">
                                                                <input class="variant-0" id="swatch-0-120cm" type="radio" name="option1" value="120cm" checked="">

                                                                <label for="swatch-0-120cm">
                                                                    120cm
                                                                    <img class="crossed-out" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/soldout.png?1708512217480" alt="120cm">
                                                                </label>

                                                            </div>


                                                            <div data-value="150cm" class="n-sd swatch-element 150cm ">
                                                                <input class="variant-0" id="swatch-0-150cm" type="radio" name="option1" value="150cm">
                                                                <label for="swatch-0-150cm">
                                                                    150cm
                                                                    <img class="crossed-out" src="//bizweb.dktcdn.net/100/499/932/themes/926650/assets/soldout.png?1708512217480" alt="150cm">
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="box-variant clearfix  d-none ">

                                                    <div class="selector-wrapper" style="text-align: left; margin-bottom: 15px;"><label>Kích thước</label><select class="single-option-selector" data-option="option1" id="product-selectors-option-0"><option value="120cm">120cm</option><option value="150cm">150cm</option></select></div><select id="product-selectors" class="form-control form-control-lg" name="variantId" style="display:none">

                                                        <option selected="selected" value="102854783">120cm - 13.500.000₫</option>

                                                        <option value="102879850">150cm - 13.500.000₫</option>

                                                    </select>

                                                </div>


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

                                                            <div class="group-button">
                                                                <button type="submit" class="btn btn_base normal_button btn_add_cart add_to_cart btn-cart btn-soldout">Thêm vào giỏ hàng</button>
                                                                <button type="button" class="btn btn-lg btn-gray btn_buy btn-buyNow">Mua ngay</button>
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
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                   
                </div>

                <div class="container">
                    <div class="productRelate">
                        <div class="block-title">
                            <h2>
                                <a href="" title="Sản phẩm cùng loại">Sản phẩm cùng loại</a>
                            </h2>
                        </div>

                        <div class="margin-am">
                            <div class="product-relate-swiper swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events" style="cursor: grab">
                                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px)">
                                    <div class="swiper-slide swiper-slide-active" style="width: 300px; margin-right: 20px">                                   
                                        <div class="item_product_main">
                                            <form action="cart" method="post" class="variants product-action" enctype="multipart/form-data">
                                                <div class="product-thumbnail">
                                                    <a class="image_thumb" title="Tủ chậu lavabo liền khối 2 tầng">                                                   
                                                        <img class="lazyload loaded" width="480" height="480"
                                                             src="//bizweb.dktcdn.net/thumb/large/100/499/932/products/o1cn01oi3pdg1dnadhusego-2215652100261-0-cib.jpg?v=1700061650540"
                                                             alt="Tủ chậu lavabo liền khối 2 tầng"/>
                                                    </a>
                                                    <span class="smart">- 14% </span>
                                                    <a href="" class="btn-compare js-btn-wishlist setWishlist btn-views" title="Thêm vào yêu thích">
                                                        <svg width="24" height="24" bxmlns="http://www.w3.org/2000/svg">                                                      
                                                        <path
                                                            d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"
                                                            ></path>
                                                        </svg>
                                                    </a>

                                                    <div class="action">
                                                        <div class="actions-secondary">
                                                            <div class="actions-primary">
                                                                <button class="btn-cart" title="Hết hàng" type="button" disabled="disabled">                                                                   
                                                                    <span class="icon icon-outsock">
                                                                        <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">                                                                          
                                                                        <defs>
                                                                        <style>
                                                                            .cls-1 {
                                                                                fill: none;
                                                                                stroke: #000;
                                                                                stroke-linecap: round;
                                                                                stroke-linejoin: round;
                                                                                stroke-width: 2px;
                                                                            }
                                                                        </style>
                                                                        </defs>
                                                                        <g>
                                                                        <polyline class="cls-1" points="15 31 5 31 6 9 26 9 26.14 12"></polyline>
                                                                        <path class="cls-1"d="M11,12V6a5,5,0,0,1,5-5h0a5,5,0,0,1,5,5v6"></path>
                                                                        <circle class="cls-1"cx="23"cy="23"r="8"></circle>
                                                                        <line  class="cls-1" x1="27" x2="19" y1="23" y2="23"></line>
                                                                        </g>
                                                                        </svg>
                                                                    </span>
                                                                </button>
                                                            </div>
                                                            <a title="Xem nhanh" class="quick-view btn-views">
                                                                <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"
                                                                    ></path>
                                                                </svg>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-name">
                                                        <a href="" title="Tủ chậu lavabo liền khối 2 tầng">Tủ chậu lavabo liền khối 2 tầng</a>                                                       
                                                    </h3>
                                                    <div class="price-box">
                                                        <span class="price">5.590.000₫</span>
                                                        <span class="compare-price">6.500.000₫</span>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-prev swiper-button-disabled"></div>
                                <div class="swiper-button-next swiper-button-disabled"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <%@include file="../UIcomponents/footer.jsp" %>
    </body>
</html>
