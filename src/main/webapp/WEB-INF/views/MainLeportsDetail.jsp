<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weats</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/weather_api.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	    <jsp:include page="weather_api/weather.jsp" flush="true"></jsp:include>
		
	</div>
	<div class="contentsWrap">
	<div id="leports_Detail_Nav">
		<jsp:include page="leports/leportsDetailNav.jsp" flush="true"></jsp:include>
	</div>
	<div id="leports_Detail">
		<jsp:include page="leports/leportsDetail.jsp" flush="true"></jsp:include>
	</div>
		<jsp:include page="leports/leportsReview.jsp" flush="true"></jsp:include>
	</div>
		<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/leportsDetail.js"></script>
<script type="text/javascript" src="js/weather_api.js"></script>
</body>
</html>