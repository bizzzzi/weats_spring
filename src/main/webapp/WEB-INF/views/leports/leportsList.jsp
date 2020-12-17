<%@page import="com.dto.LeportsThumbnailDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${category != null}">
<c:choose>
<c:when test="${category eq 'byType'}">
<div class="leports_list_menu">
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byType&type=all">전체</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byType&type=지상">지상</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byType&type=수상">수상</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byType&type=항공">항공</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byType&type=실내">실내</a></li>
	</ul>
</div>
</c:when>
<c:otherwise>
<div class="leports_list_menu">
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=all">전체</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=서울">서울</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=인천">인천</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=경기">경기</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=강원">강원</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=충청">충청</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=경상">경상</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=부산">부산</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=전라">전라</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=제주">제주</a></li>
		<li class="nav-item"><a class="nav-link" href="leportsList?category=byLoc&loc=기타">기타</a></li>
	</ul>
</div>
</c:otherwise>
</c:choose>
</c:if>
<!-- 정렬  -->

<div class="leports_list_sort_wrap">
	<form class="form" action="leportsList">
	<input type="hidden" value="${category}" name="category">
	<c:choose>
		<c:when test="${type != null}">
			<input type="hidden" value="${type}" name="type">
		</c:when>
		<c:when test="${loc != null}">
			<input type="hidden" value="${loc}" name="loc">
		</c:when>
	</c:choose>
 		<select class="custom-select-sm mr-5 leports_list_sort" name="selectAlign">
			<option value="defalut" <c:if test="${align eq 'defalut'}"> selected </c:if>>기본순</option>
			<option value="minPrice"<c:if test="${align eq 'minPrice'}"> selected </c:if>>가격 낮은 순</option>
			<option value="maxPrice"<c:if test="${align eq 'maxPrice'}"> selected </c:if>>가격 높은 순</option>
			<option value="review" <c:if test="${align eq 'review'}"> selected </c:if>>리뷰 순</option>
		</select>
	</form>
	
</div>
<div class="leports_items">
	<!-- list for문 돌려서 반복 출력 -->
	<c:forEach var="dto" items="${leportsList}">
	<div class="leports_item">
		<a href="leportsDetail?leports_id=${dto.leports_id}">
			<div>
				<img class="leports_item_images" src="images/${dto.leports_main_img}">
			</div>
			<div>
				<ul class="leports_item_info">
					<li style="display: none">상품 아이디: ${dto.leports_id}</li>
					<li class="leports_item_loc">${dto.leports_loc}</li>
					<li class="leports_item_title">${dto.leports_title}</li>
					<li class="leports_item_summary">${dto.leports_summary}</li>
					<li class="leports_item_review"><span class="leports_item_review_star">★${dto.review_star}</span> ${dto.review_cnt}개</li>
					<li class="leports_item_price">${dto.leports_price}원 / 1인</li>
				</ul>
			</div>
		</a>
	</div>
	</c:forEach>
</div>
<script>
		const align = document.querySelector(".leports_list_sort");
		const form = document.querySelector(".form");
		align.addEventListener('change', () => {
			console.log(form.getAttribute('action'));
			form.submit();
		})
</script>
