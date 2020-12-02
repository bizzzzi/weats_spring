<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<jsp:include page="../common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
	<div id="mobile">
		<jsp:include page="../common/header_mobile.jsp" flush="true"></jsp:include>
		<jsp:include page="../common/navbar_mobile.jsp" flush="true"></jsp:include>
	</div>
	
	<h1>파트너 관리</h1>
	<hr>
	
	<div class="subject">
		<ul>
			<li>업체명</li>
			<li>주소</li>
			<li>전화번호</li>
			<li>사업자 번호</li>
			<li>사업자 문서</li>
			<li>파트너 승인여부</li>
		</ul>
	</div>
	
	<c:forEach var="dto" items="${PartnerList}" varStatus="status">
		<ul>
			<li>${dto.c_name}</li>
			<li>${dto.c_postnum} ${dto.c_address} ${dto.c_detail_address}</li>
			<li>${dto.c_partner_license_num}</li>
			<li><img src="${dto.partner_license_dosc}"></li>
<%--			<li>${dto.partner_verify}</li>--%>
		</ul>	
	</c:forEach>
	
</body>
</html>
