const rs_date = document.querySelectorAll('.rs_date');
const cancel = document.querySelectorAll('.cancel');
const review = document.querySelectorAll('.review');
const rs_form = document.querySelectorAll('.reservationCancellation');
const review_verify = document.querySelectorAll('.review_verify');


function parseDate(str) {
  let y = str.substr(0, 2);
  let m = str.substr(3, 2);
  let d = str.substr(6, 2);
  return new Date(Number(y) + Number(2000), m - 1, d);
}

let i = 0;
for (let date of rs_date) {
  const today = new Date();
  let rsDate = parseDate(date.value);
  if (today < rsDate) {
    console.log("예약취소", rsDate);
    review[i].style.backgroundColor = "#868787";
    review[i].style.border = "1px solid #868787";
    cancel[i].type = 'submit';
  } else if (today > rsDate.setDate(rsDate.getDate() + 1) && review_verify[i].value === "0") {
    console.log("리뷰쓰기", rsDate);
    cancel[i].style.backgroundColor = "#868787";
    cancel[i].style.border = "1px solid #868787";
    rs_form[i].action = 'reviewWriteForm';
    rs_form[i].method = 'post';
    review[i].type = 'submit';
  } else {
    cancel[i].style.backgroundColor = "#868787";
    cancel[i].style.border = "1px solid #868787";

    //form 안에 a태그가 먼저 동작하여 조건을 밖에다 씀
    if (review_verify[i].value === "1") {
      review[i].style.backgroundColor = "#868787";
      review[i].style.border = "1px solid #868787";
      review[i].addEventListener("click", (e) => {
          alert("이미 리뷰를 작성하셨습니다.");
          e.preventDefault();
        }
      )
    } else {
      review[i].addEventListener("click", (e) => {
          alert("다음 날부터 리뷰를 작성하실 수 있습니다.");
          e.preventDefault();
        }
      )
    }
  }
  i++;
  console.log(today);
}


Array.from(rs_form).forEach((rs_form) => {
  if (rs_form.method == 'get') {
    rs_form.addEventListener('submit', (e) => {
      if (confirm('예약을 취소하시겠습니까?') === false) {
        e.preventDefault();
      }
    });
  }
});
