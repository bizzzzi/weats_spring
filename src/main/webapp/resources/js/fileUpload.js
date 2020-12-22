let trade_type = document.querySelectorAll(".trade_type");
let trade_title = document.querySelector(".trade_title");
let trade_phone = document.querySelector(".trade_phone");
let trade_loc = document.querySelector(".trade_loc");
let trade_contents = document.querySelector(".trade_contents");
let trade_user_name = document.querySelector(".trade_user_name");
let trade_price = document.querySelector(".trade_price");
let trade_main_img = document.querySelector(".trade_main_img");
let tradeSubmit = document.querySelector(".tradeSubmit");

let isChecked = false;
function nullCheck(e){
	for(let i=0; i<trade_type.length; i++){
		if(trade_type[i].checked){
			isChecked = true;
		}
	}
	if(isChecked===false){
		console.log(trade_type)
		alert("카테고리를 선택해주세요")
		e.preventDefault()
	}
	else if(trade_title.value.length===0){
		console.log(trade_title)
		alert("제목을 입력해주세요")
		e.preventDefault()
		trade_title.focus();
	}
	else if(trade_loc.value.length===0){
		alert("지역을 입력해주세요")
		e.preventDefault()
		trade_loc.focus();
	}
	else if(trade_phone.value.length===0){
		alert("연락처를 입력해주세요")
		e.preventDefault()
		trade_phone.focus();
	}
	else if(trade_contents.value.length===0){
		alert("내용을 입력해주세요")
		e.preventDefault()
		trade_contents.focus();
	}
	else if(trade_user_name.value.length===0){
		alert("이름을 입력해주세요")
		e.preventDefault()
		trade_user_name.focus();
	}
	else if(trade_price.value.length===0){
		alert("가격을 입력해주세요")
		e.preventDefault()
		trade_price.focus();
	}
	else if(trade_main_img.value.length===0){
		alert("메인이미지를 선택해주세요")
		e.preventDefault()
		trade_main_img.focus();
	}
}

tradeSubmit.addEventListener("click", nullCheck);

// File 추가
let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
let maxSize = 5242880;

function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과")
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.")
		return false;
	}
	return true;
}

let uploadResult = $(".uploadResult");
let tradeForm = $(".tradeForm");
let uploadTit = $(".uploadTit");
let inputArr = [];
let count = 0;

// 파일 첨부 클릭 시 기존의 첨부파일 갯수 구하기
$('.file').click(function(e){
	count = $(".uploadResult li").length;
})

// 만약 1개가 첨부되어 있을 경우 Count는 1, main_img
// 2개가 첨부되어 있을 경우 Count = 2, main_img, sub_img1
// 3개 첨부 시 count = 3, main_img, sub_img1, sub_img2

// 기존 1개, 2개 첨부 시(i=2)
// 갯수 1 부터 시작
// 기존 2개, 2개 첨부 시
// 갯수 2부터 시작
// 기존 3개, 2개 첨부 시
// 갯수 3부터 시작
// 기존 4개, 4부터 시작
// 기존 5개, 5개부터 시작  / 최대 5장이므로 불가

$('.file').change(function(e){
	let formData = new FormData();
	let inputFile = $("input[name='uploadFile']");
	let files = inputFile[0].files;

	for(let i=0; i<files.length;i++){
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFile",files[i]);
	}

	$.ajax({
		url: getContextPath()+'/fileUploadAjax',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		dataType: 'json',
		success: function(data){
			$('.file').val('');
			showUploadedFile(data);
		}
	});
});

function showUploadedFile(uploadResultArr){
	let str = "";
	let fileImg="";
	$(uploadResultArr).each(function(i,obj){
		let fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		if(!obj.image){
			str+= "<li><img src='/resources/images/attach.png'"+obj.fileName+"</li>";
		}else{
			if(count === 0){
				if(i === 0){
					$("input[name='trade_main_img']").val(`${fileCallPath}`);
					str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_main_img" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
					count++;
					console.log("count: "+count+"\t"+i);
				}else if(i>0 && i <5){
					$("input[name='trade_sub_img"+i+"']").val(fileCallPath);
					//$("input[name='trade_sub_img"+i+"'").val(`'${fileCallPath}'`);
					str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_sub_img${i}" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
					count++;
					console.log("count2: "+count+"\t"+i);
				}
			}else if(count !== 0 && count <5){
				$("input[name='trade_sub_img"+count+"']").val(fileCallPath);
				//$("input[name='trade_sub_img"+i+"'").val(`'${fileCallPath}'`);
				str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_sub_img${count}" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
				count++;
				console.log("count2: "+count+"\t"+i);
			} else{
				alert("이미지 첨부는 최대 5장입니다.")
			}
		}
		console.log("index:"+i);
	});
	uploadResult.append(str);
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

uploadResult.on("click","span",function(e){
	let targetFile = $(this).data("file");
	let type = $(this).data("type");
	let name = $(this).data("name");
	let targetLi = $(this).closest("li");
	console.log(targetFile);
	$.ajax({
		url: getContextPath()+'/deleteFile',
		data: {fileName: targetFile, type:type},
		dataType: 'text',
		type: 'POST',
		success: function(result){
			alert(result);
			targetLi.remove();
			$(`input[name='${name}'`).val("");
		}
	});
})
