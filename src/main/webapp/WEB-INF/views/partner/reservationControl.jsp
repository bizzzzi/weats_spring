<%@page import="com.dto.ReservationControlDTO"%>
<%@page import="com.dto.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.LeportsDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="css/partner.css">
</head>
<body>
  <header class="header">
    <a href="MainPartner">메인으로 이동</a>
    <h1 class="main_title">예약 관리</h1>
    <hr>
  </header>
  <div class="reservation_control_table wrap">
    <ul class="thead subject">
      <li>상품 이미지</li>
      <li>상품명</li>
      <li>예약 날짜</li>
      <li>인원 수</li>
      <li>예약한 회원 이름</li>
      <li>연락처</li>
      <li>가격</li>
    </ul>
    <c:forEach var="dto" items="${leportsList}" varStatus="status">
      <ul class="tbody content">
        <li class="leports_main_img"><img src="images/${dto.leports_main_img}" alt="상품 대표 이미지"></li>
        <li class="leports_title">${dto.leports_title}</li>
        <li class="rs_date">${dto.rs_date}</li>
        <li class="rs_persons">${dto.rs_persons}</li>
        <li class="rs_name">${dto.rs_name}</li>
        <li class="rs_phone">${dto.rs_phone}</li>
        <li class="rs_price">${dto.rs_price}</li>
      </ul>
  </div>
  </c:forEach>
</body>
</html>