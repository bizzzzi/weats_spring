<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <section>
        <div class="supportList">
            <%--ex) 고객센터 > ${category}--%>
            <h2>${s_type}</h2>
                <ul class="support_cont">
                <c:forEach var="support" items="${supportList}" varStatus="status">
                    <li><a href="supportDetail?support_id=${support.support_id}">${support.s_question}</a></li>
                </c:forEach>
                </ul>
<%--                <ul class="support_cont">--%>
<%--                    <c:forEach var="list" items="${list}" varStatus="status">--%>
<%--                        <a href="#">${list.question}</a>--%>
<%--                   </c:forEach>--%>
<%--                </ul>--%>
        </div>
    </section>
</div>
