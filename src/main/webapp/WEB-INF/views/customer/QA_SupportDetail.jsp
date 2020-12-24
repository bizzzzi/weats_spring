<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

    <section>
            <div class="supportList">
                <a href="supportList?s_type=${support.s_type}">고객센터 > ${support.s_type}</a>
                <div class="support_cont">
                    <h2>${support.s_question}</h2>
                    <span>${support.s_answer}</span>
                </div>
            </div>

            <div class="how_footer">
                <h2>Weats에 더 궁금한 점이 있으신가요?</h2>
                <a href="${rootPath}/supportList?s_type=자주 묻는 질문">자주 묻는 질문 확인하기</a>
            </div>
    </section>
