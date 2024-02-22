// Chờ tất cả các phần tử HTML được tải xong trước khi thực hiện các hành động khác
document.addEventListener("DOMContentLoaded", function () {
    // Khởi tạo Swiper
    var swiper = new Swiper(".mySwiper", {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 3, // Số lượng card hiển thị trên mỗi trang
      spaceBetween: 20, // Khoảng cách giữa các card
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true, // Cho phép bullet clickable
      },
       // Tùy chọn autoplay
    autoplay: {
        delay: 5000, // Thời gian hiển thị giữa các slide (đơn vị: miliseconds)
        disableOnInteraction: false, // Tắt autoplay khi người dùng tương tác
      },

      initialSlide: 1, // Hiển thị card thứ hai đầu tiên
    });
  
    // Lắng nghe sự kiện click trên bullet
    swiper.pagination.$el.on("click", ".swiper-pagination-bullet", function () {
      // Lấy index của bullet được click
      var bulletIndex = this.getAttribute("data-bullet-index");
  
      // Chuyển đến slide tương ứng
      swiper.slideTo(bulletIndex);
    });
  });
  