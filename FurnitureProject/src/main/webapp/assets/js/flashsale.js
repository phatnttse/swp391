var galleryTop = new Swiper('.product-sale-gallery', {
    spaceBetween: 0,
    lazy: true,
    hashNavigation: true,
    navigation: {
        nextEl: '.product-sale-gallery .swiper-button-next',
        prevEl: '.product-sale-gallery .swiper-button-prev',
    },
});
var swiperProductNew = new Swiper('.flash-sale-swiper', {
    slidesPerView: 3,
    loop: false,
    grabCursor: true,
    spaceBetween: 20,
    slidesPerColumn: 1,
    slidesPerColumnFill: 'row',
    roundLengths: true,
    slideToClickedSlide: false,
    autoplay: false,
    navigation: {
        nextEl: '.flash-sale-swiper .swiper-button-next',
        prevEl: '.flash-sale-swiper .swiper-button-prev',
    },
    pagination: {
        el: '.flash-sale-swiper .swiper-pagination',
        clickable: true,
    },
    breakpoints: {
        300: {
            slidesPerView: 2,
            spaceBetween: 10
        },
        500: {
            slidesPerView: 2,
            spaceBetween: 15
        },
        640: {
            slidesPerView: 2,
            spaceBetween: 15
        },
        768: {
            slidesPerView: 2,
            spaceBetween: 20
        },
        992: {
            slidesPerView: 3,
            spaceBetween: 20
        },
        1200: {
            slidesPerView: 3,
            spaceBetween: 20
        }
    }
});