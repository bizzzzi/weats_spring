<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h1>나의예약내역</h1>
<!-- 예약갯수만큼 반복 출력 -->
<form action="#" method="post">
	<div><!-- 메인이미지 넣을공간 -->
		<img src="#" />
	</div>
	<c:forEach var="item" items="${myReserve}" varStatus="status">
		${item.leports_title}
	</c:forEach>

	레포츠타이틀<br>
	예약날짜<br>
	아이템이름<br>
	업체 주소<br>
	업체 상세주소<br>
	파트너 전화번호<br>
	인원수<br>
	총가격<br>
	<input type="submit" value="예약취소" />
</form>
