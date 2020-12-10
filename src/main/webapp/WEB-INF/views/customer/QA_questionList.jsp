<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <section>
        <h2>나의 문의 내역</h2>
        <div class="qList">
            <ul>
                <li>문의ID</li>
                <li>사용자ID</li>
                <li>문의제목</li>
                <li>문의내용</li>
                <li>등록날짜</li>
                <li>답변여부</li>
            </ul>
        </div>
        <div class="qList">
            <c:forEach var="dto" items="${qnaList}" varStatus="status">
                    <a href="questionDetail?q_group=${dto.question_group}">
                    <ul>
                        <li>${dto.question_id}</li>
                        <li>${dto.user_id}</li>
                        <li>${dto.q_title}</li>
                        <li>${dto.q_content}</li>
                        <li>${dto.q_regidate}</li>
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
            </c:forEach>
        </div>
    </section>
</body>
</html>
