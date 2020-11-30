<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="passwdChangeContainer">
		<form id="passwdChangeForm" action="MemberPasswdChange" method="post">
			<div class="logo">로고</div>
			<div class="title">비밀번호 변경</div>
			<div class="comment">변경할 비밀번호를 입력하세요</div>
			<div class="signRow">
				<input type="password" name="new_pw" class="userPasswd1"
					placeholder="비밀번호 입력" />
			</div>
			<div class="signRow">
				<input type="password" name="new_pw" class="userPasswd2"
					placeholder="비밀번호 입력" />
			</div>
			<div class="pwCheck"></div>
			<div class="buttonWrap">
				<button type="submit">확인</button>
			</div>
		</form>
	</div>
	<script>
		const pw1 = document.querySelector(".userPasswd1");
		const pw2 = document.querySelector(".userPasswd2");
		const pwCheck = document.querySelector(".pwCheck");
		const btn = document.querySelector("button");
		
		let mesg = "";
		pw2.addEventListener("keyup", () => {
			if(pw1.value !== pw2.value) {
				mesg = "비밀번호가 일치하지 않습니다.";
			} else if(pw1.value === pw2.value){
				mesg = "비밀번호가 일치합니다.";
			};
			pwCheck.innerText = mesg;
		});
		
		btn.addEventListener("click", (e) => {
			if(pwCheck.innerText === "비밀번호가 일치하지 않습니다.") {
				alert("비밀번호를 확인해주세요.");
				pw2.value = null;
				pw2.focus();
				e.preventDefault();
			};
		});
	</script>
</body>
</html>