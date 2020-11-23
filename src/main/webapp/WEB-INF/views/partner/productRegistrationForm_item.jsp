<%@page import="com.dto.LeportsDTO"%>
<%@page import="com.dto.PartnerDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
LeportsDTO dto = (LeportsDTO) session.getAttribute("leports");
String leports_id=dto.getLeports_id();

%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>

<body>
  <h1 class="main_title">상품 등록</h1>
  <hr>

  <div class="partner_registration_form">
    <form action="ProductAddItemServlet" method="post">

      <input type="hidden" name="leports_id" value="<%=leports_id%>">

      <div class="box">
        <div class="title">레포츠 아이템 이름</div>
        <div class="sub_box">
          <div>
            <input type="text" name="leports_item_title" class="leports_item_title" placeholder="ex) 서핑(2시간)">
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">한줄 요약</div>
        <div class="sub_box">
          <div>
            <input type="text" name="leports_summary" class="leports_summary" placeholder="ex) 강습시간: 9:30~11:30">
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">가격(원)</div>
        <div class="sub_box">
          <div>
            <input type="text" name="leports_price" class="leports_price" placeholder="숫자만 입력해주세요.">
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">최대 수용 인원</div>
        <div class="sub_box">
          <div>
            <input type="number" name="leports_max_capacity" class="leports_max_capacity" placeholder="숫자만 입력해주세요.">
          </div>
        </div>
      </div>
      <div>아래 버튼을 선택하면 개인정보 동의 및 파트너 약관에 동의하는 것입니다.</div>
      <div class="Btn">
        <button class="submitBtn" type="submit">확인 및 제출</button>
      </div>
    </form>
  </div>
</body>

</html>