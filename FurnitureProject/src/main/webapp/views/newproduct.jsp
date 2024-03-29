<%-- 
    Document   : newproduct
    Created on : Feb 26, 2024, 1:34:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/newproduct.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
            />

        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="../assets/js/newproduct.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <div class="section_product_new section_product">
            <div class="container">
                <div class="block-title">
                    <h2><a href="san-pham-moi" title="Sản phẩm mới">Sản phẩm mới</a></h2>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-12">
                        <div class="block-product relative">
                            <div class="product-new-swiper swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events swiper-container-multirow" style="cursor: grab;">
                                <div class="swiper-wrapper" style="width: 1920px; transform: translate3d(0px, 0px, 0px);">

                                    <div class="swiper-slide" style="margin-top: 20px; width: 300px; margin-right: 20px;">
                                        <div class="item_product_main">

                                            <form action="/cart/add" method="post" class="variants product-action " data-cart-form="" data-id="product-actions-33451953" enctype="multipart/form-data">
                                                <div class="product-thumbnail">
                                                    <a class="image_thumb" href="/bon-tam-nam-dat-san-tron" title="Bồn tắm nằm đặt sàn tròn">
                                                        <img class="lazyload loaded" width="480" height="480" src="//bizweb.dktcdn.net/thumb/large/100/499/932/products/m20808-avt.jpg?v=1699887883713" data-src="//bizweb.dktcdn.net/thumb/large/100/499/932/products/m20808-avt.jpg?v=1699887883713" alt="Bồn tắm nằm đặt sàn tròn" data-was-processed="true">
                                                    </a>
                                                    <span class="smart">-
                                                        15% 
                                                    </span>
                                                    <a href="" class="btn-compare js-btn-wishlist setWishlist btn-views" data-wish="bon-tam-nam-dat-san-tron" tabindex="0" title="Thêm vào yêu thích">
                                                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"></path></svg>
                                                    </a>

                                                    <div class="action">
                                                        <div class="actions-secondary">
                                                            <div class="actions-primary">
                                                                <input type="hidden" name="variantId" value="102718296">
                                                                <button class="btn-cart add_to_cart " title="Thêm vào giỏ hàng">
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
                                                            </div>
                                                            <a title="Xem nhanh" href=""  class="quick-view btn-views">
                                                                <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z"></path></svg>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-name"><a href="/bon-tam-nam-dat-san-tron" title="Bồn tắm nằm đặt sàn tròn">Bồn tắm nằm đặt sàn tròn</a></h3>
                                                    <div class="price-box">
                                                        <span class="price">33.660.000₫</span>
                                                        <span class="compare-price">39.600.000₫</span>
                                                    </div>
                                                </div>
                                            </form>								
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
