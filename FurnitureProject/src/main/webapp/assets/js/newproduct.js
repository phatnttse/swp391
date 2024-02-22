document.addEventListener("DOMContentLoaded", function () {
    var swiper = new Swiper(".mySwiperNew", {
      slidesPerView: 4,
      grid: {
        rows: 2,
      },
      spaceBetween: 30,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  });
  