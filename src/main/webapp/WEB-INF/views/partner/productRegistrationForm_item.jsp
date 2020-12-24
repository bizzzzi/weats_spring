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
<div id="pre_set" class="itemform" style="display:none;">
			<div class="child" onclick="deleteParent(this)" style="float: right;">❌</div>
			<div class="item_wrap">
				<div class="formBox item">			
					<div class="title">레포츠 아이템 이름</div>
					<input type="text" name="leports_item_title" class="leports_item_title" placeholder="ex) 서핑(2시간)">
				</div>
				<div class="formBox item">		
					<div class="title">한줄 요약</div>
					<input type="text" name="leports_summary" class="leports_summary" placeholder="ex) 강습시간: 9:30~11:30">
				</div>
			</div>
			<div class="item_wrap">
				<div class="formBox item">
					<div class="title">가격(원)</div>
					<input type="number" name="leports_price" class="leports_price" placeholder="숫자만 입력해주세요.">
				</div>
				<div class="formBox item">	
					<div class="title">최대 수용 인원</div>
					<input type="number" name="leports_max_capacity" class="leports_max_capacity" placeholder="숫자만 입력해주세요.">				
				</div>
			</div>	
				
			</div>
	<header class="header">
		<h1 class="main_title">상품 등록</h1>
	</header>
	<div class="partner_form item">
		<form action="LeportsAddDB" method="post" id="ItemAddForm" class="partnerAllForm item">
		<div id="pre_set" class="itemform">
			<div class="item_wrap">
				<div class="formBox item">			
					<div class="title">레포츠 아이템 이름</div>
					<input type="text" name="leports_item_title" class="leports_item_title" placeholder="ex) 서핑(2시간)">
				</div>
				<div class="formBox item">		
					<div class="title">한줄 요약</div>
					<input type="text" name="leports_summary" class="leports_summary" placeholder="ex) 강습시간: 9:30~11:30">
				</div>
			</div>
			<div class="item_wrap">
				<div class="formBox item">
					<div class="title">가격(원)</div>
					<input type="number" name="leports_price" class="leports_price" placeholder="숫자만 입력해주세요.">
				</div>
				<div class="formBox item">	
					<div class="title">최대 수용 인원</div>
					<input type="number" name="leports_max_capacity" class="leports_max_capacity" placeholder="숫자만 입력해주세요.">				
				</div>
			</div>	
				
			</div>
				<div id="addItemList">
					<!-- leports_item이 추가되는 영역 -->
				</div>
	
			<input class="addBtn" type="button" value="추가" id="addItem" />
			
			<div class="partnerBtn form">
				<p>아래 버튼을 선택하면 개인정보 동의 및 파트너 약관에 동의하는 것입니다.</p>
				<input type="submit" value="확인 및 제출">
			</div>
		</form>
	</div>
</body>
</html>