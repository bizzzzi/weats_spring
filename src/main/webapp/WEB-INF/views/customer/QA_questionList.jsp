<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <section>
        <h2>나의 문의 내역</h2>
        <div class="qList">
            <ul>
                <li>문의ID</li>
                <li>문의제목</li>
                <li>문의내용</li>
                <li>등록날짜</li>
            </ul>
        </div>
        <div class="qList">
            <c:forEach var="dto" items="${myQnalist}" varStatus="status">
                <ul>
                    <a href="MyQuestionList?qID=${dto.question_id}">
                        <li>${dto.question_id}</li>
                        <li>${dto.q_title}</li>
                        <li>${dto.q_content}</li>
                        <li>${dto.q_regidate}</li>
                    </a>
                </ul>
            </c:forEach>
        </div>
    </section>
