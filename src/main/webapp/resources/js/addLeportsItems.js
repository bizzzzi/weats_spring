const addBtn = document.querySelector('.addBtn');
let count = 0;

function add_item(){
	count++;
    let div = document.createElement('div');
    let addItemList=document.getElementById('addItemList');   
    div.setAttribute('class','itemform');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    addItemList.appendChild(div);
}

addBtn.addEventListener('click', add_item);

function deleteParent(child) {
	let parent = child.parentNode;
	parent.parentNode.removeChild(parent);
}

const ItemAddForm = document.querySelector('#ItemAddForm');
ItemAddForm.addEventListener('submit', function(e) {
	let leports_item_title = document.querySelectorAll('.leports_item_title');
	let leports_summary = document.querySelectorAll('.leports_summary');
	let leports_price = document.querySelectorAll('.leports_price');
	let leports_max_capacity = document.querySelectorAll('.leports_max_capacity');
	for(let i = 1; i < leports_item_title.length; i++) {
		if(leports_item_title[i].value === "") {
			alert("레포츠 아이템이름을 입력해주세요.");
			e.preventDefault();
			leports_item_title[i].focus();
		} else if(leports_summary[i].value ==="") {
			alert("한줄요약을 입력해주세요.")
			e.preventDefault();
			leports_summary[i].focus();
		}else if(leports_price[i].value === "") {
			alert("가격을 입력해주세요.")
			e.preventDefault();
			leports_price[i].focus();
		}else if(isNaN(leports_price[i].value)) {
			alert("숫자만 입력해주세요")
			e.preventDefault();
			leports_price[i].focus();
		}else if(leports_max_capacity[i].value ==="") {
			alert("최대 수용인원을 입력해주세요.")
			e.preventDefault();
			leports_max_capacity[i].focus();
		}
	}
	
});

