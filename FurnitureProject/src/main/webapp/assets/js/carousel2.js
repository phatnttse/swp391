$(document).ready(function(){
    // Initialize Owl Carousel
    $(".owl-carousel").owlCarousel({
      items: 1,
      margin: 15,
      autoplay: true,
      autoplayTimeout: 3000,
      loop: true,
      nav: false,// bỏ nav
      navText: ["<", ">"],
    });
  
    // Listen to the "translated" event (similar to Swiper's "slideChangeTransitionEnd")
    $(".owl-carousel").on("translated.owl.carousel", function(event){
      // If close to the last slide, go back to the second slide
      if (event.item.index === event.item.count - 2) {
        $(".owl-carousel").trigger('to.owl.carousel', 1);
      }
    });
  });
  