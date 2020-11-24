
let cBtn  = document.querySelectorAll(".re_comment_btn");
let cCont = document.querySelectorAll(".comment_cont");
let rdBox = document.querySelector(".recomment_cont");
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
				$(dom).parent().parent().after(`
					<div class="comment_cont re" style="margin-left: 20px;">
					<input type="hidden" name="trade_comment_id" value="${data.trade_comment_id}"/>
					<strong style="color: red">${data.user_id}</strong>
					<br>
					<span>${data.trade_comment}</span>
					<p>${data.comment_regidate}</p>
					</div>
				`);
				$(dom).parents().filter(".recomment_cont").remove();
			},
			error:function(xhr,status,error){
				alert("error");
			}
		});
}

	$(".delBtn").on("click",function(){
	var trade_comment_id=$(this).attr("data-commentid");
	var xxx=$(this);
	$.ajax({
		url:'loginCheck/TradeCommentDelete',
		type:'get',
		data:{
			trade_comment_id:trade_comment_id
		},
		success:function(data){
			xxx.text("삭제삭제");
			console.log(data);
			/*alert("success")*/
			xxx.parent().remove();
		},
		error:function(xhr,status,error){
				alert("error");
				
			}
	});
	})
	
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
			/*alert("success")*/
			console.log(data);
			xxx.parent().remove();
		},
		error:function(xhr,status,error){
				alert("error");
				
			}
	});
	})
	

for(const x in cBtn){
	cBtn[x].addEventListener('click',function(){
		comment_id=cBtn[x].value;
		console.log(comment_id);
		cBtn[x].insertAdjacentHTML('afterend',getHtml(trade_id,comment_id,user_id));
		/*getHtml(trade_id,comment_id,user_id)*/
		
	})
}

function getHtml(trade_id,comment_id,user_id){
  var result = '';
  result += "<form class='recomment_cont' method='post' style='margin-bottom:20px;' >"+
	        		"<input type='hidden' name='re_trade_id' value='"+trade_id+"'>"+
	        		"<input type='hidden' name='re_trade_depth' value=1>"+
	        		"<input type='hidden' name='re_trade_comment_id' value='"+comment_id+"'>"+
	        		"<input type='hidden' name='re_user_id' value='"+user_id+"'>"+
	        		"<textarea name='trade_recomment' rows='5' cols='100'></textarea>"+
	        		"<button type='button' class='re_comment_submit' onclick='reply(event)'>답글2</button>"+
	        	"</form>";
 return result;
}



	

