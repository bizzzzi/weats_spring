<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>

	<section>
	<div class="qaDetail">
		<input type="hidden" class="path" value="${path}">
		<input type="hidden" class="tomail" value="${dto.user_email}">
		<ul class="qnaList q">
			<li>
				<strong>문의번호</strong>
				<span>${dto.question_id}</span>
			</li>
			<li>
				<strong>USER EMAIL</strong>
				<span>${dto.user_email}</span>
			</li>
			<li>
				<strong>제목</strong>
				<span>${dto.q_title}</span>
			</li>
			<li>
				<strong>글 유형</strong>
				<span>${dto.q_type}</span>
			</li>
			<li>
				<strong>내용</strong>
				<span>${dto.q_content}</span>
			</li>
			<li>
				<strong>예약번호</strong>
				<span>${dto.q_reservation_id}</span>
			</li>
			<li>
				<strong>전화번호</strong>
				<span>${dto.q_phone}</span>
			</li>
			<li>
				<strong>등록일</strong>
				<span>${dto.q_regidate}</span>
			</li>
			<c:if test="${delete <= 1}">
				<a class="btn btn-secondary" href="questinoDelete?question_id=${dto.question_id}">삭제</a>
			</c:if>
		</ul>

		<c:if test="${fn:length(list) != 0}">
			<c:forEach var="qna" items="${list}" varStatus="status">
				<c:choose>
					<c:when test="${qna.user_name eq '관리자'}">
						<ul class="qnaList admin_a">
					</c:when>
					<c:otherwise>
						<ul class="qnaList">
					</c:otherwise>
				</c:choose>
					<li>
						<strong>${qna.user_name}</strong>
						<span class="regidate">${qna.q_regidate}</span>
					</li>
					<li>
						<span>${qna.q_content}</span>
					</li>
				</ul>
			</c:forEach>
		</c:if>
			<!-- 답변등록 -->
			<div class="answer">
				<form class="answerForm" action="questionWrite" method="post">
					<input type="hidden" name="question_group" value="${dto.question_group}">
					<textarea name="q_content" class="answer_content" cols="100" rows="10" placeholder="답변입력"></textarea>
					<input type="submit" value="답변등록">
				</form>
			</div>
	</div>		
	</section>

