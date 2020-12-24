<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weats</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css"/><!-- 부트스트랩 -->
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="kakaoPaySuccess">
    <div class="kakaoPayTitle">예약이 취소되었습니다.</div>
    <div>
        <div class="kakaoPayName">&nbsp;주문 번호 : ${cancel_info.partner_order_id}</div>
        <div class="kakaoPayItemName"> 상품명 : ${cancel_info.item_name}</div>
        <div class="kakaoPayTotal">취소 금액 : <fmt:formatNumber value="${cancel_info.amount.total}" pattern="#,###"/></div>
        <div style="font-size: 12px; color: #999999; margin: 10px 0">아래 버튼을 클릭하시면 로그인 된 이메일로 예약 내역이 전송됩니다.</div>
    </div>
    <form class="cancelMailForm" action="loginCheck/myReservePage" method="get">
        <input type="hidden" class="reservation_id" value="${cancel_info.partner_order_id}">
        <input type="hidden" class="rs_email" value="${login.user_email}">
        <input type="hidden" class="rs_item_name" value="${cancel_info.item_name}">
        <input type="hidden" class="rs_totalPrice"
               value="<fmt:formatNumber value="${cancel_info.amount.total}" pattern="#,###" />">
        <button class="btn btn-primary" type="submit">예약 내역 페이지로 이동</button>
    </form>
</div>
<script src="js/reservationMail.js"></script>
</body>
</html>

