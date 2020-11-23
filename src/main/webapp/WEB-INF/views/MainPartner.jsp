<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	String mesg=(String)session.getAttribute("partnerUpdateMesg");
	if(mesg!=null){
%>    
<script>
alert('<%=mesg%>');
</script>
<%
	}
	session.removeAttribute("partnerUpdateMesg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="partner_main">
	<a href="partner/partnerForm.jsp">파트너 등록</a>
		<ul>
			<li><a href="PartnerMypageSelectServlet">계정관리</a></li>
			<li><a href="partner/productRegistrationForm_leports.jsp">상품등록</a></li>
		</ul>
		<ul>
			<li><a href="ProductControlServlet">등록상품관리</a></li>
			<li><a href="ReservationControl">예약 관리</a></li>
		</ul>
	</div>
</body>
</html>