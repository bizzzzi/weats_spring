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


