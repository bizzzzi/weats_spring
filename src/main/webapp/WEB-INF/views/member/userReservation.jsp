<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<h2 class="myPageTitle">나의예약내역</h2>
<!-- 예약갯수만큼 반복 출력 -->
<c:forEach var="item" items="${myReserve}" varStatus="status">
    <form class="reservationCancellation" action="passwdCheck" method="get">
    <a href="myReserveDetail?reservation_id=${item.reservation_id}&leports_title=${item.leports_title}" class="reserve_css" style="text-decoration: none;">
        <div class="leportsImg"><!-- 메인이미지 넣을공간 ../images/ -->
            <img src="/weats/display?fileName=${item.leports_main_img}"/>
        </div>
            <%--예약 취소--%>
        <input type="text" name="page" style="display: none" value="reserveCancel"/>
        <div class="itemInfo">
            <div class="reserve_top">
                <span class="top_title">${item.leports_title}</span>
                <span class="top_date">예약일: ${item.rs_date}</span>
            </div>
            <div class="myreserve">
                <span> 예약 번호 : ${item.reservation_id}</span>
                <span> 예약 아이템 : ${item.rs_item_name}</span>
                <span> 주소 : ${item.c_address} - ${item.c_detail_address}</span>
                <span> 파트너 연락처 : ${item.c_phone}</span>
                <span> 예약개수 : ${item.rs_persons}개</span>
                <span> 가격 : <fmt:formatNumber value="${item.rs_price}" pattern="#,###"/>원</span>
            </div>
        </div>
        <input type="hidden" class="review_verify" value="${item.review_verify}"/>
        <input type="hidden" name="rs_price" value="${item.rs_price}"/>
        <input type="hidden" name="reservation_id" value="${item.reservation_id}"/>
        <input type="hidden" name="leports_id" value="${item.leports_id}"/>
        <input class="rs_date" type="hidden" value="${item.rs_date}"/>
        <input name="leports_title" type="hidden" value="${item.leports_title}"/>
        <div class="btn">
            <input class="cancel" type="button" value="예약취소"/>
            <input class="review" type="button" value="리뷰쓰기"/>
        </div>
    </a>
    </form>
</c:forEach>
