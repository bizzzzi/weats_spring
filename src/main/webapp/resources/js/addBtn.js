let addItem = document.querySelector('#addItem');
let addItemList = document.querySelector('.addItemList');
let target = document.querySelector('.wrap')

addItem.addEventListener('click', function(event) {
	target.cloneNode(true);
	addItemList.innerHTML += target.innerHTML;
});