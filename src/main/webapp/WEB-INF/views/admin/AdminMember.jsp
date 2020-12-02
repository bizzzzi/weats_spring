<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
<style type="text/css">
	a {
		color: black; /* 임시값 나중에 Css 공통수정 */
	}
</style>
</head>
<body>
	
	<div id="desktop">
		<jsp:include page="../common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="mobile">
		<jsp:include page="../common/header_mobile.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/navbar_mobile.jsp" flush="true"></jsp:include>
	</div>
	
	<h1>회원관리</h1>
	<hr>

	<div class="subject">
		<ul>
			<li>ID</li>
			<li>회원이름</li>
			<li>EMAIL</li>
			<li>이메일 인증여부</li>
			<li>파트너 등록여부</li>
		</ul>
	</div>

	<c:forEach var="dto" items="${memberList}" varStatus="status">
		<ul>
 			<li>${dto.user_id}</li>
			<li>${dto.user_name}</li>
			<li>${dto.user_email}</li>
			<li>${dto.user_verify}</li>
			<li>${dto.partner_verify}</li>
		</ul>
	</c:forEach>	
</body>
</html>
