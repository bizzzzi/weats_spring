<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.PartnerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	PartnerDTO pdto=(PartnerDTO)session.getAttribute("partner");


		String partner_id=pdto.getPartner_id();
		String c_name=pdto.getC_name();
		String c_phone=pdto.getC_phone();
		String c_postnum=pdto.getC_postnum();
		String c_address=pdto.getC_address();
		String c_detail_address=pdto.getC_detail_address();
		String partner_license_num=pdto.getPartner_license_num();
		String partner_license_docs=pdto.getPartner_license_docs();
		
	MemberDTO dto=(MemberDTO)session.getAttribute("login");
	String user_id=pdto.getUser_id();
	
%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="main_title">파트너 마이페이지</h1>
  <hr>

  <div class="partner_mypage_form">
    <form method="post">
	    <input type="hidden" name="partner_id" value="<%=partner_id%>">
	    <input type="hidden" name="user_id" value="<%=user_id%>">
      <div class="box">
        <div class="title">상호 이름</div>
        <div class="sub_box">
          <div>
            <input type="text" class="c_name" name="c_name" value="<%=c_name%>">
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">연락처</div>
        <div class="sub_box">
          <div>
            <input type="text" class="c_phone" name="c_phone" value="<%=c_phone%>">
          </div>
          <div class="comment">
            상시 가능한 연락처를 입력해주세요.
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">주소</div>
        <div class="sub_box">
          <div>
            <input type="text" name="c_postnum" id="sample4_postcode" value="<%=c_postnum%>">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" name="c_address" id="sample4_roadAddress" value="<%=c_address%>"><br>
            <input type="text" name="c_detail_address" id="c_detail_address" value="<%=c_detail_address%>">
          </div>
        </div>
      </div>
      <div class="box">
        <div class="title">사업자 등록번호</div>
        <div class="sub_box">
          <input type="text" name="partner_license_num" class="partner_license_num" size="23" maxlength="10"
            value="<%=partner_license_num%>">
        </div>
      </div>
      <div class="box">
        <div class="title">서류 제출</div>
        <div class="sub_box">
          <div class="guide_img">
            <img src="profile.png" alt="서류 제출 가이드 사진">
            <input id="image_upload" class="image_inputType_file" name="partner_license_docs"
              placeholder="하이픈(-)은 빼고 입력해주세요." type="file" accept="img/*" required multiple>
            <!-- file형태와 image만 업로드하도록 설정 -->
          </div>
          <div class="comment">
            사업자 등록증 사진을 업로드해주세요.<br>
            이미지 규격은 '*'을 권장합니다.
          </div>
        </div>
      </div>
      <div class="Btn">
        <button class="submitBtn" type="submit" formaction="PartnerMypageUpdate">정보 수정</button>
        <!-- 비밀번호 인증 후 파트너 정보 수정 -->
        <button class="cancleBtn" type="reset">취소</button>
      </div>
      <div>
        <button class="withdrawBtn" type="submit" formaction="PartnerDeleteServelt">파트너 탈퇴</button>
        <!-- 비밀번호 인증 후 파트너 탈퇴 -->
      </div>
    </form>
  </div>
</body>
</html>