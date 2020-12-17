<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<h3>관리자 페이지</h3>
	<a href="${path}/memberList">회원관리</a>
	<a href="${path}/partnerList">파트너 관리</a>
	<a href="${path}/adminCheck/AllQuestionList">문의 관리</a>
	<a href="${path}/adminCheck/supportWriteForm">Support 등록</a>
    <a href="${path}/adminCheck/supportList">Support 리스트</a>

