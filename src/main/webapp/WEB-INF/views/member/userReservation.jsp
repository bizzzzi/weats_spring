<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h1>나의예약내역</h1>
<!-- 예약갯수만큼 반복 출력 -->
<c:forEach var="item" items="${myReserve}" varStatus="status">
<form class="reservationCancellation" action="passwdCheckPage" method="get">
   <div><!-- 메인이미지 넣을공간 -->
      <img src="${item.leports_main_img}" />
   </div>
   <input type="text" name="reservation_id" style="display:none" value="${item.reservation_id}" />
   <input type="text" name="rs_price" style="display:none" value="${item.rs_price}" />

   <input type="text" name="page" style="display: none" value="reserveCancel"/>
   ${item.reservation_id}<br>
   ${item.leports_title}<br>
   ${item.rs_date}<br>
   ${item.rs_item_name}<br>
   ${item.c_address}<br>
   ${item.c_detail_address}<br>
   ${item.c_phone}<br>
   ${item.rs_persons}<br>
   ${item.rs_price}<br>
   <input class="rs_date" type="hidden" value="${item.rs_date}"/>
   <input name="leports_title" type="hidden" value="${item.leports_title}"/>
   <input class="cancel" type="button" value="예약취소" />
   <input class="review" type="button" value="리뷰쓰기" />
</form>
</c:forEach>
