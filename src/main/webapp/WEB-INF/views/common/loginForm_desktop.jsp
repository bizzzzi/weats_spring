<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="loginModal hidden">
	<div class="modalOverlay"></div>
	<div id="loginForm">
		<form action="login" method="POST">
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
					<button type="submit" class="loginBtn btn btn-lg btn-primary">로그인</button>
				</div>
				<div id="find">
					<span id="findPw" style="cursor: pointer">비밀번호 찾기</span>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div class="findPwModal hidden">
	<div class="modalOverlay3"></div>
	<div id="findPwForm">
		<form id="ajax_findPw" action="mailCheck" method="post">
			<div class="title">비밀번호찾기</div>
			<div class="closeBtn3">❌</div>
			<hr>
			<div class="findPw_info">
				<div class="signRow">
					<input type="email" name="user_email" class="userEmail"
						placeholder="이메일 주소" />
						<span id="findEmailResult" style="display:none"></span>
				</div>
				<div>
					<button type="submit" class="findPwBtn btn btn-lg btn-primary">비밀번호 재설정 링크 보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
