<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제 페이지</title>
  </head>
  <body>
  <%
  	String totalPrice = (String)request.getAttribute("totalPrice"); 
	String main_img = (String)request.getAttribute("main_img");
  %>
    <h1>결제하기</h1>
    <div class="payment_form_wrap">
      <form>
        <div class="PRODUCT_INFORMATION">
          <h3>상품 정보</h3>
          <ul>
            <!-- class명은 임시입니다~~ -->
            <li class="leports_main_img"><img src="" /><%=main_img %>레포츠 메인 이미지</li>
            <li class="leports_title">레포츠 타이틀</li>
            <li class="c_name">업체명</li>
            <li class="c_detail_address">업체 상세 주소</li>
            <li class="rs_date">예약일</li>
            <li class="leports_item_title">선택 아이템 상세명 ex)서핑강습 2시간</li>
            <li class="leports_summary">선택시간 ex)강습시간: 9:30~11:30</li>
            <li class="persons">선택인원수</li>
            <li class="rs_price">가격*선택인원수</li>
          </ul>
        </div>

        <div class="TRAVELER_INFORMATION">
          <h3>여행자 정보</h3>
          예약자명:<input type="text" name="rs_name" /><br />
          연락처:<input type="text" name="rs_phone" /><br />
          이메일:<input type="text" /><br />
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
          <button><%=totalPrice %>원 확인 및 결제</button>
        </div>
      </form>
    </div>
  </body>
</html>
