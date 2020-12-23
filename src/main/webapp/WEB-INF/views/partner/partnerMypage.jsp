<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.PartnerDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  	<style>
		.uploadResult{
			display: flex;
			width: 100%;
			margin-top: 30px;
		}
		.uploadResult li{
			width: 50%;
			margin: 10px;
		}
		.uploadResult li img{
			width: 100%;
			height: 90%;
			object-fit: cover;
		}
		.ex_file{
			color: black;
			border: 1px solid rgba(0, 0, 0, 0.15);
			border-radius: 0.25rem;
			background-clip: padding-box;
			margin: 0;
			padding: 1px 10px;
		}

	</style>
</head>
<body>
  <header class="header">
    <h1 class="partner_title">파트너 마이페이지</h1>
  </header>
  <div class="partner_form" id="partner">
    <form method="post" class="partnerAllForm partnerform">
      <input type="hidden" name="partner_id" value="${pdto.partner_id}">
      <input type="hidden" name="user_id" value="${pdto.user_id}">
      
		<div class="formBox">
	        <div class="title">상호 이름*</div>
	        <input type="text" class="c_name" name="c_name" value="${pdto.c_name}">
	
	        <div class="title">연락처*</div>
	        <div class="comment">상시 가능한 연락처를 입력해주세요.</div>
	        <input type="text" class="c_phone" name="c_phone" value="${pdto.c_phone}">
 	
	        <div class="title">주소*</div>
	          <div class="post">
	          	<input type="button" class="postBtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	            <input type="text" name="c_postnum" id="sample4_postcode" value="${pdto.c_postnum}">            
	            <input type="text" name="c_address" id="sample4_roadAddress" value="${pdto.c_address}">
	            <input type="text" name="c_detail_address" id="c_detail_address" value="${pdto.c_detail_address}">
	          </div>
	      
	        <div class="title">사업자 등록번호*</div>
	          <input type="text" name="partner_license_num" class="partner_license_num" size="23" maxlength="10" 
	          value="${pdto.partner_license_num}">
	
			<div class="title">사업자 등록증*</div>
			<form id="uploadForm" method="post" enctype="multipart/form-data">
				<div class="form-control" style="height: auto">
					<label for="ex_file" class="ex_file">업로드</label> 사업자 등록증을 첨부해주세요.
					<input type="file" name="uploadFile" class="file" style="display: none" id="ex_file"><br>
					<div>
						<ul class="uploadResult">
							<c:if test="${pdto.partner_license_docs != null}">
								<li><img src="/weats/display?fileName=${pdto.partner_license_docs}"><span data-name="partner_license_docs" data-file=\'${pdto.partner_license_docs}\' data-type="image">기존 이미지</span></li>
							</c:if>
						</ul>
					</div>
					<div class="uploadBox" style="height: 0">
						<input type="hidden" name="partner_license_docs" class="partner_license_docs" value="${pdto.partner_license_docs}"><br>
					</div>
				</div>
		</div>
      <div class="partnerBtn info">
        <input class="submitBtn Btn" onclick="nullCheck()" type="submit" formaction="loginCheck/CheckPartner?page=partnerUpdate" value="정보 수정">
        <!-- 비밀번호 인증 후 파트너 정보 수정 -->
        <input class="cancleBtn Btn" type="reset" value="작성취소">
        <!-- 정보 초기화 버튼 -->
        <input class="withdrawBtn Btn" type="submit" formaction="loginCheck/CheckPartner?page=partnerDelete" value="파트너 탈퇴">
        <!-- 비밀번호 인증 후 파트너 탈퇴 -->
      </div>
    </form>
  </div>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function sample4_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraRoadAddr !== '') {
            extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
        }
      }).open();
    }
  </script>
  <script src="js/thumbnail.js"></script>
</body>
</html>