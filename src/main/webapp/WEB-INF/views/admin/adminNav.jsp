<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="sideMenu">
    <ul>
        <li><a href="${path}/memberList">회원관리</a></li>
        <li><a href="${path}/partnerList">파트너 관리</a></li>
        <li><a href="${path}/adminCheck/AllQuestionList">문의 관리</a></li>
    </ul>
</div>
