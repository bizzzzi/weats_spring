<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/customer.css">
	<link rel="stylesheet" type="text/css" href="../css/admin.css">
	<link rel="stylesheet" type="text/css" href="../css/customer_nav2.css">
	<link rel="stylesheet" href="../css/bootstrap.css" /><!-- 부트스트랩 -->
	<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="adminPageWrap">
		<div id="SideMenu">
			<jsp:include page="admin/adminNav.jsp" flush="true"></jsp:include>
		</div>
		<div id="adminContent">	
			<jsp:include page="admin/AdminSupportList.jsp" flush="true"></jsp:include>
		</div>	
	</div>
		<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</div>	

</body>
</html>
