<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weats</title>
<link rel="stylesheet" href="../css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/weather_api.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" style="background-color:#f5f6f7;">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
 	    <jsp:include page="weather_api/weather.jsp" flush="true"></jsp:include>		
	</div>
	<div id="trade_write_div">
		<jsp:include page="trade/tradeUpdate.jsp" flush="true"></jsp:include>
	</div>
		<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="../js/modal.js"></script>
<script type="text/javascript" src="../js/signUpForm.js"></script>
<script type="text/javascript" src="../js/fileUpload.js"></script>
<script type="text/javascript" src="../js/weather_api.js"></script>
</body>
</html>
