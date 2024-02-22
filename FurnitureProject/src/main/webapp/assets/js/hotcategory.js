document.addEventListener("DOMContentLoaded", function () {
  // Khởi tạo Swiper
  var swiper = new Swiper(".mySwiper", {
    effect: "coverflow",
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 4, // Số lượng card hiển thị trên mỗi trang
    spaceBetween: 20, // Khoảng cách giữa các card
    coverflowEffect: {
      rotate: 50,
      stretch: 0,
      depth: 100,
      modifier: 0, // độ nghiêng 
      slideShadows: true,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true, // Cho phép bullet clickable
    },
    
    // Tùy chọn autoplay
    autoplay: {
      delay: 2000, // Thời gian hiển thị giữa các slide (đơn vị: miliseconds)
      disableOnInteraction: false, // Tắt autoplay khi người dùng tương tác
    },

    initialSlide: 1, // Hiển thị card thứ hai đầu tiên
  });

  // Lắng nghe sự kiện slideChangeTransitionEnd
  swiper.on("slideChangeTransitionEnd", function () {
    // Nếu đến slide gần cuối, chuyển về slide thứ hai
    if (swiper.activeIndex === swiper.slides.length - 2) {
      swiper.slideTo(1);
    }
  });

  // Lắng nghe sự kiện click trên bullet
  swiper.pagination.$el.on("click", ".swiper-pagination-bullet", function () {
    // Lấy index của bullet được click
    var bulletIndex = this.getAttribute("data-bullet-index");

    // Chuyển đến slide tương ứng
    swiper.slideTo(bulletIndex);
  });
});
