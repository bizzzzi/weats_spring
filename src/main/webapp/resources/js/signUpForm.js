let useremail=document.querySelector("#signUp .userEmail");
let username=document.querySelector("#signUp .userName"); 
let userpasswd=document.querySelector("#signUp .userPasswd");
let userpasswd2=document.querySelector("#signUp .userPasswd2");
const SignUpBtn=document.querySelector(".SignUpBtn");
let emailCheck = document.querySelector("#result");

//input null체크
function nullCheck(e){
	if(useremail.value.length==0){
		alert("아이디를 입력해주세요");
		useremail.focus();
		e.preventDefault();
	}else if(username.value.length==0){
		alert("이름을 입력해주세요");
		username.focus();
		e.preventDefault();
	}else if(userpasswd.value.length==0){
		alert("비밀번호를 입력해 주세요");
		userpasswd.focus();
		e.preventDefault();
	}else if(userpasswd2.value.length==0){
		alert("비밀번호 확인을 입력해주세요");
		userpasswd2.focus();
		e.preventDefault();
	} else if(emailCheck.innerText == "이메일 중복"){
		alert("이미 가입된 이메일입니다");
		useremail.value = null;
		useremail.focus();
		e.preventDefault();
	} else {
		Check(); //약관동의 체크 메소드
	}
}

//약관 필수체크
function Check(){
	var ck1=document.getElementById("agree_agreement");
	var ck2=document.getElementById("agree_privacyUse");
	
	if(ck1.checked==false){
		alert("회원가입 약관동의 해주세요");
		event.preventDefault();
	}else if(ck2.checked==false){
		alert("개인정보 수집 약관동의 해주세요");
		event.preventDefault();
	}
}


//비밀번호 일치체크 div추가
function passwdCheck(e){
	var str="";
	if(userpasswd.value===userpasswd2.value){
		str="비밀번호가 일치합니다";
		
	}else{
		str="비밀번호가 일치하지 않습니다";	
	}
	document.getElementById("pwCheck").innerHTML=str;
}


//전체 약관선택 체크박스 --onclick="checkall(this)"//class="ck"추가
function checkall(n) {
    var ck=document.querySelectorAll(".ck");
    for(var i=0; i<ck.length; i++){
        ck[i].checked=n.checked;
    }
}



SignUpBtn.addEventListener("click",nullCheck);
userpasswd2.addEventListener("keyup",passwdCheck);

$("#user_email").on("keyup", function() {
	console.log("XXXX");
	$.ajax({
		type : "GET",
		url : "emailCheck", //서버 주소
		data : {
			user_email : $("#user_email").val(), //전송 데이터
		},
		dataType : "text", //응답 데이터 타입
		success : function(data, status, xhr) {
			console.log(data);
			$("#result").text(data);
		},
		error : function(xhr, status, error) {
			console.log("error");
		}
	});
});// end