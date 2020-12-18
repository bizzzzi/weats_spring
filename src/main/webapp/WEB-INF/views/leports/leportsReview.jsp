<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<hr>
	<div class="review_title" id="href_review">후기</div>
	<c:forEach var="dto" items="${leportsReview}" varStatus="status">
		<hr>
		<div class="review_list" data-value="${status.index}">
			<div class="review_email">${dto.user_email}</div>
			<div>${dto.review_comments}</div>
			<div class="review_regidate">${dto.review_regidate}</div>
		</div>
	</c:forEach>
	<div class="review_btn_wrap">
		<button id="review_list_btn" class="btn btn-outline-secondary" value="0">후기 더 보기</button>
	</div>
</div>
