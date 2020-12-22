<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header class="header">
    <h1 class="partner_title">예약자 목록</h1>
  </header>

<%--  	<c:forEach var="idto" items="${itemdto}" varStatus="status">
		<div class="">${idto.leports_item_title}</div><!-- 레포츠 아이템이름출력 -->
	</c:forEach>	 --%>	
			<div class="rsList subject">
				<ul>
					<li>예약아이템</li>
					<li>예약자</li>
					<li>예약일</li>
					<li>인원수</li>
					<li>전화번호</li>
					<li>총 가격</li>
				</ul>
			</div>
		<c:forEach var="rdto" items="${rdto}" varStatus="status">
			<div class="rsList">
		 		<ul>
		 			<li>${rdto.rs_item_title}</li>
		 		 	<li>${rdto.rs_name}</li>
		 			<li>${rdto.rs_date}</li>
		 			<li>${rdto.rs_item_person}</li>
		 			<li>${rdto.rs_phone}</li>
		 			<li>${rdto.rs_item_price}</li>
		 		</ul>
		 	</div>	
 		</c:forEach>
</body>
</html>