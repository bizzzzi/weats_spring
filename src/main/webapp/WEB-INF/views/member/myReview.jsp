<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h2>나의 리뷰 내역</h2>
<c:forEach var="review" items="${reviewList}" varStatus="status">
	<form action="reviewDelete" method="post">
		<div>
			<!-- 메인이미지 넣을공간 -->
			<img src="#" />
			메인 이미지 src : ${review.leports_main_img}<br>
		</div>
		레포츠 타이틀 : ${review.leports_title}<br>
		<c:forEach var="i" begin="1" end="${review.review_star}" step="1">
		<img src="../images/starrate.png" style="background-color:#ff0000; width: 30px; height: 30px;">
		</c:forEach><br>
		리뷰 내용 : ${review.review_comments}<br>
		리뷰 작성일 : ${review.review_regidate}<br>
		<input type="text" name="review_id" style="display: none;" value="${review.review_id}" /> 
		<input type="submit" value="리뷰삭제" />
	</form>
</c:forEach>
