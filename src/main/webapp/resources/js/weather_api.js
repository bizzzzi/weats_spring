// 서울
const modalOpenBtn = document.querySelector(".modalOpenBtn");
const w_modal = document.querySelector(".w_modal");
const w_closeModal = document.querySelector(".w_closeModal");
const w_modal_overlay = document.querySelector(".w_modal_overlay");

modalOpenBtn.addEventListener("click", () => {
  w_modal.classList.remove("w_hidden");
});

w_closeModal.addEventListener("click", () => {
  w_modal.classList.add("w_hidden");
});

w_modal_overlay.addEventListener("click", () => {
  w_modal.classList.add("w_hidden");
});
// 인천
const modalOpenBtn2 = document.querySelector(".modalOpenBtn2");
const w_modal2 = document.querySelector(".w_modal");
const w_closeModal2 = document.querySelector(".w_closeModal2");
const w_modal_overlay2 = document.querySelector(".w_modal_overlay2");

modalOpenBtn2.addEventListener("click", () => {
	w_modal2.classList.remove("w_hidden");
});

w_closeModal2.addEventListener("click", () => {
	w_modal2.classList.add("w_hidden");
});

w_modal_overlay2.addEventListener("click", () => {
	w_modal2.classList.add("w_hidden");
});
// 제주
const modalOpenBtn3 = document.querySelector(".modalOpenBtn3");
const w_modal3 = document.querySelector(".w_modal");
const w_closeModal3 = document.querySelector(".w_closeModal3");
const w_modal_overlay3 = document.querySelector(".w_modal_overlay3");

modalOpenBtn3.addEventListener("click", () => {
	w_modal3.classList.remove("w_hidden");
});

w_closeModal3.addEventListener("click", () => {
	w_modal3.classList.add("w_hidden");
});

w_modal_overlay3.addEventListener("click", () => {
	w_modal3.classList.add("w_hidden");
});

