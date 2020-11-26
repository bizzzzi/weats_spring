
let cBtn  = document.querySelectorAll(".re_comment_btn");
let cCont = document.querySelectorAll(".comment_cont");
let rdBox = document.querySelectorAll(".recomment_cont");
let rcBtn = document.querySelector(".re_comment_submit");
let rcCont=$("textarea[name='trade_recomment']").val();
var user_id=$("input[name='re_user_id']").val();
var comment_id;
const trade_depth=$("input[name='re_trade_depth']").val();
const trade_id=$("input[name='trade_id']").val();

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
$(".re_comment_btn").on("click",function(event){
	let btn = event.target;
	comment_id = btn.value;
	console.log(comment_id);
	$(".recomment_cont").remove();
	btn.insertAdjacentHTML('afterend',getHtml(trade_id,comment_id,user_id));
})

function getHtml(trade_id,comment_id,user_id){
  var result = '';
  result += "<form class='recomment_cont' method='post'>"+
	        		"<input type='hidden' name='re_trade_id' value='"+trade_id+"'>"+
	        		"<input type='hidden' name='re_trade_depth' value=1>"+
	        		"<input type='hidden' name='re_trade_comment_id' value='"+comment_id+"'>"+
	        		"<input type='hidden' name='re_user_id' value='"+user_id+"'>"+
	        		"<textarea name='trade_recomment' rows='5' cols='100'></textarea>"+
	        		"<button type='button' class='re_comment_submit' onclick='reply(event)'>답글2</button>"+
	        	"</form>";
 return result;
}


function getHtml2(comment_id,trade_comment,comment_regidate,user_id){
  var result = '';
  result += "<div class='comment_cont re'>"+
	        		"<input type='hidden' name='trade_comment_id' value='"+comment_id+"'/>"+
	  				"<strong style='color: #ff0000'>"+user_id+"</strong><br>"+
	        		"<span>"+trade_comment+"</span>"+
	  				"<p>"+comment_regidate+"</p>"+
	  				"<button class='delBtn' data-commentid='"+comment_id+"' onclick='del(event)'>삭제</button>"+
	  				"<button class='updateBtn' data-commentid='"+comment_id+"'>수정</button>";
 return result;
}



	

