<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h2 class="myPageTitle">계정 관리</h2>
<div class="accountContent">
	<div class="account">
		<form>
			<div class="userInfo">
				이름: ${login.user_name}
			</div>
			<div class="userInfo">
				이메일: ${login.user_email}
			</div>
			<div class="accountMenu">
				<a href="loginCheck/passwdCheck?page=delete">회원탈퇴</a>
				<a href="loginCheck/passwdCheck?page=pwchange">비밀번호 변경</a>
			</div>
		</form>
	</div>
</div>	
