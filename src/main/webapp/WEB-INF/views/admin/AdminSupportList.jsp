<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <section>
        <h2 class="admin_title">고객센터 Support</h2>
        <div class="qList subject">
            <ul>
                <li>순번</li>
                <li>문의 유형</li>
                <li>질문 제목</li>
                <li>답변 내용</li>
            </ul>
        </div>
        <div class="qList">
        <c:forEach var="support" items="${supportList}" varStatus="status">
            <a href="supportDetail?support_id=${support.support_id}">
                <ul>
                    <li>${status.count}</li>
                    <li>${support.s_type}</li>
                    <li>${support.s_question}</li>
                    <li>${support.s_answer}</li>
                </ul>
            </a>
        </c:forEach>
        </div>
    </section>
