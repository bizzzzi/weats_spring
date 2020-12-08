<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:if test="${! empty partnermesg}">
	<script>
		alert('${partnermesg}');
	</script>
</c:if>
<c:remove var="partnermesg" scope="session"></c:remove>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>

	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="partner_main">
		<ul>
			<li><a href="partnerCheck/PartnerMypage">계정관리</a></li>
			<li><a href="productRegistrationForm_leports">상품등록</a></li>
		</ul>
		<ul>
			<li><a href="partnerCheck/LeportsAddList">등록상품관리</a></li>
			<li><a href="partnerCheck/ProductResevation">예약 관리</a></li>
		</ul>
	</div>
	
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="js/thumbnail.js"></script>
</body>
</html>
