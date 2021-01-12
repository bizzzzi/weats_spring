<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <section>
        <div class="supportList">
            <h2>다음에 대한 검색 결과: "${search}"</h2>
            검색 결과 : ${fn:length(supportList)}개
            <ul class="support_cont">
                <c:forEach var="support" items="${supportList}" varStatus="status">
                    <li><a href="supportDetail?support_id=${support.support_id}"><strong>${support.s_type}</strong>${support.s_question}</a></li>
                </c:forEach>
            </ul>
        </div>
    </section>
