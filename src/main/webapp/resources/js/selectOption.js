let sel=document.querySelector("#locSelect");
let loc=document.querySelector("#leports_loc");
let myloc="";

(function selected(){
	for(var i=0; i<sel.options.length; i++){
		myloc=sel[i].value;
		if(loc.value===myloc){
				sel.options[i].selected=true;
			}
	}

})();
let selType=document.querySelector("#typeSelect");
let type=document.querySelector("#leports_type");
let mytype="";

(function typeSelect(){
	for(var i=0; i<selType.options.length; i++){
		mytype=selType[i].value;
		if(type.value===mytype){
				selType.options[i].selected=true;
			}
	}

})();


