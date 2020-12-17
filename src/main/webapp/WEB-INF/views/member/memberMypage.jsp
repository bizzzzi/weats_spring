<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<a href="${path}/MainAccountManagement">계정관리</a>
<a href="${path}/loginCheck/myReservePage">나의 예약내역</a>
<a href="${path}/loginCheck/TradeList">나의중고거래</a>
<a href="${path}/loginCheck/userQuestionList">나의문의내역</a>
<a href="${path}/loginCheck/myReview">리뷰 관리</a>
