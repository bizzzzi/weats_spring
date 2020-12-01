<%@page import="com.dto.LeportsDTO"%>
<%@page import="com.dto.PartnerDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/partner.css">
</head>
<body>
	<header class="header">
		<a href="MainPartner">메인으로 이동</a>
		<h1 class="main_title">상품 등록</h1>
		<hr>
	</header>
	<div class="partner_registration_form wrap">
		<form action="ItemAdd" method="post">
			<input type="hidden" name="leports_id" value="${dto.leports_id}">
			<div class="item_wrap">
				<div class="leports_item_wrap">
					<div class="title">레포츠 아이템 이름</div>
					<input type="text" name="leports_item_title" class="leports_item_title" placeholder="ex) 서핑(2시간)">
					<div class="title">한줄 요약</div>
					<input type="text" name="leports_summary" class="leports_summary" placeholder="ex) 강습시간: 9:30~11:30">
					<div class="title">가격(원)</div>
					<input type="text" name="leports_price" class="leports_price" placeholder="숫자만 입력해주세요.">
					<div class="title">최대 수용 인원</div>
					<input type="number" name="leports_max_capacity" class="leports_max_capacity" placeholder="숫자만 입력해주세요.">
				</div>
			</div>

			<div class="addItemList">
				<!-- leports_item이 추가되는 영역 -->
			</div>
			<input class="addBtn" type="button" value="추가" id="addItem" />
			<p>아래 버튼을 선택하면 개인정보 동의 및 파트너 약관에 동의하는 것입니다.</p>
			<div class="Btn">
				<button class="submitBtn" type="submit">확인 및 제출</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="js/addBtn.js"></script>
</body>
</html>