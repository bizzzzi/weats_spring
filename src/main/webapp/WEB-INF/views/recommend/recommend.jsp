<%@page import="com.dto.LeportsThumbnailDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="blank" style="padding-top:30px;"></div>	
<div class="recommend-wrap">
<!-- 상단 배너 -->

<div id="slider-wrap">
    <ul id="slider">
      <li>
        <div>
          <h3>할인 받고 Let's 스키</h3>
          <span>선착순 10명에게만! 달려~!~!~</span>
        </div>
        <img src="images/banner_1.jpg">
      </li>

      <li>
        <div>
          <h3>속이 뻥 뚫리는 짜릿함을 느끼고 싶다면?!</h3>
          <span>단양으로 오세요~</span>
        </div>
        <img src="images/banner_2.jpg">
      </li>

      <li>
        <div>
          <h3>심장이 두근거리는 레포츠를 찾으시나요?</h3>
          <span>그렇다면 홍천 가리산 레포츠 파크로!</span>
        </div>
        <img src="images/banner_3.jpg">
      </li>

      <li>
        <div>
          <h3>멀리 나가지 않아도!</h3>
          <span>멋진 노을을 즐기며 한강에서 카약을~</span>
        </div>
        <img src="images/banner_4.jpg">
      </li>

      <li>
        <div>
          <h3>여기 한국 맞아?</h3>
          <span>한국에서 즐기는 해외의 맛, 강원 서피비치</span>
        </div>
        <img src="images/banner_5.jpg">
      </li>
    </ul>

    <div class="slider-btns" id="next"><span>▶</span></div>
    <div class="slider-btns" id="previous"><span>◀</span></div>

    <div id="slider-pagination-wrap">
      <ul>
      </ul>
    </div>
  </div>
  
 <div class="blank" style="padding-top:70px;"></div>

<!-- 아이템 추천 -->
<div class="ratingTop_leports_list">
<h2> 인기 폭발 TOP 10 </h2>
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <c:forEach var="dto" items="${ratingList}">
         <div class="swiper-slide recommend_item"> 
          <a href="leportsDetail?leports_id=${dto.leports_id}"><img class="slide_img" src="/weats/display?fileName=${dto.leports_main_img}"/></a>
          <div>
			 <ul class="recommend_item_info">
				<li style="display: none">상품 아이디: ${dto.leports_id}</li>
				<li class="recommend_item_loc">${dto.leports_loc}</li>
				<li class="recommend_item_title">${dto.leports_title}</li>
				<li class="recommend_item_summary">${dto.leports_summary}</li>
				<li class="recommend_item_review"><span class="leports_item_review_star">★${dto.review_star}</span> ${dto.review_cnt}개</li>					
				<li class="recommend_item_price"><fmt:formatNumber value="${dto.leports_price}" pattern="#,###" />원~ / 1인</li>
			 </ul>
		   </div>
         </div>     
        </c:forEach>
       </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>
  
<div class="blank" style="padding-top:70px;"></div>

<div class="reservationTop_leports_list">
<h2> 예약 TOP 10 </h2>
    <div class="swiper-container">
      <div class="swiper-wrapper">
       <c:forEach var="dto" items="${reserveList}">
        <div class="swiper-slide recommend_item">
          <a href="leportsDetail?leports_id=${dto.leports_id}"><img class="slide_img" src="/weats/display?fileName=${dto.leports_main_img}" /></a>
			<div>
			 <ul class="recommend_item_info">
				<li style="display: none">상품 아이디: ${dto.leports_id}</li>
				<li class="recommend_item_loc">${dto.leports_loc}</li>
				<li class="recommend_item_title">${dto.leports_title}</li>
				<li class="recommend_item_summary">${dto.leports_summary}</li>
				<li class="recommend_item_review"><span class="leports_item_review_star">★${dto.review_star}</span> ${dto.review_cnt}개</li>					
				<li class="recommend_item_price"><fmt:formatNumber value="${dto.leports_price}" pattern="#,###" />원~ / 1인</li>
			 </ul>
		    </div>        
	    </div>
       </c:forEach>
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
  
<div class="blank" style="padding-top:90px;"></div>
</div>
<!-- 스크롤 페이지 -->
    <header class="header">
    <div class="global-width">
      <h1 class="page-title">Weats,<br>날씨와 레포츠 예약을 한번에!</h1>
    </div>
  </header>
  <section class="scroll-content">
    <div class="scroll-image">
      <div class="image-item"><img class="scene-img" src="images/recommend_1.jpg" alt=""></div>
      <div class="image-item"><img class="scene-img" src="images/recommend_2.jpg" alt=""></div>
      <div class="image-item"><img class="scene-img" src="images/banner_3.jpg" alt=""></div>
      <div class="image-item"><img class="scene-img" src="images/banner_4.jpg" alt=""></div>
      <div class="image-item"><img class="scene-img" src="images/banner_5.jpg" alt=""></div>
      <div class="image-item"><img class="scene-img" src="images/recommend_6.jpg" alt=""></div>
    </div>
    <div class="scroll-text global-width">
      <div class="step">
        <p>평상시 레포츠에 관심이 많았던 팀원들이 레포츠 예약 사이트를 이용하며 불편했던 점을 보완하여<br/> 레포츠가 날씨에 영향을 많이 받는다는 것을 고려해 기상정보와 날씨 api를 이용하여 5일간의 기상 정보를 볼 수 있는</br> 기능을 넣었고 실시간으로 날씨를 확인하는 동시에 레포츠를 예약할 수 있는 강점을 가진 사이트입니다.</p>
      </div>
      <div class="step">
        <p>주 타겟층<br/>레포츠 프로그램을 이용하는 일반 회원 - 실시간으로 제공되는 다양한 예약 프로그램<br/>레포츠 프로그램을 운영하는 파트너(사업자) 회원 - 손쉬운 예약 관리</p>
      </div>
      <div class="step">
        <p>날씨API<br/>5일간 날씨를 확인할 수 있는 기능을 사용하여 효율적인 예약 시스템을 마련하고<br/>날씨에 따라 즐길 수 있는 레포츠를 추천한다.</p>
      </div>
      <div class="step">
        <p>레포츠 프로그램<br/>사업자 등록증 인증 후 손쉬운 실시간 업로드가 가능한 레포츠 프로그램 페이지를 구성.<br/> 일반 사용자는 예약 가능 인원, 이용 가능한 날짜를 한 눈에 파악하고, 별점 기능을 포함한 후기를 통해 프로그램 전체 파악이 가능</p>
      </div>
      <div class="step">
        <p>중고거래<br/>파트너 뿐만 아니라 일반 회원에게도 판매가 가능하도록 했다.<br/>1회성 장비, 다른 레포츠 프로그램을 즐길 수 있는 선택의 폭을 넓힐 수 있도록<br/>레포츠 장비 판매를 위한 중고거래 게시판 마련하여 레포츠 예약을 위한 1회성 사이트 접속이 아닌 지속적인 유입 유도 </p>
      </div>
      <div class="step">
        <p>고생하셨습니다:)</p>
      </div>
    </div>
  </section>
 