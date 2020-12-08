<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h1>나의예약내역</h1>
<!-- 예약갯수만큼 반복 출력 -->
<c:forEach var="item" items="${myReserve}" varStatus="status">
<form class="reservationCancellation" action="passwdCheck" method="get">
   <div class="leportsImg"><!-- 메인이미지 넣을공간 -->
      <img src="${item.leports_main_img}" />
   </div>
   <%--예약 취소--%>
   <input type="text" name="page" style="display: none" value="reserveCancel"/>
   <div class="itemInfo">
	  
	   <div class="reserve_top"> 
	   		<span class="top_title">${item.leports_title}</span>
	   		<span class="top_date">예약일: ${item.rs_date}</span>
	   </div>
	   <div class="myreserve">	
		  	<span class="content"> 예약 아이템 : ${item.rs_item_name}</span>
		 	<span class="content">  주소 : ${item.c_address}</span>
		  	<span class="content"> 상세주소 : ${item.c_detail_address}</span>
		  	<span class="content"> 파트너 연락처 : ${item.c_phone}</span>
			<span class="content">   예약인원 : ${item.rs_persons}명</span>
		  	<span class="content"> 가격 : ${item.rs_price}원</span>
	   </div>
	</div>
   <input type="hidden" class="review_verify" value="${item.review_verify}"/>
   <input type="hidden" name="rs_price" value="${item.rs_price}"/>
   <input type="hidden" name="reservation_id" value="${item.reservation_id}" />
   <input type="hidden" name="leports_id" value="${item.leports_id}"/>
   <input class="rs_date" type="hidden" value="${item.rs_date}"/>
   <input name="leports_title" type="hidden" value="${item.leports_title}"/>
   <div class="btn">
	   <div class=reserveBtn><input class="cancel" type="button" value="예약취소" /></div>
	   <div class=reserveBtn><input class="review" type="button" value="리뷰쓰기" /></div>
   </div>
</form>
</c:forEach>
