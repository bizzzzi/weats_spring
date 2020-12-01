<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="mobile">
		<jsp:include page="common/header_mobile.jsp" flush="true"></jsp:include>
		<jsp:include page="common/navbar_mobile.jsp" flush="true"></jsp:include>
	</div>
	<div id="partnerFormWrap">
		<jsp:include page="partner/partnerForm.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="js/thumbnail.js"></script>
<script type="text/javascript" src="js/addBtn.js"></script>
</body>
</html>