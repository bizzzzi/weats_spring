let c_name = document.querySelector('.c_name');
let c_phone = document.querySelector('.c_phone');
let sample4_postcode=document.getElementById('sample4_postcode');
let sample4_roadAddress=document.getElementById('sample4_roadAddress');
let sample4_jibunAddress=document.getElementById('sample4_jibunAddress');
let partner_license_num = document.querySelector('.partner_license_num');
let bizID = document.querySelector('.partner_license_num').value;
let image_inputType_file = document.querySelector('.image_inputType_file');
let partnerFormBtn = document.querySelector('.partnerFormBtn');

function nullCheck() {
	if(c_name.value === "") {
		alert("상호 이름을 입력해주세요.");
		event.preventDefault();
		c_name.focus();
	} else if(c_phone.value ==="") {
		alert("연락처를 입력해주세요.")
		event.preventDefault();
		c_phone.focus();
	}else if(sample4_postcode.value ==="") {
		alert("우편번호를 입력해주세요.")
		event.preventDefault();
		sample4_postcode.focus();
	}else if(sample4_roadAddress.value ==="") {
		alert("도로명 주소를 입력해주세요.")
		event.preventDefault();
		sample4_roadAddress.focus();
	} else if(sample4_jibunAddress.value ==="") {
		alert("상세 주소를 입력해주세요.")
		event.preventDefault();
		sample4_jibunAddress.focus();
	} else if(partner_license_num.value ==="") {
		alert("사업자 번호를 입력해주세요.")
		event.preventDefault();
		partner_license_num.focus();
	} else if(image_inputType_file.value==="") {
		alert("사업자 등록증을 첨부해주세요")
		event.preventDefault();
		image_inputType_file.focus();
	} 
}

partnerFormBtn.addEventListener("click", nullCheck);

let leports_title = document.querySelector('.leports_title');
let leports_content = document.querySelector('.leports_content');
let leports_main_img = document.querySelector('.leports_main_img');
let leports_loc = document.querySelector('.leports_loc');
let leports_type = document.querySelector('.leports_type');

function productNull() {
	if(leports_title.value === "") {
		alert("상품 이름을 입력해주세요.");
		event.preventDefault();
		leports_title.focus();
	} else if(leports_content.value ==="") {
		alert("상품 소개를 입력해주세요.")
		event.preventDefault();
		leports_content.focus();
	}else if(leports_main_img.value ==="") {
		alert("상품 대표사진을 첨부해주세요.")
		event.preventDefault();
		leports_main_img.focus();
	}else if(leports_loc.value ==="시도") {
		alert("지역을 선택해주세요.")
		event.preventDefault();
		leports_loc.focus();
	}
}

let leports_item_title = document.querySelector('.leports_item_title');
let leports_summary = document.querySelector('.leports_summary');
let leports_price = document.querySelector('.leports_price');
let leports_max_capacity = document.querySelector('.leports_max_capacity');

function itemNull() {
	if(leports_item_title.value === "") {
		alert("레포츠 아이템이름을 입력해주세요.");
		event.preventDefault();
		leports_item_title.focus();
	} else if(leports_summary.value ==="") {
		alert("한줄요약을 입력해주세요.")
		event.preventDefault();
		leports_summary.focus();
	}else if(leports_price.value ==="") {
		alert("가격을 입력해주세요.")
		event.preventDefault();
		leports_price.focus();
	}else if(isNaN(leports_price.value)) {
		alert("숫자만 입력해주세요")
		event.preventDefault();
		leports_price.focus();
	}else if(leports_max_capacity.value ==="") {
		alert("최대 수용인원을 입력해주세요.")
		event.preventDefault();
		leports_max_capacity.focus();
	}
}
