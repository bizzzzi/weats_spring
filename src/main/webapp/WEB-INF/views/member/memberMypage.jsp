<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<h3>마이페이지</h3>
<a href="${path}/MainAccountManagement">계정관리</a>
<a href="${path}/loginCheck/myReservePage">나의 예약내역</a>
<a href="${path}/loginCheck/TradeList">나의 중고거래</a>
<a href="${path}/loginCheck/userQuestionList">나의 문의내역</a>
<a href="${path}/loginCheck/myReview">나의 리뷰</a>
