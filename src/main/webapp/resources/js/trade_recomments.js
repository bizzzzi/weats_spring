
let cBtn  = document.querySelectorAll(".re_comment_btn");
let cCont = document.querySelectorAll(".comment_cont");
let rcCont=$("textarea[name='trade_recomment']").val();
var user_id=$("input[name='re_user_id']").val();
var comment_id;
const trade_id=$("input[name='trade_id']").val();

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


function reply(e){
	const dom = e.target;
	console.log("click");
	$.ajax({
		url:"loginCheck/TradeCommentWrite",
		type:"POST",
		data:{
			trade_comment:$("textarea[name='trade_recomment']").val(),
			trade_comment_id:comment_id,
			trade_depth:$("input[name='re_trade_depth']").val(),
			trade_id:trade_id,
		},
		dataType:"json",
		success:function(data){
			console.log(data);
			$(dom).parent().after(getHtml2(data.trade_comment_id,data.trade_comment,data.comment_regidate,data.user_id));
			// $(dom).insertAdjacentHTML('afterend',`
			// 	<div class="comment_cont re" style="margin-left: 20px;">
			// 	<input type="hidden" name="trade_comment_id" value="${data.trade_comment_id}"/>
			// 	<strong style="color: red">${data.user_id}</strong>
			// 	<br>
			// 	<span>${data.trade_comment}</span>
			// 	<p>${data.comment_regidate}</p>
			// 	<button class="delBtn" data-commentid="${data.trade_comment_id}" data-user="user_id">삭제</button>
			// 	<button class="updateBtn" data-commentid="${data.trade_comment_id}" data-user="user_id">수정</button>
			// 	</div>
			// `);
			$(dom).parents().filter(".recomment_cont").remove();
		},
		error:function(xhr,status,error){
			alert("로그인이 필요합니다.");
		}
	});
}
function del(e){
	let btn = e.target;
	let trade_comment_id=$(btn).attr("data-commentid");
	console.log(trade_comment_id);
	$.ajax({
		url:'loginCheck/TradeCommentDelete',
		type:'get',
		data:{
			trade_comment_id:trade_comment_id
		},
		success:function(data){
			$(btn).parent().remove();
		},
		error:function(xhr,status,error){
			alert("error");

		}
	});
}
function update(e){
	let textComment = $("textarea[name='trade_recomment']").text();
	console.log(`${textComment} 이전 댓글`);
	let commentId = $("textarea[name='trade_recomment']").parent("div").attr('id');
	console.log(`commentId: ${commentId}`);

	//$("textarea[name='trade_recomment']").replaceWith(`<span class="commentUpdate">${textComment}</span>`);
	//$("#"+commentId+" > .updateBtn").replaceWith(`<button class="updateBtn" data-commentid="${commentId}" onclick="update(event)">수정</button>`);

	let btn = e.target;
	let trade_comment_id = $(btn).attr("data-commentid");
	let comment = $("#"+trade_comment_id+">"+".commentUpdate").text();


	if($("#"+trade_comment_id+">"+".re_comment_btn")){
		$("#"+trade_comment_id+">"+".commentUpdate").replaceWith(`<textarea name="trade_recomment" rows="5" cols="100">${comment}</textarea>`);
		$("#"+trade_comment_id+">"+".updateBtn").replaceWith(`<button class="updateBtn origin btn btn-secondary" data-commentid="${trade_comment_id}" onclick="updateFin(event)" style="margin-left:4px;">저장</button>`);
		$("#"+trade_comment_id+">"+".re_comment_btn").replaceWith(`<div class="re_comment_btn" value="${trade_comment_id}"></div>`);
	}else{
		$("#"+trade_comment_id+">"+".commentUpdate").replaceWith(`<textarea name="trade_recomment" rows="5" cols="100">${comment}</textarea>`);
		$("#"+trade_comment_id+">"+".updateBtn").replaceWith(`<button class="updateBtn btn btn-secondary" data-commentid="${trade_comment_id}" onclick="updateFin(event)" style="margin-left:4px;">저장</button>`);
	}
}
function updateFin(e){
	let btn = e.target;
	let trade_comment_id = $(btn).attr("data-commentid");
	console.log(trade_comment_id);
	let trade_comment = $("textarea[name='trade_recomment']").val();
	$.ajax({
		url:'loginCheck/TradeCommentUpdate',
		type:'get',
		data:{
			trade_comment_id:trade_comment_id,
			trade_comment:trade_comment
		},
		dataType: 'text',
		success:function(data){
			$("#"+trade_comment_id+"> .comment_regidate").replaceWith(`<p class="comment_regidate">${data}</p>`);
			$("#"+trade_comment_id+">"+"textarea").replaceWith(`<span class="commentUpdate">${trade_comment}</span>`);
			$("#"+trade_comment_id+">"+".updateBtn").replaceWith(`<button class="updateBtn btn btn-secondary" data-commentid="${trade_comment_id}" onclick="update(event)" style="margin-left:4px;">수정</button>`);
			if($(".updateBtn.origin")){
				$("#"+trade_comment_id+">"+".re_comment_btn").replaceWith(`<button class="re_comment_btn" value="${trade_comment_id}" onclick="cowrite(event)" >댓글달기</button>`);

			}
		},
		error:function(xhr,status,error){
			console.log(`trade_comment: ${trade_comment}`)
		}
	});

}
// $(".delBtn").on("click",function(){
// var trade_comment_id=$(this).attr("data-commentid");
// var xxx=$(this);
// $.ajax({
// 	url:'loginCheck/TradeCommentDelete',
// 	type:'get',
// 	data:{
// 		trade_comment_id:trade_comment_id
// 	},
// 	success:function(data){
// 		xxx.text("삭제삭제");
// 		console.log(data);
// 		/*alert("success")*/
// 		xxx.parent().remove();
// 	},
// 	error:function(xhr,status,error){
// 			alert("error");
//
// 		}
// });
// })

$(".delBtn2").on("click",function(){
	var trade_comment_level=$(this).attr("data-commentlevel");
	var xxx=$(this);
	$.ajax({
		url:'loginCheck/TradeCommentDelete',
		type:'get',
		data:{
			trade_comment_level:trade_comment_level,
		},
		success:function(data){
			xxx.parent().remove();
		},
		error:function(xhr,status,error){
			alert("error");

		}
	});
})


// for(const x in cBtn){
// 	cBtn[x].addEventListener('click',function(){
// 		comment_id=cBtn[x].value;
// 		console.log(comment_id);
// 		for(let i in rdBox){
// 			rdBox[i].removeChild();
// 		}
// 		cBtn[x].insertAdjacentHTML('afterend',getHtml(trade_id,comment_id,user_id));
//
// 		/*getHtml(trade_id,comment_id,user_id)*/
//
// 	})
// }
// $(".re_comment_btn").on("click",function(event){
// 	let btn = event.target;
// 	comment_id = btn.value;
// 	console.log(comment_id);
// 	$(".recomment_cont").remove();
// 	btn.insertAdjacentHTML('afterend',getHtml(trade_id,comment_id,user_id));
// })
function cowrite(event){
	let btn = event.target;
	comment_id = btn.value;
	console.log(comment_id);
	$(".recomment_cont").remove();
	btn.insertAdjacentHTML('afterend',getHtml(trade_id,comment_id,user_id));
}

function getHtml(trade_id,comment_id,user_id){
	var result = '';
	result += "<form class='recomment_cont' method='post'>"+
		"<input type='hidden' name='re_trade_id' value='"+trade_id+"'>"+
		"<input type='hidden' name='re_trade_depth' value=1>"+
		"<input type='hidden' name='re_trade_comment_id' value='"+comment_id+"'>"+
		"<input type='hidden' name='re_user_id' value='"+user_id+"'>"+
		"<textarea name='trade_recomment' rows='5' cols='100'></textarea>"+
		"<br><button type='button' class='re_comment_submit btn btn-secondary' onclick='reply(event)'>답글</button>"+
		"</form>";
	return result;
}

function getHtml2(comment_id,trade_comment,comment_regidate,user_id){
	var result = '';
	result += "<div class='comment_cont re' id='"+comment_id+"'>"+
		"<input type='hidden' name='trade_comment_id' value='"+comment_id+"'/>"+
		"<strong>"+user_id+"</strong><br>"+
		"<div class='commentUpdate'>"+trade_comment+"</div>"+
		"<div class='comment_regidate'>"+comment_regidate+"</div>"+
		"<button class='delBtn btn btn-secondary' data-commentid='"+comment_id+"' onclick='del(event)'>삭제</button>"+
		"<button class='updateBtn btn btn-secondary' data-commentid='"+comment_id+"' onclick='update(event)' style='margin-left:4px;'>수정</button>";
	return result;
}

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
$('.file').change(function(e){                            //업로드할 파일을 선택 할 경우 동작을 일으킵니다.
	// uploadResult.empty();
	let formData = new FormData();
	let inputFile = $("input[name='uploadFile']");
	let files = inputFile[0].files;
	//console.log(files);
	for(let i=0; i<files.length;i++){
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFile",files[i]);
	}

	$.ajax({
		url: 'fileUploadAjax',
		processData: false,
		contentType: false,
		data: formData,
		// data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
		type: 'POST',
		dataType: 'json',
		success: function(data){
			$('.file').val('');                           //file input에 들어가 있는 값을 비워줍니다.
			//console.log(data);                      //업로드 되었다면 결과를 콘솔에 출력해봅니다.
			showUploadedFile(data);
			console.log("(ajax)inputArr.length: "+inputArr.length);
			if(inputArr.length===0){
				inputArr.push(data);
				console.log("(ajax2)inputArr.length: "+inputArr.length);
			}
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
			//console.log(`fileCallPath: ${fileCallPath}, uploadPath: ${obj.uploadPath}, uuid: ${obj.uuid}, fileName: ${obj.fileName}`);
			if(inputArr.length === 0){
				console.log("(if===0)inputArr.length: "+inputArr.length);
				if(i===0){
					$("input[name='trade_main_img']").val(`${fileCallPath}`);
					str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_main_img" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
					count++;
					console.log("count: "+count+"\t"+i);
				}else if(i>0 && i<5){
					$("input[name='trade_sub_img"+i+"']").val(fileCallPath);
					//$("input[name='trade_sub_img"+i+"'").val(`'${fileCallPath}'`);
					str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_sub_img${i}" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
					count++;
					console.log("count2: "+count+"\t"+i);
				}
			}else if(inputArr.length!==0 && count<5) {//inputArr.length===0
				console.log("(if!==0)inputArr.length: "+inputArr.length);
				//처음에 3개 첨부 시 main, sub1, sub2 / arr.length==3
				console.log("count3: "+count);
				$("input[name='trade_sub_img"+count+"']").val(fileCallPath);
				str += `<li><img src="/weats/display?fileName=${fileCallPath}"><span data-name="trade_sub_img${count}" data-file=\'${fileCallPath}\' data-type="image">X</span></li>`;
				count++;
			}else{
				alert("이미지 첨부는 최대 5장입니다.")
			}

		}
		console.log("index:"+i);
	});
	uploadResult.append(str);
}
uploadResult.on("click","span",function(e){
	let targetFile = $(this).data("file");
	let type = $(this).data("type");
	let name = $(this).data("name");
	let targetLi = $(this).closest("li");
	console.log(targetFile);
	$.ajax({
		url: 'deleteFile',
		data: {fileName: targetFile, type:type},
		dataType: 'text',
		type: 'POST',
		success: function(result){
			alert(result);
			targetLi.remove();
			$(`input[name='${name}'`).val("");
			count--;
			console.log("count Del: "+count);
			if(count===0){
				inputArr=[];
				console.log("inputArr Del: "+inputArr.length)
			}
		}
	});
})
