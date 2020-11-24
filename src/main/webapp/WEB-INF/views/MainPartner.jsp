<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:if test="${! empty mesg}">
	<script>
		alert('${mesg}');
	</script>
</c:if>
	
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
</head>
<body>
	<div class="partner_main">
		<ul>
			<li><a href="PartnerMypage">계정관리</a></li>
			<li><a href="productRegistrationForm_leports">상품등록</a></li>
		</ul>
		<ul>
			<li><a href="ProductControlServlet">등록상품관리</a></li>
			<li><a href="ReservationControl">예약 관리</a></li>
		</ul>
	</div>
</body>
</html>