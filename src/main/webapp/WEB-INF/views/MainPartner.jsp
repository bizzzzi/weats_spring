<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${! empty partnermesg}">
	<script>
		alert('${partnermesg}');
	</script>
</c:if>
<c:remove var="partnermesg" scope="session"></c:remove>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/partner.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
	<div id="desktop">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="partnerMain">
		<jsp:include page="partner/partnerSideMenu.jsp" flush="true"></jsp:include>
	</div>
	 <jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</div>	
</body>
</html>
