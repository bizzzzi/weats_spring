<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
<c:if test="${!empty mesg }"> <!-- /memberAdd -->
	<script>alert("${mesg}")</script> <!-- 회원가입, 로그인 시 mesg넘어옴(addFlashAttribute) -->
</c:if>
<c:remove var="mesg" scope="session"></c:remove>
</head>
<body>

	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="main_contents">
		<video autoplay="autoplay" loop="loop" muted="muted">
			<source src="video/main.mp4" type="video/mp4">
		</video>
	</div>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
</body>
</html>