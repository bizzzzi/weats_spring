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
        <h1 class="partner_title">예약 관리</h1>
    </header>
    
    <div class="reservationControl">
	<c:forEach var="dto" items="${leportsList}" varStatus="status">
	    <div class="rs_content">
	         <div class="leports_main_img">
	         	<img src="../images/${dto.leports_main_img}" alt="상품 대표 이미지">
	         </div>
	         <div class="rs_info">   
		         <ul>  
		            <li class="leports_title">${dto.leports_title}</li>
		            <li>예약일 : ${dto.rs_date}</li>
		            <li>인원수 : ${dto.rs_persons}</li>
		            <li>예약자 : ${dto.rs_name}</li>
		            <li>전화번호 : ${dto.rs_phone}</li>
		            <li>가격 : ${dto.rs_price}</li>
		        </ul>
		     </div> 
		</div>    
	</c:forEach>  
	</div>
</body>
</html>