// 추천 슬라이더

let swiper = new Swiper('.swiper-container', {
      slidesPerView: 4,
      spaceBetween: 25,
      slidesPerGroup: 4,
      loop: true,
      loopFillGroupWithBlank: true,
      speed: 900,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      autoplay: {
        delay: 3000,
      },
    });