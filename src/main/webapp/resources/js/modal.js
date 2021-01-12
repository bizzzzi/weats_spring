// 로그인 모달
	
	const loginOpenBtn = document.querySelector(".loginOpenBtn");
	const modal = document.querySelector(".loginModal");
	const overlay = document.querySelector(".modalOverlay");
	const closeBtn = document.querySelector(".closeBtn");
	
	const openModal = () => {
		modal.classList.remove("hidden");
	}
	
	const closeModal = () => {
		  modal.classList.add("hidden");
		}
		
	
	overlay.addEventListener("click", closeModal);
	closeBtn.addEventListener("click", closeModal);
	loginOpenBtn.addEventListener("click", openModal);
	
// 회원가입 모달
	
	const signUpOpenBtn = document.querySelector(".signUpOpenBtn");
	const modal2 = document.querySelector(".signUpModal");
	const overlay2 = document.querySelector(".modalOverlay2");
	const closeBtn2 = document.querySelector(".closeBtn2");
	
	const openModal2 = () => {
		modal2.classList.remove("hidden");
	}
	
	const closeModal2 = () => {
		modal2.classList.add("hidden");
	}
	
	overlay2.addEventListener("click", closeModal2);
	closeBtn2.addEventListener("click", closeModal2);
	signUpOpenBtn.addEventListener("click", openModal2);
	
// 비밀번호 찾기 모달
	
	const findPw = document.querySelector('#findPw');
	const modal3 = document.querySelector(".findPwModal");
	const overlay3 = document.querySelector(".modalOverlay3");
	const closeBtn3 = document.querySelector(".closeBtn3");
	
	const openModal3 = () => {
		modal3.classList.remove("hidden");
		modal.classList.add("hidden");
	}
	
	const closeModal3 = () => {
		  modal3.classList.add("hidden");
		}
		
	
	overlay3.addEventListener("click", closeModal3);
	closeBtn3.addEventListener("click", closeModal3);
	findPw.addEventListener("click", openModal3);
	
	$(".userEmail").on("keyup", function() {
		console.log("XXXX");
		$.ajax({
			type : "GET",
			url : "emailCheck", // 서버 주소
			data : {
				user_email : $(".userEmail").val(), // 전송 데이터
			},
			dataType : "text", // 응답 데이터 타입
			success : function(data, status, xhr) {
				console.log(data);
				$("#findEmailResult").text(data);
			},
			error : function(xhr, status, error) {
				console.log("error");
			}
		});
	});// end-
	
	
	const findEmailResult = document.querySelector('#findEmailResult');
	const ajax_findPw = document.querySelector('#ajax_findPw');
	const findUserEmail = document.querySelector('.userEmail');
	
	ajax_findPw.addEventListener("submit", function(e) {
		if (findEmailResult.innerText != "이메일 중복") {
			alert("존재하지 않는 이메일입니다");
			findUserEmail.value = null;
			findUserEmail.focus();
			e.preventDefault();
		} else {

		}
	})
$("#ajax_findPw").on("submit", function() {
	$.ajax({
		type : "POST",
		url : "findPasswd", // 서버 주소
		data : {
			user_email : $(".userEmail").val(), // 전송 데이터
		},
		dataType : "text", // 응답 데이터 타입
		success : function(data, status, xhr) {
			console.log("success");
		},
		error : function(xhr, status, error) {
			console.log("error");
		}
	});

});
	
