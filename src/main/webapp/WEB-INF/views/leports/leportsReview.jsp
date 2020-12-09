<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<b>후기</b>
	<c:forEach var="dto" items="${leportsReview}" varStatus="status">
		<div class="review_list" data-value="${status.index}"
			style='border: 1px solid black; width: 100%'>
			<div class="review_email">${dto.user_email}</div>
			<div>${dto.review_comments}</div>
			<div>${dto.review_regidate}</div>
		</div>
	</c:forEach>
	<button id="review_list_btn" value="0">후기 전체보기</button>
</div>
