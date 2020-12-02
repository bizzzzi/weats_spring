<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div>
		<jsp:include page="admin/AdminPartnerDetail.jsp" flush="true"></jsp:include>
	</div>
</body>
</html>