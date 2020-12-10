<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Weats QnA</title>
	<link rel="stylesheet" href="../css/bootstrap.css" /><!-- 부트스트랩 -->
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/customer.css">
	<link rel="stylesheet" type="text/css" href="../css/customer_nav2.css">
	<link rel="stylesheet" type="text/css" href="../css/admin.css">
	<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"></c:set>
	<div id="container">
		<c:if test="${fn:contains(path,'adminCheck')}">
			<jsp:include page="admin/adminNav.jsp" flush="true"></jsp:include>
		</c:if>
		<jsp:include page="customer/customerNav.jsp" flush="true"></jsp:include>
		<jsp:include page="customer/QA_question.jsp" flush="true"></jsp:include>
	</div>
</div>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
</body>
</html>