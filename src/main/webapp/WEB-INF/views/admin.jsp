<%--
  Created by IntelliJ IDEA.
  User: hhhhbbbb
  Date: 2020/12/01
  Time: 6:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
			<li><a href="AdminMember">회원관리</a></li>
			<li><a href="AdminPartner">파트너 관리</a></li>
		</ul>
	</div>
</body>
</html>
