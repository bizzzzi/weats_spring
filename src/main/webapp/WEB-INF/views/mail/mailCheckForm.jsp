<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weats</title>
</head>
<body>
<c:if test="${sessionScope.tomail != null}">
	<c:set var="user_email" value="${sessionScope.tomail}"/>
</c:if>
	<div id="mailCheckForm">
		<div class="mailCheckTitle">이메일 인증</div>
		<p>
			인증 메일이 <span class="mailCheckFormEmail">${user_email}</span> (으)로
			전송되었습니다.
		</p>
		<p>메일을 확인해주세요.</p>
		<button onclick="location.href='/weats/'">확인</button>
	</div>
</body>
</html>
