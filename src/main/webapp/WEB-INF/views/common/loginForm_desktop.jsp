<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="modal hidden">
	<div class="modalOverlay"></div>
	<div id="loginForm">
		<form action="MemberLoginServlet" method="POST">
			<div class="title">로그인</div>
			<div class="closeBtn">❌</div>
			<hr>
			<div class="login_info">
				<div class="signRow">
					<input type="email" name="user_email" id="userEmail"
						placeholder="이메일 주소" />
				</div>
				<div class="signRow">
					<input type="password" name="user_pw" id="userPasswd"
						placeholder="비밀번호" />
				</div>
				<div>
					<button type="submit" class="loginBtn">로그인</button>
				</div>
				<div id="find">
					<a href="#">아이디 찾기</a>&nbsp; <a href="#">비밀번호 찾기</a>
				</div>
			</div>
		</form>
	</div>
</div>
