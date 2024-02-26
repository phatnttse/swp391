var swiperProductNew = new Swiper('.product-new-swiper', {
	slidesPerView: 4,
	loop: false,
	grabCursor: true,
	spaceBetween: 20,
	slidesPerColumn: 2,
	slidesPerColumnFill: 'row',
	roundLengths: true,
	slideToClickedSlide: false,
	autoplay: false,
	navigation: {
		nextEl: '.product-new-swiper .swiper-button-next',
		prevEl: '.product-new-swiper .swiper-button-prev',
	},
	pagination: {
		el: '.product-new-swiper .swiper-pagination',
		clickable: true,
	},
	breakpoints: {
		300: {
			slidesPerView: 2,
			spaceBetween: 10,
			slidesPerColumn: 1
		},
		500: {
			slidesPerView: 2,
			spaceBetween: 15,
			slidesPerColumn: 1
		},
		640: {
			slidesPerView: 2,
			spaceBetween: 15,
			slidesPerColumn: 1
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
			slidesPerView: 4,
			spaceBetween: 20
		}
	}
});