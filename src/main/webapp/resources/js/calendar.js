document.addEventListener('DOMContentLoaded', function() {
	buildCalendar();
});

var today = new Date();
var date = new Date();
let selectDay = document.querySelector('.choiceDay_data');

function prevCalendar() {
	this.today = new Date(today.getFullYear(), today.getMonth() - 1, today
			.getDate());
	buildCalendar();
}

function nextCalendar() {
	this.today = new Date(today.getFullYear(), today.getMonth() + 1, today
			.getDate());
	buildCalendar();
}

function buildCalendar() {
	let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

	let tbCalendar = document.querySelector('.scriptCalendar > tbody');

	document.getElementById('calYear').innerText = today.getFullYear();
	document.getElementById('calMonth').innerText = autoLeftPad(today
			.getMonth() + 1, 2);

	while (tbCalendar.rows.length > 0) {
		tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	}

	let row = tbCalendar.insertRow();

	let dom = 1;

	let daysLength = Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7
			- doMonth.getDay();


	for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
		let column = row.insertCell();

		if (Math.sign(day) == 1 && lastDate.getDate() >= day) {

			column.innerText = autoLeftPad(day, 2);

			if (dom % 7 == 1) {
				column.style.color = '#FF4D4D';
			}

			if (dom % 7 == 0) {
				column.style.color = '#4D4DFF';
				row = tbCalendar.insertRow();
			}
		}

		else {
			let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(),
					day);
			column.innerText = autoLeftPad(exceptDay.getDate(), 2);
			column.style.color = '#A9A9A9';
		}

		if (today.getFullYear() == date.getFullYear()) {
			if (today.getMonth() == date.getMonth()) {
				if (date.getDate() > day && Math.sign(day) == 1) {
					column.style.backgroundColor = '#E5E5E5';
				}

				else if (date.getDate() < day && lastDate.getDate() >= day) {
					column.style.backgroundColor = '#FFFFFF';
					column.style.cursor = 'pointer';
					column.onclick = function() {
						calendarChoiceDay(this);
					};
				}

				else if (date.getDate() == day) {
					column.style.backgroundColor = '#E6F4FD';
					column.style.cursor = 'pointer';
					column.onclick = function() {
						calendarChoiceDay(this);
					};
				}

			} else if (today.getMonth() < date.getMonth()) {
				if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
					column.style.backgroundColor = '#E5E5E5';
				}
			}

			else {
				if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
					column.style.backgroundColor = '#FFFFFF';
					column.style.cursor = 'pointer';
					column.onclick = function() {
						calendarChoiceDay(this);
					};
				}
			}
		}

		else if (today.getFullYear() < date.getFullYear()) {
			if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
				column.style.backgroundColor = '#E5E5E5';
			}
		}

		else {
			if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
				column.style.backgroundColor = '#FFFFFF';
				column.style.cursor = 'pointer';
				column.onclick = function() {
					calendarChoiceDay(this);
				};
			}
		}

		dom++;
	}
}

function calendarChoiceDay(column) {
	if (document.getElementsByClassName('choiceDay')[0]) {
		document.getElementsByClassName('choiceDay')[0].style.backgroundColor = '#FFFFFF';
		document.getElementsByClassName('choiceDay')[0].classList
				.remove('choiceDay');
	}

	column.style.backgroundColor = '#51ABF3';


	column.classList.add('choiceDay');
	
// 년 월 일 뽑아서 꽂아주기
	let choiceYear = document.querySelector("#calYear").innerText;
	let choiceMonth = document.querySelector("#calMonth").innerText;
	let choiceDay = document.querySelector('.choiceDay').innerText;
	let userChoiceDay = choiceYear+choiceMonth+choiceDay;
	selectDay.value = userChoiceDay;
	console.log(selectDay.value);
	document.querySelector(".userSelectDay").innerText = `${choiceYear}년 ${choiceMonth}월 ${choiceDay}일`;
}

function autoLeftPad(num, digit) {
	if (String(num).length < digit) {
		num = new Array(digit - String(num).length + 1).join('0') + num;
	}
	return num;
}