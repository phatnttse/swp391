var swiperCollection = new Swiper('.collection-swiper', {
    slidesPerView: 4,
    loop: false,
    grabCursor: true,
    spaceBetween: 20,
    watchSlidesVisibility: true, 
    watchSlidesProgress: true,
    pagination: {
        el: '.collection-swiper .swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.collection-swiper .swiper-button-next',
        prevEl: '.collection-swiper .swiper-button-prev',
    },
    autoplay: {
        delay: 4000,
    },
    breakpoints: {
        300: {
            slidesPerView: 1,
            spaceBetween: 0
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
        1024: {
            slidesPerView: 3,
            spaceBetween: 20
        },
        1200: {
            slidesPerView: 4,
            spaceBetween: 20
        }
    }
});