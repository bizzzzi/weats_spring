//Ajax - getXMLHttpRequest()함수,XMLHttpRequest객체 생성 역

var httpRequest=null;
function getXMLHttpRequest(){
	var httpRequest=null;
	if(window.ActiveXObject){
		try{
			httpRequest=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				httpRequeest=new ActiveObject("Microsoft.XMLHTTP");
			}catch(e2){
				httpRequest=null;
			}
		}
	}
	else if(window.XMLHttpRequest){
		httpRequest=new window.XMLHttpRequest();
	}
	return httpRequest;
}

function writeCmt(){
	var form=document.getElementById("writeCommentForm");
	//게시글번호, 댓글내용, 댓글 작성자 정보 변수에 저장
	var board=form.comment_board.value
	var id=form.comment_id.value
	var content=form.comment_content.value;
	
	//내용 입력 유무 확
	if(!content){
		alert("내용을 입력하세요");
		return false;
	}else{
		//서버에 전달
		//게시글번호, 댓글 내용, 댓글 작성자
		var param="comment_board"+board+"&comment_id"+id+"&comment_content"+content;
		httpRequest=getXMLHttpRequest();
		httpRequest.onreadystatechange=checkFunc;//상태 변화시 호출될 함수 지정
		httpRequest.open("POST","CommentWriteAction",true);//전송 방식, 전송 경로, 동기/비동기 지정
		httpRequest.setRequestHeader('Content-Type',"application/x-www-form-urlencoded;charset=EUC-KR");
		httpRequest.send(param);//서버로 파라미터 전송
	}
}

	function checkFunc(){
		if(httpRequest.readyState==4){//결과를 받았을 경우 실행
			var resultText=httpRequest.responseText;
			if(resultText==1){//상세보기 화면 새로고침
				document.location.reload();
			}
		}
	}