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
    <div class="kakaoPayTitle">예약이 완료되었습니다.</div>
    <p>예약내역은 마이페이지 > 나의 예약내역 에서 확인 하실 수 있습니다.</p>
    <div>
        <div class="kakaoPayName">주문 번호 : ${pay_info.partner_order_id}</div>
        <div class="kakaoPayName">예약자 성함 : ${user_info.rs_name}</div>
        <div class="kakaoPayItemName">상품명 : ${pay_info.item_name}</div>
        <div class="kakaoPayTotal">결제금액 : <fmt:formatNumber value="${pay_info.amount.total}" pattern="#,###"/>원</div>
        <div style="font-size: 12px; color: #999999; margin: 10px 0">아래 버튼을 클릭하시면 예약 시 입력한 이메일로 예약 내역이 전송됩니다.</div>
    </div>
    <form class="successMailForm" action="loginCheck/myReservePage" method="get">
        <input type="hidden" class="reservation_id" value="${pay_info.partner_order_id}">
        <input type="hidden" class="rs_email" value="${user_info.rs_email}">
        <input type="hidden" class="rs_name" value="${user_info.rs_name}">
        <input type="hidden" class="rs_item_name" value="${pay_info.item_name}">
        <input type="hidden" class="rs_totalPrice"
               value="<fmt:formatNumber value="${pay_info.amount.total}" pattern="#,###" />">
        <button class="btn btn-primary" type="submit">예약 내역 페이지로 이동</button>
    </form>
</div>
<script src="js/reservationMail.js"></script>
</body>
</html>
