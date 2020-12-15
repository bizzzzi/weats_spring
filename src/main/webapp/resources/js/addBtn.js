let addItem = document.querySelector('#addItem');
let addItemList = document.querySelector('.addItemList');

addItem.addEventListener('click', function(event) {

	let title=document.createElement("input");
	let summary=document.createElement("input");
	let price=document.createElement("input");
	let capacity=document.createElement("input");
	let div=document.createElement("div");
	
	div.setAttribute('class','addForm');
	
	title.setAttribute('type','text');
	title.setAttribute('class','leports_item_title');
	title.setAttribute('placeholder','레포츠 아이템 이름');
	title.setAttribute('name','leports_item_title');		

	summary.setAttribute('type','text');
	summary.setAttribute('class','leports_summary');
	summary.setAttribute('placeholder','한줄 요약');
	summary.setAttribute('name','leports_summary');
	
	price.setAttribute('type','text');
	price.setAttribute('class','leports_price');
	price.setAttribute('placeholder','가격 (원)');
	price.setAttribute('name','leports_price');
	
	capacity.setAttribute('type','number');
	capacity.setAttribute('class','leports_max_capacity');
	capacity.setAttribute('placeholder','최대 수용 인원');
	capacity.setAttribute('name','leports_max_capacity');
	
	addItemList.appendChild(div);
	div.appendChild(title);
	div.appendChild(summary);
	div.appendChild(price);
	div.appendChild(capacity);
	
});