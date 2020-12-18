<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

    <section>
    <c:choose>
        <c:when test="${fn:contains(path,'adminCheck')}">
            <div class="supportList">
                <div class="support_cont">
                    <form class="supportForm" action="" method="post">
                        <span><input type="text" name="s_question" value="${support.s_question}"/> </span>
                        <span><input type="text" name="s_answer" value="${support.s_answer}"/></span>

                        <input type="hidden" name="support_id" value="${support.support_id}"/>
                        <div class="qa_submit adminBtn">
	                        <input class="supportUpdate" type="button" value="수정"/>
	                        <input class="supportDelete" type="button" value="삭제"/>
	                    </div>    

                    </form>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="supportList">
                <a href="supportList?s_type=${support.s_type}">고객센터 > ${support.s_type}</a>
                <div class="support_cont">
                    <h2>${support.s_question}</h2>
                    <span>${support.s_answer}</span>
                </div>
            </div>

            <div class="how_footer">
                <h2>weats에 더 궁금한 점이 있으신가요?</h2>
                <a href="${rootPath}/supportList?s_type=자주 묻는 질문">자주 묻는 질문 확인하기</a>
            </div>
        </c:otherwise>
    </c:choose>


    </section>
</div>
