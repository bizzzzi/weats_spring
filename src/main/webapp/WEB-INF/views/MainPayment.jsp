<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../css/bootstrap.css" /><!-- 부트스트랩 -->
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제 페이지</title>
  </head>
  <body>
  	<div id="wrap">
  	<div id="desktop" style="height: 56px;">
		<jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/loginForm_desktop.jsp" flush="true"></jsp:include>
		<jsp:include page="common/signUpForm_desktop.jsp" flush="true"></jsp:include>
	</div>
    <section class="payment_form_wrap">
      <form class="payment_form" action="kakaoPay" method="post">
    	<h1 class="payment_header_title">결제하기</h1>
    	<div class="payment_contents_wrap">
        <div class="PRODUCT_INFORMATION">
          <h3>상품 정보</h3>
          <div class="payment_leports_item_info">
            <img src="../images/${main_img}" class="img-responsive img-rounded" width="100%;"/>
            <ul>
            	<li class="leports_title">${leports_title}</li>
            	<hr>
            	<li class="rs_date">예약일 : ${reserveDay}</li>
            </ul>
          </div>
           <div class="payment_leports_item_info">
            <c:forEach var="item" items="${item_title}" varStatus="status">
            	<hr>
            	<div class="leports_item_title">${item}</div>
            	<fmt:parseNumber var="test" value="${item_price[status.index] / reserve_count[status.index]}" integerOnly="true"/>
            	<div class="rs_price">${reserve_count[status.index]} X ${test}원<span class="item_total_price">${item_price[status.index]}원</span></div>
            </c:forEach>
          </div>
          <hr>
          <div class="payment_leports_total_price">
          	<span>총 금액</span>
          	<strong>${totalPrice}원</strong>
          </div>
        </div>
        <!-- 데이터 넘기는 항목들 -->        
        <input type="text" name="rs_item_id" style="display:none;" value="${itemId}">
        <input type="text" name="reserveDay" style="display:none;" value="${reserveDay}">
        <input type="text" name="item_title" style="display:none;" value="${item_title}">
        <input type="text" name="rs_item_person" style="display:none;" value="${reserve_count}">
        <input type="text" name="rs_item_price" style="display:none;" value="${item_price}">
        <input type="text" name="totalPersonnelConut" style="display:none;" value="${totalPersonnelConut}">
        <input type="text" name="totalPrice" style="display:none;" value="${totalPrice}">
        <!-- 끝 -->
        <div class="payment_contents">
        <h3>여행자 정보</h3>
        <div class="TRAVELER_INFORMATION">
          <div class="input-group mb-3">
  			<div class="input-group-prepend">
    	    	<span class="input-group-text" id="basic-addon1">예약자</span>
  		    </div>
  			<input type="text" class="form-control rs_name_js" name="rs_name" aria-describedby="basic-addon1">
		  </div>
          <div class="input-group mb-3">
  			<div class="input-group-prepend">
    	    	<span class="input-group-text" id="basic-addon1">연락처</span>
  		    </div>
  			<input type="text" class="form-control rs_phone_js" name="rs_phone" aria-describedby="basic-addon1">
		  </div>
          <div class="input-group mb-3">
  			<div class="input-group-prepend">
    	    	<span class="input-group-text" id="basic-addon1">이메일</span>
  		    </div>
  			<input type="text" class="form-control rs_email_js" aria-describedby="basic-addon1">
		  </div>
        </div>

        <h3>환불 정책</h3>
        <div class="RETURN_POLICY">
          <div>
            (당일여행인 경우)
            <br>
			1) 여행 개시일로부터 3일 이전취소시 : 예약금 100% 환불<br>
			2) 여행 개시일로부터 2일 이전취소시 : 예약금환급 및 여행가의 90% 환불<br>
			3) 여행 개시일로부터 1일 이전취소시 : 예약금환급 및 여행가의 80% 환불<br>
			4) 여행당일 통보 및 통보가 없는 경 : 예약금환급 및 여행가의 70% 환불<br>
			<br>
			(숙박여행인 경우)
			<br>
			1) 여행 개시일로부터 5일 이전취소시 : 예약금 100% 환불<br>
			2) 여행 개시일로부터 2일 이전취소시 : 예약금환급 및 여행가의 90% 환불<br>
			3) 여행 개시일로부터 1일 이전취소시 : 예약금환급 및 여행가의 80% 환불<br>
			4) 여행당일 통보 및 통보가 없는 경 : 예약금환급 및 여행가의 70% 환불<br>
          </div>
        </div>

        <div class="PAYMENT_BUTTON">
          <span style="font-size: 14px;">아래 버튼을 선택하면 게스트 권리 포기서, 환불 정책 및 게스트 환불 정책에 동의하는 것입니다.</span><br />
          <button class="paymentBtn btn btn-primary" type="submit" style="margin-top:15px;">${totalPrice}원 확인 및 결제</button>
        </div>
        </div>
        </div>
      </form>
    </section>
    <jsp:include page="common/footer.jsp" flush="true"></jsp:include>
    </div>
    <script type="text/javascript" src="../js/payment.js"></script>
	<script type="text/javascript" src="../js/modal.js"></script>
	<script type="text/javascript" src="../js/signUpForm.js"></script>
  </body>
</html>
