<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="reviewWrite">
		<jsp:include page="member/reviewWriteForm.jsp" flush="true"></jsp:include>
	</div>
<script type="text/javascript" src="../js/modal.js"></script>
<script type="text/javascript" src="../js/star.js"></script>
</body>
</html>
