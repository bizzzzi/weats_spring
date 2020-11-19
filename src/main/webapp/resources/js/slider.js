// 추천 슬라이더

var swiper = new Swiper('.swiper-container', {
	slidesPerView : 3,
	spaceBetween : 100,
	slidesPerGroup : 3,
	loop : true,
	loopFillGroupWithBlank : true,
	speed : 600,
	pagination : {
		el : '.swiper-pagination',
		clickable : true,
	},
	navigation : {
		nextEl : '.swiper-button-next',
		prevEl : '.swiper-button-prev',
	},
	autoplay: {
	    delay: 3000,
	  },
	
});