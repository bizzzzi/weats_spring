<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
<c:if test="${!empty mesg }">
	<script>alert("${mesg}")</script>
</c:if>
<div id="wrap">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="myPageWrap">
		<div id="mypageSideMenu">
			<jsp:include page="member/memberMypage.jsp" flush="true"></jsp:include>
		</div>
		<div id="mypageContent">
			<jsp:include page="member/userReservation.jsp" flush="true"></jsp:include>
		</div>
	</div>
	<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</div>
<script type="text/javascript" src="../js/modal.js"></script>
<script type="text/javascript" src="../js/userReservation.js"></script>
</body>
</html>
