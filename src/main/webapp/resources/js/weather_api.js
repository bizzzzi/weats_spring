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