<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="accountContent">
	<div class="account">
	<form>
	
		<div class="userName">
			<span>이름:</span>
			<span>${login.user_name}</span>
		</div>
		<div class="userEmail">
			<span>이메일</span>
			<span>${login.user_email}</span>
		</div>
		<div class="accountMenu">
			<a href="loginCheck/passwdCheck?page=delete">회원탈퇴</a>
			<a href="loginCheck/passwdCheck?page=pwchange">비밀번호 변경</a>
		</div>
	</form>
	</div>
</div>	
