<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="css/admin.css">
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
	</ul>
</div>	
	<div class="content">
		<div class="question">
			<span class="q_subject">USER ID</span>
			<span class="q_content">${dto.user_id}</span>
			<span class="q_subject">제목</span>
			<span class="q_content">${dto.q_title}</span>
			<span class="q_subject">글 유형</span>
			<span class="q_content">${dto.q_type}</span>
			<span class="q_subject">내용</span>
			<span class="q_content">${dto.q_content}</span>
			<span class="q_subject">예약번호</span>
			<span class="q_content">${dto.q_reservation_id}</span>
			<span class="q_subject">전화번호</span>
			<span class="q_content">${dto.q_phone}</span>
			<span class="q_subject">등록일</span>
			<span class="q_content">${dto.q_regidate}</span>
		</div>
		<!-- 답변등록 -->
		<div class="answer">	
			<form action="#">
				<input type="hidden" name="question_id" value="${dto.question_id}">
				<textarea name="answer_content" class="answer_content" cols="100" rows="10" placeholder="답변입력"></textarea>
				<input type="submit" value="답변등록">
			</form>
		</div>
	</div>
</body>
</html>