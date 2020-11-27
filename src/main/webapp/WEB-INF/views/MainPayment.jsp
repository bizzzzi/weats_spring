<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제 페이지</title>
  </head>
  <body>
    <h1>결제하기</h1>
    <div class="payment_form_wrap">
      <form action="kakaoPay" method="post">
        <div class="PRODUCT_INFORMATION">
          <h3>상품 정보</h3>
          <ul>
            <!-- class명은 임시입니다~~ -->
            <li class="leports_main_img"><img src="" />${main_img}</li>
            <li class="leports_title">${leports_title}</li>
            <li class="c_address">${c_address}</li>
            <li class="c_detail_address">${c_detail_address}</li>
            <li class="rs_date">${reserveDay}</li>
            <c:forEach var="item" items="${item_title}" varStatus="status">
            	<li class="leports_item_title">${item}</li>
            	<li class="persons">${reserve_count[status.index]}</li>
            	<li class="rs_price">${item_price[status.index]}</li>
            </c:forEach>
          </ul>
        </div>
        <!-- 데이터 넘기는 항목들 -->        
        <input type="text" name="reserveDay" style="display:none;" value="${reserveDay}">
        <input type="text" name="item_title" style="display:none;" value="${item_title}">
        <input type="text" name="totalPersonnelConut" style="display:none;" value="${totalPersonnelConut}">
        <input type="text" name="totalPrice" style="display:none;" value="${totalPrice}">
        <!-- 끝 -->
        <div class="TRAVELER_INFORMATION">
          <h3>여행자 정보</h3>
          예약자명:<input class="rs_name_js" type="text" name="rs_name"/><br />
          연락처:<input class="rs_phone_js" type="text" name="rs_phone" /><br />
          이메일:<input class="rs_email_js" type="text" /><br />
        </div>

        <div class="PAYMETHOD">
          <h3>결제수단</h3>
          <div>
            <input type="radio" name="rs_paymethod" value="신용카드" />
            <label for="신용카드">신용카드</label>
          </div>
          <div>
            <input type="radio" name="rs_paymethod" value="실시간계좌이체" />
            <label for="실시간계좌이체">실시간계좌이체</label>
          </div>
          <div>
            <input type="radio" name="rs_paymethod" value="무통장입금" />
            <label for="무통장입금">무통장입금</label>
          </div>
        </div>

        <div class="RETURN_POLICY">
          <h3>환불 정책</h3>
          <div style="width: 300px">
            <!-- 임시값입니다. -->
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est, at assumenda. Modi exercitationem deserunt omnis magnam ipsa facilis laudantium libero consequatur dicta quam ex facere et,
            accusamus minima in! Perferendis.
          </div>
        </div>

        <div class="PAYMENT_BUTTON">
          아래 버튼을 선택하면 게스트 권리 포기서, 환불 정책 및 게스트 환불 정책에 동의하는 것입니다.<br />
          <button class="paymentBtn" type="submit">${totalPrice}원 확인 및 결제</button>
        </div>
      </form>
    </div>
    <script type="text/javascript" src="../js/payment.js"></script>
  </body>
</html>
