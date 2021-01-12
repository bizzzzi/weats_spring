<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="loginModal hidden">
	<div class="modalOverlay"></div>
	<div id="loginForm">
		<form id="login" action="login" method="POST">
			<div class="title">로그인</div>
			<div class="closeBtn">❌</div>
			<hr>
			<div class="login_info">
				<div class="signRow">
					<input type="email" name="user_email" id="userEmail"
						placeholder="이메일 주소" autofocus/>
				</div>
				<div class="signRow">
					<input type="password" name="user_pw" id="userPasswd" class="userPasswd"
						placeholder="비밀번호" onkeyup="checkCapsLock(event)"/>
				</div>
				<span class="capsLockLogin" style="display: none"><b>CapsLock</b>이 켜져있습니다.</span>
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
					<button type="submit" class="findPwBtn btn btn-lg btn-primary">비밀번호 재설정 메일 받기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/regExp.js"></script>

