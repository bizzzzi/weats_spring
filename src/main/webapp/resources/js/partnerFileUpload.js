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
let partnerForm = $(".partnerform");
let uploadTit = $(".uploadTit");
let inputArr = [];
let count = 0;


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
				if(i === 0){ // 처음 파일 첨부할 경우 - 메인이미지
					$("input[name='partner_license_docs']").val(`${fileCallPath}`);
					str += `<li class="del"><img src="/weats/display?fileName=${fileCallPath}"><span data-name="partner_license_docs" data-file=\'${fileCallPath}\' data-type="image">변경 이미지</span></li>`;
					count++;
					console.log("count: "+count+"\t"+i);
				}
			}else{//처음이 아니면
				ImageDel();
				$("input[name='partner_license_docs']").val(`${fileCallPath}`);
				str += `<li class="del"><img src="/weats/display?fileName=${fileCallPath}"><span data-name="partner_license_docs" data-file=\'${fileCallPath}\' data-type="image">변경 이미지</span></li>`;			
				console.log("count: "+count+"\t"+i);
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

//작성 취소시 첨부한 이미지 삭제
let cancleBtn=document.querySelector(".cancleBtn");
let ImageDel=function(){
	$('.del ').remove();
}
cancleBtn.addEventListener("click",ImageDel);
