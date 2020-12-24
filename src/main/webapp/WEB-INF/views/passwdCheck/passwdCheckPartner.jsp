<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:if test="${mesg != null}">
	<script> alert("${mesg}")</script>
</c:if>
<c:remove var="mesg" scope="session" />
	<div id="passwdCheckContainer">
		<form id="passwdCheckForm" action="passwdCheckPartner" method="post">
			<div class="logo">로고</div>
			<div class="title">시작하기</div>
			<div class="useremail">${login.user_email}</div>
			<div class="comment">계속하려면 먼저 본인임을 인증하세요.</div>
			<div class="signRow">
				<input type="password" name="user_pw" class="userPasswd userPasswdReg" placeholder="비밀번호 입력" onkeyup="checkCapsLock(event)"/>
				<div class="capsLockDiv" style="display: none"><b>CapsLock</b>이 켜져있습니다.</div>
			<div class="buttonWrap">
				<button type="submit">확인</button>
			</div>
			</div>
		</form>
	</div>
	<script>
	const btn = document.querySelector("button");
	btn.addEventListener('click', (e) => {
	if('${page}' === "partnerUpdate") {
		if(confirm("파트너 정보를 수정하시겠습니까?") == false) {
			e.preventDefault();
		}
	}else if('${page}' === "partnerDelete"){
		if(confirm("정말 파트너 탈퇴하시겠습니까?") == false) {
			e.preventDefault();
		}
	}else if('${page}' === "productDelete"){
		if(confirm("상품을 삭제 하시겠습니까?") == false) {
			e.preventDefault();
		}
	}
	})
	</script>
<script type="text/javascript" src="js/regExp.js"></script>
</body>
</html>
