let upBtn = document.querySelectorAll('.js_upBtn');
let dwBtn = document.querySelectorAll('.js_dwBtn');
let pCount = document.querySelectorAll('.js_pCount');
let selectItem = document.querySelectorAll('.js_selectItem');
let selectItemPrice;
let totalAmount = document.querySelector(".js_total_amount");
let totalPrice = document.querySelector("input[name='totalPrice']");
let price = 0;

// 아이템 이름
let itemName = document.querySelectorAll('.js_itemName');
// 최대 인원
let maxPerson = document.querySelectorAll('.js_maxPerson');
// 아이템 가격
let itemPrice = document.querySelectorAll('.js_itemPrice');

for (let i = 0; i < dwBtn.length; i++) {
	dwBtn[i].addEventListener('click', () => down(i, 1));
    upBtn[i].addEventListener('click', () => up(i, 1));
}

let down = (i, x) => {
	if (Number(pCount[i].value) > 1) {
		pCount[i].value -= x;
		selectItem[i].innerHTML = `<div class="select_items_option${[i]}">
		   	<div>${itemName[i].value}</div>
			<input type="text" style="display:none" value="${itemName[i].value}" name="itemName" />
		   	<div>
		   		<div>${pCount[i].value} X ${itemPrice[i].value}원</div>
				<div class="select_item_price">${pCount[i].value * itemPrice[i].value}</div>
				<input type="text" style="display:none" value="${pCount[i].value * itemPrice[i].value}" name="items_price" />
			</div>
		   </div>`;
		selectItemPrice = document.querySelectorAll('.select_item_price');
		price -= Number(itemPrice[i].value);
		totalAmount.innerText = price;
		totalPrice.value = price;
		console.log(totalPrice.value);
	} else if (Number(pCount[i].value) === 1){
		pCount[i].value -= x;
		price -= Number(itemPrice[i].value);
		totalAmount.innerText = price;
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
		selectItem[i].innerHTML = `<div class="select_items_option${[i]}">
		   							<div>${itemName[i].value}</div>
									<input type="text" style="display:none" value="${itemName[i].value}" name="itemName" />
		   							<div>
		   								<div>${pCount[i].value} X ${itemPrice[i].value}원</div>
										<div class="select_item_price">${pCount[i].value * itemPrice[i].value}</div>
										<input type="text" style="display:none" value="${pCount[i].value * itemPrice[i].value}" name="items_price" />
									</div>
								   </div>`;
		selectItemPrice = document.querySelectorAll('.select_item_price');
		price += Number(itemPrice[i].value);
		totalAmount.innerText = price;
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




