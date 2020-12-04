function Rating() {};
Rating.prototype.rate = 0;

Rating.prototype.setRate = function(newrate) {
	//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	this.rate = newrate;
	let items = document.querySelectorAll('.rate_radio');
	items.forEach(function(item, idx) {
		if (idx < newrate) {
			item.checked = true;
		} else {
			item.checked = false;
		}
	});
}

let rating = new Rating();

document.addEventListener('DOMContentLoaded', function() {
	//별점선택 이벤트 리스너
	document.querySelector('.rating').addEventListener('click', function(e) {
		let elem = e.target;
		if (elem.classList.contains('rate_radio')) {
			rating.setRate(parseInt(elem.value));
		}
	})
});

//상품평 작성 글자수 초과 체크 이벤트 리스너
document.querySelector('.review_textarea').addEventListener('keydown', function() {
			//리뷰 2000자 초과 안되게 자동 자름
			let review = document.querySelector('.review_textarea');
			let lengthCheckEx = /^.{2000,}$/;
			if (lengthCheckEx.test(review.value)) {
				//2000자 초과 컷
				review.value = review.value.substr(0, 2000);
			}
		});

document.querySelector('.reviewform').addEventListener('submit', function(e) {
	//별점 선택 안했으면 메시지 표시
	if (rating.rate == 0) {
		alert('별점을 선택해 주세요.');
		e.preventDefault();
	}
	//리뷰 5자 미만이면 메시지 표시
	if (document.querySelector('.review_textarea').value.length < 5) {
		alert('5자 이상 작성해 주세요.');
		e.preventDefault();
	}
});

