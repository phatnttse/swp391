// flashsale.js

document.addEventListener('DOMContentLoaded', function () {
    // Initialize Swiper
    var swiper = new Swiper('.flash-sale-swiper', {
        slidesPerView: 1,
        spaceBetween: 20,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    // Set the date we're counting down to
    var countDownDate = new Date("Feb 13, 2025 12:00:00").getTime();

    // Update the countdown every 1 second
    var x = setInterval(function () {
        // Get the current date and time
        var now = new Date().getTime();

        // Calculate the remaining time
        var distance = countDownDate - now;

        // Calculate days, hours, minutes, and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the countdown
        document.querySelector('.time .block-timer:nth-child(1) p').innerHTML = days;
        document.querySelector('.time .block-timer:nth-child(2) p').innerHTML = hours;
        document.querySelector('.time .block-timer:nth-child(3) p').innerHTML = minutes;
        document.querySelector('.time .block-timer:nth-child(4) p').innerHTML = seconds;

        // If the countdown is over, display a message
        if (distance < 0) {
            clearInterval(x);
            document.querySelector('.time').innerHTML = "EXPIRED";
        }
    }, 1000);
});
