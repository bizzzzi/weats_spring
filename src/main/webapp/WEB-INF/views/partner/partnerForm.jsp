<%@page import="com.dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="regExpPhone" value="01([0|1|6|7|8|9]?)([0-9]{8,9})"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <script src="http://malsup.github.com/jquery.form.js"></script>
	<style>
		.uploadResult{
			display: flex;
			width: 100%;
			margin-top: 30px;
			justify-content: center;
		}
		.uploadResult li{
			width: 100%;
			margin: 10px;
			height: 100%;
		}
		.uploadResult li img{
			width: 100%;
			height: 60%;
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
		.form-control.partner{
			width: 50%;
			margin: auto;
		}
		.form-control.partner span{
			display: none;
		}
	</style>
<header class="header">
      <h1 class="main_title">파트너 등록</h1>
      <hr>
  </header>

  <div class="partner_form" id="partner">
    <form action="PartnerAdd" method="post" class="partnerAllForm partnerform">
    	
		<div class="formBox">
	        <div class="title">상호 이름*</div>
	        <input type="text" name="c_name" class="c_name" placeholder="상호 이름을 입력해주세요.">

	        <div class="title">연락처*</div>
	        <div class="comment">상시 가능한 연락처를 입력해주세요.</div>
			<input type="text" name="c_phone" class="c_phone" pattern="${regExpPhone}" title="올바른 전화번호 형식이 아닙니다.(숫자만 입력)" maxlength="11" size="23" maxlength="11" placeholder="하이픈(-)은 빼고 입력해주세요.">

	        <div class="title">주소*</div>
	        
	          <div class="post">
	          <div class="postTop">
	          	<input type="button" class="postBtn form" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	            <input type="text" name="c_postnum" id="sample4_postcode" placeholder="우편번호">
	           </div>
	            <input type="text" name="c_address" id="sample4_roadAddress" placeholder="도로명주소">
	            <input type="text" name="c_detail_address" id="sample4_jibunAddress" placeholder="상세주소 입력">
	   		  </div>
	   		  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
	        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
	          style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()"
	          alt="접기 버튼">
     		 </div>

        	<div class="title">사업자 등록번호*</div>
          	<input type="text" onkeyup="checkBusinessNumber()" name="partner_license_num" class="partner_license_num" size="23" maxlength="10"
            placeholder="하이픈(-)은 빼고 입력해주세요.">

            <div class="partner_license_num_alert" style="display:none">
            사업자 번호가 올바르지 않습니다.
            </div>

			<div class="title">사업자 등록증*</div>
			<form id="uploadForm" method="post" enctype="multipart/form-data">
				<div class="form-control partner" style="height: auto">
					<label for="ex_file" class="ex_file">업로드</label> 사업자 등록증을 첨부해주세요.
					<input type="file" name="uploadFile" class="file" style="display: none" id="ex_file"><br>
					<div>
						<ul class="uploadResult">
						</ul>
					</div>
					<div class="uploadBox" style="height: 0">
						<input type="hidden" name="partner_license_docs" class="partner_license_docs"><br>
					</div>
				</div>

	          <div class="comment">
	            <small>사업자 등록증 사진을 업로드해주세요.</small><br> <small>이미지 규격은 '*'을 권장합니다.</small>
	          </div>
      	</div>

      <div class="partnerBtn form">
        <p>아래 버튼을 선택하면 <a href="PersonalInformation" target="_blank" onClick="window.open(this.href, '', 'width=600, height=500'); return false;">개인정보 동의</a> 및 
        <a href="PartnerInfomation" target="_blank" onClick="window.open(this.href, '', 'width=600, height=500'); return false;">파트너 약관</a>에 동의하는 것입니다.</p><br>
        <input type="submit" class="partnerFormBtn" value="확인 및 제출" onclick="nullCheck()">
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
