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
</head>
<body>
<h1 class="main_title">예약 관리</h1>
  <hr>

  <div class="reservation_control_table">
    <ul class="subject">
      <li>상품 이미지</li>
      <li>상품명</li>
      <li>예약 날짜</li>
      <li>인원 수</li>
      <li>예약한 회원 이름</li>
      <li>연락처</li>
      <li>가격</li>
    </ul>
    
<%-- <%
List<ReservationControlDTO> list=(List<ReservationControlDTO>)session.getAttribute("leportsList");
	
       for(int i=0; i<list.size(); i++){
		ReservationControlDTO dto=list.get(i); 
		
 	String leports_title=dto.getLeports_title();
	String leports_main_img=dto.getLeports_main_img();
	String leports_id=dto.getLeports_id();
	String rs_date=dto.getRs_date();
	String rs_persons=dto.getRs_persons();
	String rs_name=dto.getRs_name();
	String rs_phone=dto.getRs_phone();
	String rs_price=dto.getRs_price(); 

%>  --%>
<c:forEach var="dto" items="${leportsList}" varStatus="status">
    <ul class="content">
      <li class="leports_main_img"><img src="#" alt="상품 대표 이미지">${dto.leports_main_img}</li>
      <li class="leports_title">${dto.leports_title}</li>
      <li class="rs_date"><${dto.rs_date}</li>
      <li class="rs_persons">${dto.rs_persons}</li>
      <li class="rs_name">${dto.rs_name}</li>
      <li class="rs_phone">${dto.rs_phone}</li>
      <li class="rs_price">${dto.rs_price}</li>
    </ul>
 </div>  
</c:forEach>
<%-- <%} %> --%>
</body>
</html>