<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <link rel="stylesheet" href="../css/admin.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sideMenu">
	<ul>
		<li><a href="memberList">회원관리</a></li>
		<li><a href="partnerList">파트너 관리</a></li>
		<li><a href="#">문의 답변</a></li>
	</ul>
</div>	

	<div class="content">
		<h1>사용자 문의</h1>
		<hr>
			<div class="subject">
				<ul>
					<li>문의ID</li>
					<li>사용자ID</li>
					<li>제목</li>
					<li>유형</li>
					<li>답변 여부</li>
				</ul>	
			</div>
			
			<div class="list">
			<c:forEach var="dto" items="${qnaList}" varStatus="status">
						<a href="questionDetail?q_group=${dto.question_group}">
						<ul>
							<li>${dto.question_id}</li>
							<li>${dto.user_id}</li>
							<li>${dto.q_title}</li>
							<li>${dto.q_type}</li>
							<c:choose>
								<c:when test="${dto.answer_verify == 0}">
									<li>답변 대기</li>
								</c:when>
								<c:otherwise>
									<li>답변 완료</li>
								</c:otherwise>
							</c:choose>
						</ul>
						</a>
					</form>
			</c:forEach>
			</div>
	</div>
</body>
</html>
