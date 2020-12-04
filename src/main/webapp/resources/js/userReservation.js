const rs_date = document.querySelectorAll('.rs_date');
const cancel = document.querySelectorAll('.cancel');
const review = document.querySelectorAll('.review');
const rs_form = document.querySelectorAll('.reservationCancellation');
	
	
const today = new Date();

function parseDate(str) {
	let y = str.substr(0,2);
	let m = str.substr(3,2);
	let d = str.substr(6,2);
	return new Date(Number(y)+Number(2000), m-1, d);
}
	
let i = 0;
for(let date of rs_date){
	let rsDate = parseDate(date.value);
	if(today <= rsDate) {
		console.log("예약취소", rsDate);
	    cancel[i].type = 'submit';
	} else {
	    console.log("리뷰쓰기", rsDate);
	    rs_form[i].action = 'reviewWriteForm';
	    rs_form[i].method = 'post';
	    review[i].type = 'submit';
	}
	i++;
}


Array.from(rs_form).forEach((rs_form) => {
	if(rs_form.method == 'get') {
		rs_form.addEventListener('submit', (e) => {
			if(confirm('예약을 취소하시겠습니까?') === false) {
				e.preventDefault();
			}
		});
	}
});
