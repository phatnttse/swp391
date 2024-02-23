document.addEventListener("DOMContentLoaded", function () {
    var swiper = new Swiper(".mySwiperNew", {
      slidesPerView: 4,
      grid: {
        rows: 2,
      },
      spaceBetween: 25,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  });
  