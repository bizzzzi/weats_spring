<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section>
	<h2>회원관리</h2>
		<div class="qList subject">
			<ul>
				<li>ID</li>
				<li>회원이름</li>
				<li>EMAIL</li>
				<li>이메일 인증여부</li>
				<li>파트너 등록여부</li>
			</ul>
		</div>
		<div class="qList">
		<c:forEach var="dto" items="${memberList}" varStatus="status">
			<ul>
	 			<li>${dto.user_id}</li>
				<li>${dto.user_name}</li>
				<li>${dto.user_email}</li>
				<c:if test="${dto.user_verify eq 1}">
					<li>인증완료</li>
				</c:if>
				<c:if test="${dto.user_verify eq 0}">
					<li>미인증</li>
				</c:if>
				<c:if test="${dto.partner_verify eq 0}">
					<li>일반회원</li>
				</c:if>
				<c:if test="${dto.partner_verify eq 1}">
					<li>등록 대기</li>
				</c:if>
				<c:if test="${dto.partner_verify eq 2}">
					<li>파트너</li>
				</c:if>
			</ul>
		</c:forEach>
		</div>
</section>
