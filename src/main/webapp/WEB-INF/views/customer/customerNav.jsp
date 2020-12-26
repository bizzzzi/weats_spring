<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    <div class="customer_btn">
        <div class="customer_con">
            <form action="${path}/supportSearch">
                <div class="search">
                        <input type="text" name="search" placeholder="이 곳에 물어보세요." pattern=".{2,}" title="검색어를 두 글자 이상 입력하세요.">
                        <input type="submit" value="검색">
                </div>
                <a href="${path}/loginCheck/QA_question">1:1 문의하기</a>
            </form>
        </div>
    </div>
    <div class="customer_nav">
        <ul>
            <li><a href="${path}/QA_howToUse"><span>이용방법</span></a></li>
            <li><a href="${path}/supportList?s_type=자주 묻는 질문"><span>자주묻는질문</span></a></li>
            <li><a href="${path}/supportList?s_type=파트너 등록 문의"><span>파트너 등록 문의</span></a></li>
            <li><a href="${path}/supportList?s_type=결제 취소 문의"><span>결제 / 취소 문의</span></a></li>
            <li><a href="${path}/supportList?s_type=기타 문의"><span>기타 문의</span></a></li>
            <li><a href="${path}/loginCheck/userQuestionList"><span>나의 문의 내역</span></a></li>
        </ul>
    </div>

