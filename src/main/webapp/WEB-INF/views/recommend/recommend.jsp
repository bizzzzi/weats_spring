<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="recommend-wrap">
<!-- 상단 배너 -->

<div id="slider-wrap">
    <ul id="slider">
      <li>
        <div>
          <h3>Slide #1</h3>
          <span>Sub-title</span>
        </div>
        <img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
      </li>

      <li>
        <div>
          <h3>Slide #2</h3>
          <span>Sub-title</span>
        </div>
        <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
      </li>

      <li>
        <div>
          <h3>Slide #3</h3>
          <span>Sub-title</span>
        </div>
        <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
      </li>

      <li>
        <div>
          <h3>Slide #4</h3>
          <span>Sub-title</span>
        </div>
        <img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
      </li>

      <li>
        <div>
          <h3>Slide #5</h3>
          <span>Sub-title</span>
        </div>
        <img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
      </li>
    </ul>

    <div class="slider-btns" id="next"><span>▶</span></div>
    <div class="slider-btns" id="previous"><span>◀</span></div>

    <div id="slider-pagination-wrap">
      <ul>
      </ul>
    </div>
  </div>
  
 <div class="blank" style="padding-top:50px;"></div>

<!-- 아이템 추천 -->

<div class="RECOMMENDED_LEPORTS_LIST">
<h2> 이 달의 레포츠 추천</h2>
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href="#"><img src="" />1</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />2</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />3</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />4</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />5</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />6</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />7</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />8</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />9</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />10</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />11</a>
        </div>
        <div class="swiper-slide">
          <a href="#"><img src="" />12</a>
        </div>
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>
  <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
  <script>
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
  </script>
  
<div class="blank" style="padding-top:50px;"></div>

<!-- 스크롤 페이지 -->

    <header class="header">
    <div class="global-width">
      <h1 class="page-title">페이지 타이틀</h1>
      <p>내용 입력</p>
    </div>
  </header>
  <section class="scroll-content">
    <div class="scroll-image">
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
      <div class="image-item"><img class="scene-img" src="#" alt=""></div>
    </div>
    <div class="scroll-text global-width">
      <div class="step">
        <p> 스크롤 텍스트 1</p>
      </div>
      <div class="step">
        <p> 스크롤 텍스트 2</p>
      </div>
      <div class="step">
        <p> 스크롤 텍스트 3</p>
      </div>
      <div class="step">
        <p> 스크롤 텍스트 4</p>
      </div>
      <div class="step">
        <p> 스크롤 텍스트 5</p>
      </div>
      <div class="step">
        <p> 스크롤 텍스트 6</p>
      </div>
    </div>
  </section>
</div>
  <footer class="footer">
    footer입니다.
  </footer>
 