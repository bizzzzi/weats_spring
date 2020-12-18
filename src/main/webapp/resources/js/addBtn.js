
function add_item(){
    let div = document.createElement('div');
    let addItemList=document.getElementById('addItemList');   
    div.setAttribute('class','itemform');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    addItemList.appendChild(div);
}


