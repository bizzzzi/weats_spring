<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h2>나의 리뷰 내역</h2>
<c:forEach var="review" items="${reviewList}" varStatus="status">
	<form class="myReviewForm" action="reviewDelete" method="post">
		<div class="leportsImg">
			<img src="#" /><%-- 메인 이미지 src : ${review.leports_main_img}<br> --%>
		</div>
		<div class="itemInfo">
			<div class="myreview_top">
				<span class="top_title">${review.leports_title}</span>
				<span class="review_star">
					<c:forEach var="i" begin="1" end="${review.review_star}" step="1">
					<img src="../images/starrate.png" style="background-color:#ff0000; width: 30px; height: 30px;">
					</c:forEach>
				</span>
			</div>		
				<div class="myreview_bottom">
					<span class="review_content">리뷰 내용 <br>${review.review_comments}</span>
					작성일 : ${review.review_regidate}<br>
				</div>
			</div>
			<input type="text" name="review_id" style="display: none;" value="${review.review_id}" />
			<input type="text" name="leports_id" style="display: none;" value="${review.leports_id}" />
			<input type="text" name="reservation_id" style="display: none;" value="${review.reservation_id}" />
			<input type="text" name="review_verify" style="display: none;" value="${review.review_verify}" />
			<div class="btn">
				<input type="submit" value="리뷰삭제" />
			</div>
	</form>
</c:forEach>
