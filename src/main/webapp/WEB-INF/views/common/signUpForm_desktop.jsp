<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="regExpPw" value="^\S(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$"/>
<c:set var="regExpEmail" value="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$"/>
<div class="signUpModal hidden">
	<div class="modalOverlay2"></div>
	<div id="signUpForm">
		<%--비밀번호 찾기 메일 전송 jsp 만들어야 함--%>
		<form id="userJoin" action="mailCheck" method="POST">
			<div id="signUp">
				<div class="title">회원가입</div>
				<div class="closeBtn2">❌</div>
				<hr>
				<div class="signRow">
					<input type="text" name="user_email" class="userEmail" id="user_email"
						placeholder="이메일 주소(아이디)" pattern="${regExpEmail}"
						title="올바른 이메일 형식이 아닙니다."/>
						<span id="result" style="display:none"></span>
				</div>
				<div class="signRow">
					<input type="text" name="user_name" class="userName" id="user_name"
						placeholder="이름(예:홍길동)" />
				</div>
				<div class="signRow">
					<input type="password" name="user_pw" class="userPasswd" id="user_pw"
						   placeholder="비밀번호(공백을 제외한 영문, 숫자 혹은 특수문자 2가지 조합 8~15자)"
						   pattern="${regExpPw}" title="공백을 제외한 영문, 숫자, 특수문자 2가지 조합 8~15자"/>
				</div>
				<div class="signRow"> 
					<input type="password" name="user_pw2" class="userPasswd2"
						placeholder="비밀번호를 한번 더 입력해주세요." />
				</div>
				<div id="pwCheck"></div>
			</div>
			<div id="전체약관동의">
				<input type="checkbox" class="" name="agreeAll" id="agreeAll"
					value="true" onclick="checkall(this)"/> <strong>&nbsp;전체 약관 동의&nbsp;</strong>
			</div>
			<div class="TermPopup">
				<input type="checkbox" id="agree_agreement" class="ck">
				<div role="button" tabindex="0">&nbsp;회원가입 및 약관 동의(필수)&nbsp;</div>
				<div class="arrowBtn">
					<i class="fas fa-play"></i>
				</div>
			</div>
			<div class="TermPopup">
				<input type="checkbox" id="agree_privacyUse" class="ck">
				<div role="button" tabindex="0">&nbsp;개인정보 수집 및 이용(필수)&nbsp;</div>
				<div class="arrowBtn">
					<i class="fas fa-play"></i>
				</div>
			</div>
			<button type="submit" class="SignUpBtn">회원가입</button>
		</form>
	</div>
</div>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
