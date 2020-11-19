// 로그인 모달
	
	const loginOpenBtn = document.querySelector(".loginOpenBtn");
	const modal = document.querySelector(".modal");
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
	const modal2 = document.querySelector(".modal2");
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