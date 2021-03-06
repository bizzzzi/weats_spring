let upBtn = document.querySelectorAll('.js_upBtn');
let dwBtn = document.querySelectorAll('.js_dwBtn');
let pCount = document.querySelectorAll('.js_pCount');
let selectItem = document.querySelectorAll('.js_selectItem');
let selectItemPrice;
let totalAmount = document.querySelector(".js_total_amount");
let totalAmount2 = document.querySelector(".js_total_amount2");
let totalPrice = document.querySelector("input[name='totalPrice']");
let price = 0;
// 아이템 아이디
let itemId = document.querySelectorAll('.js_itemId');
// 아이템 이름
let itemName = document.querySelectorAll('.js_itemName');
// 최대 인원
let maxPerson = document.querySelectorAll('.js_maxPerson');
// 아이템 가격
let itemPrice = document.querySelectorAll('.js_itemPrice');
// 총 선택 인원수 넣을곳 (인원수 변경)
let pTotalCount = document.querySelector('.js_pTotalCount');

for (let i = 0; i < dwBtn.length; i++) {
	dwBtn[i].addEventListener('click', () => down(i, 1));
    upBtn[i].addEventListener('click', () => up(i, 1));
}

let down = (i, x) => {
	if (Number(pCount[i].value) > 1) {
		pCount[i].value -= x;
		pTotalCount.value -= x;
		selectItem[i].innerHTML = `<div class="select_items_option${[i]} select_item_info">
		   	<div style="width:33%;
		   		overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;">${itemName[i].value}</div>
			<input type="text" style="display:none" value="${itemName[i].value}" name="item_name" />
		   	<div>
		   		<div class="item_multi">${pCount[i].value} X ${itemPrice[i].value}원</div>
			</div>
			<div>
				<div class="select_item_price">${(pCount[i].value * itemPrice[i].value).toLocaleString()}원</div>
				<input type="text" style="display:none" value="${pCount[i].value * itemPrice[i].value}" name="items_price" />
				<input type="text" style="display:none" value="${pCount[i].value}" name="reserve_count"/>
				<input type="text" style="display:none" value="${itemId[i].value}" name="itemId"/>
			</div>
		   </div>`;
		selectItemPrice = document.querySelectorAll('.select_item_price');
		price -= Number(itemPrice[i].value);
		totalAmount.innerText = price.toLocaleString();
		totalAmount2.innerText = price.toLocaleString();
		totalPrice.value = price
		console.log(totalPrice.value);
	} else if (Number(pCount[i].value) === 1){
		pCount[i].value -= x;
		pTotalCount.value -= x;
		price -= Number(itemPrice[i].value);
		totalAmount.innerText = price.toLocaleString();
		totalAmount2.innerText = price.toLocaleString();
		totalPrice.value = price;
		console.log(totalPrice.value);
        selectItem[i].innerHTML = "";
	}
	
};

let up = (i, x) => {
	let pCountValue = Number(pCount[i].value);
	
	if (Number(pCount[i].value) < Number(maxPerson[i].value)) {
		pCountValue += x;
		pCount[i].value = pCountValue;
		pTotalCount.value++;
		selectItem[i].innerHTML = `<div class="select_items_option${[i]} select_item_info">
		   							<div style="width:33%;
		   								overflow: hidden;
										text-overflow: ellipsis;
										white-space: nowrap;">${itemName[i].value}</div>
									<input type="text" style="display:none" value="${itemName[i].value}" name="item_name" />
		   							<div>
		   							<div class="item_multi">${pCount[i].value} X ${itemPrice[i].value.toLocaleString()}원</div>
									</div>
									<div>
										<div class="select_item_price">${(pCount[i].value * itemPrice[i].value).toLocaleString()}원</div>
										<input type="text" style="display:none" value="${pCount[i].value * itemPrice[i].value}" name="items_price" />
										<input type="text" style="display:none" value="${pCount[i].value}" name="reserve_count"/>
										<input type="text" style="display:none" value="${itemId[i].value}" name="itemId"/>
									</div>
								   </div>`;
		selectItemPrice = document.querySelectorAll('.select_item_price');
		price += Number(itemPrice[i].value);
		totalAmount.innerText = price.toLocaleString();
		totalAmount2.innerText = price.toLocaleString();
		totalPrice.value = price;
		console.log(totalPrice.value);
	}
};

// 리뷰 보기 기능

const reviewList = document.querySelectorAll(".review_list");
const reviewListBtn = document.querySelector("#review_list_btn");

// 리뷰 3개만 출력
for(let i = 0; i < reviewList.length; i++) {
	if(Number(reviewList[i].getAttribute("data-value")) > 2) {
		reviewList[i].classList.add("hidden");
	}
};

// 버튼 클릭시 리뷰 출력 및 닫기

reviewListBtn.addEventListener('click', () => viewReview());

let viewReview = () => {
	if(Number(reviewListBtn.value) === 0) {
		for(let i = 0; i < reviewList.length; i++) {
			if(Number(reviewList[i].getAttribute("data-value")) > 2) {
				reviewList[i].classList.remove("hidden");
			}
		};
		reviewListBtn.value = 1;
		reviewListBtn.innerText = "후기 닫기";
	} else if(Number(reviewListBtn.value) === 1){
		for(let i = 0; i < reviewList.length; i++) {
			if(Number(reviewList[i].getAttribute("data-value")) > 2) {
				reviewList[i].classList.add("hidden");
			}
		};
		reviewListBtn.value = 0;
		reviewListBtn.innerText = "후기 전체보기";
	}
}


// 결제하기 버튼 클릭
let userChoiceDay = document.querySelector('.choiceDay_data');
let paymentBtn = document.querySelector('.paymentBtn');

let navigatePage = () => {
	if(userChoiceDay.value === "") {
		alert("날짜를 선택해주세요.");
		event.preventDefault();
	} else if(Number(pTotalCount.value) === 0) {
		alert("상품을 선택해주세요.")
		event.preventDefault();
	}
}

paymentBtn.addEventListener("click", navigatePage);


// 마스킹
let review_email = document.querySelectorAll('.review_email');

for(let i = 0; i < review_email.length; i++) {
	let originStr = review_email[i].innerText; 
	let emailStr = originStr.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi); 
	let strLength;
	strLength = emailStr.toString().split('@')[0].length - 3;
	review_email[i].innerText = originStr.toString().replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*');
}

// 예약 가능 인원 비동기

let leports_item_mc = document.querySelectorAll('.leports_item_mc');
let ajax_maxPerson = document.querySelectorAll('.ajax_maxPerson');

let listArr = [];
function ajaxList(arr) {
	for(let i = 0; i < itemId.length; i++) {
		for(let k = 0; k < arr.length; k++) {
			if(itemId[i].value == arr[k]["LEPORTS_ITEM_ID"]){
				leports_item_mc[i].innerText = "예약 가능 인원 : " + (Number(maxPerson[i].value) - arr[k]["RS_ITEM_PERSON"]);
				maxPerson[i].value = (Number(maxPerson[i].value) - arr[k]["RS_ITEM_PERSON"]);
			}
		}
	}
}

$('table').on("click", "td", function() {
	$.ajax({
		type : "POST",
		url : "personCount", // 서버 주소
		data : {
			leports_id : $("#leports_id").val(), // 전송 데이터
			rs_date : $("#rs_date").val(), // 전송 데이터
		},
		dataType : "json", // 응답 데이터 타입
		success : function(data, status, xhr) {
			totalAmount.innerText = 0;
			totalAmount2.innerText = 0;
			price = 0;
			for(var i = 0; i < ajax_maxPerson.length; i++) {
				pCount[i].value = 0;
				pTotalCount.value = 0;
				maxPerson[i].value = ajax_maxPerson[i].value;
				leports_item_mc[i].innerText = "예약 가능 인원 : " + ajax_maxPerson[i].value;
				selectItem[i].innerHTML = "";
			}
			listArr = data;
			ajaxList(listArr);
		},
		error : function(xhr, status, error) {
			console.log("error");
		}
	});
	
});

