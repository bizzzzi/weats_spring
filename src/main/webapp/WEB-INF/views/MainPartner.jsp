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
<%-- <%
	String mesg=(String)session.getAttribute("partnerUpdateMesg");
	if(mesg!=null){
%>    
<script>
alert('<%=mesg%>');
</script>
<%
	}
	session.removeAttribute("partnerUpdateMesg");
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	<div id="partner_main">
		<ul>
			<li><a href="PartnerMypage">계정관리</a></li>
			<li><a href="productRegistrationForm_leports">상품등록</a></li>
		</ul>
		<ul>
			<li><a href="LeportsAddList">등록상품관리</a></li>
			<li><a href="ProductResevation">예약 관리</a></li>
		</ul>
	</div>
	
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/signUpForm.js"></script>
<script type="text/javascript" src="js/thumbnail.js"></script>
</body>
</html>