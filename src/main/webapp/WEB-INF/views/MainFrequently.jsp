<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weats 고객센터</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/customer.css">
	<link rel="stylesheet" type="text/css" href="css/customer_nav2.css">
	<link rel="stylesheet" type="text/css" href="css/weather_api.css">
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
<style type="text/css">
	a {
		color: black; /* 임시값 나중에 Css 공통수정 */
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="desktop">
			<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
			<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
			<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
			<jsp:include page="weather_api/weather.jsp" flush="true"></jsp:include>
		</div>
		<div id="container">
			<jsp:include page="customer/customerNav.jsp" flush="true"></jsp:include>
			<jsp:include page="customer/QA_Support.jsp" flush="true"></jsp:include>
		</div>
		<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="js/weather_api.js"></script>
</body>
</html>
