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
    <h1 class="partner_title">예약관리</h1>
  </header>
    <div class="leportsProducts">
    	<c:forEach var="ldto" items="${leportsAddList}" varStatus="status">
    	<input type="hidden" name="leports_id" value="${ldto.leports_id}" />
    	<div class="partner_list">
    		<a href="../DetailResevation?leports_id=${ldto.leports_id}">  			 
	      		<div class="partner_main_img">
	      			<img src="/weats/display?fileName=${ldto.leports_main_img}" alt="상품 대표 이미지">
	      		</div>
				<div class="partner_item_info">${ldto.leports_title}</div>	
			</a>
		</div>	
 		</c:forEach>
 	</div>		
</body>
</html>