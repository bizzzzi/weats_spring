<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
	
	<div id="admin_main">
		<ul>
			<li><a href="memberList">회원관리</a></li>
			<li><a href="partnerList">파트너 관리</a></li>
		</ul>
	</div>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/modal.js"></script>
	<script type="text/javascript" src="js/signUpForm.js"></script>
</body>
</html>

