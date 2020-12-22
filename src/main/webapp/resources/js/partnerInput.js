let c_name = document.querySelector('.c_name');
let c_phone = document.querySelector('.c_phone');
let sample4_postcode=document.getElementById('sample4_postcode');
let sample4_roadAddress=document.getElementById('sample4_roadAddress');
let sample4_jibunAddress=document.getElementById('sample4_jibunAddress');
let partner_license_num = document.querySelector('.partner_license_num');
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


let leports_title = document.querySelector('.leports_title');
let leports_content = document.querySelector('.leports_content');
let leports_main_img = document.querySelector('.leports_main_img');
let leports_loc = document.querySelector('.leports_loc');
let leports_type = document.querySelector('.leports_type');
let minimum_number = document.querySelector('.subImg4');

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
	} else if(minimum_number.value === "") {
		alert("사진을 5개 이상 첨부해 주세요.");
		event.preventDefault();
	}
}


