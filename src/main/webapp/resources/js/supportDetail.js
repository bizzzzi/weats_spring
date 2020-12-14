const form = document.querySelector(".supportForm");
const UpBtn = document.querySelector(".supportUpdate");
const delBtn = document.querySelector(".supportDelete");

UpBtn.addEventListener("click", () => {
    form.action = 'supportUpdate';
    UpBtn.type = 'submit';
})

delBtn.addEventListener("click", () => {
    form.action = 'supportDelete';
    delBtn.type = 'submit';
})

