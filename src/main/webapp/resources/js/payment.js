let rs_name = document.querySelector(".rs_name_js");
let rs_phone = document.querySelector(".rs_phone_js");
let rs_email = document.querySelector(".rs_email_js");
let paymentBtn = document.querySelector(".paymentBtn");

let navigatePage = () => {
	if(rs_name.value === "") {
		alert("예약자명을 입력해주세요.");
		rs_name.focus();
		event.preventDefault();
	} else if(rs_phone.value === "") {
		alert("연락처를 입력해주세요.");
		rs_phone.focus();
		event.preventDefault();
	} else if(rs_email.value === "") {
		alert("이메일을 입력해주세요.");
		rs_email.focus();
		event.preventDefault();
	}
}

paymentBtn.addEventListener("click", navigatePage);