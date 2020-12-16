<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:choose>
		<c:when test="${fn:contains(path,'adminCheck')}">
			<link rel="stylesheet" type="text/css" href="../css/style.css">
			<link rel="stylesheet" type="text/css" href="../css/customer.css">
			<link rel="stylesheet" type="text/css" href="../css/customer_nav2.css">
			<link rel="stylesheet" href="../css/bootstrap.css" /><!-- 부트스트랩 -->
			<script type="text/javascript" src="../js/bootstrap.js"></script>
		</c:when>
		<c:otherwise>
			<link rel="stylesheet" type="text/css" href="css/style.css">
			<link rel="stylesheet" type="text/css" href="css/customer.css">
			<link rel="stylesheet" type="text/css" href="css/customer_nav2.css">
			<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
			<script type="text/javascript" src="js/bootstrap.js"></script>
		</c:otherwise>
	</c:choose>

<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
<style type="text/css">
	a {
		color: black; /* 임시값 나중에 Css 공통수정 */
	}
</style>
</head>
<body>
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="container">
		<c:choose>
			<c:when test="${fn:contains(path,'adminCheck')}">
				<jsp:include page="admin/adminNav.jsp" flush="true"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="customer/customerNav.jsp" flush="true"></jsp:include>
			</c:otherwise>
		</c:choose>

		<jsp:include page="customer/QA_SupportDetail.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="../js/supportDetail.js"></script>

</body>
</html>
