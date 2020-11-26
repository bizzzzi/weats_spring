<%@page import="com.dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%
    	MemberDTO dto=(MemberDTO)session.getAttribute("login");
    	System.out.print("파트너 등록: "+dto.getUser_id());
    	String user_id="";
    	if(dto!=null){
    		user_id=dto.getUser_id();
    	}
    %> --%>

<h1 class="main_title">파트너 등록</h1>
<hr>

<div class="partner_form" id="partner">
	<form action="../PartnerAdd" method="post">
		<input type="hidden" name="user_id" value="${login.user_id}">
		<div class="box">
			<div class="title">상호 이름*</div>
			<div class="sub_box">
				<div>
					<input type="text" name="c_name" class="c_name"
						placeholder="상호 이름을 입력해주세요.">
				</div>
			</div>
		</div>
		<div class="box">
			<div class="title">연락처*</div>
			<div class="sub_box">
				<div>
					<input type="text" name="c_phone" class="c_phone" size="23"
						maxlength="11" placeholder="하이픈(-)은 빼고 입력해주세요.">
				</div>
				<div class="comment">상시 가능한 연락처를 입력해주세요.</div>
			</div>
		</div>
		<div class="box">
			<div class="title">주소*</div>
			<div class="sub_box">
				<div>
					<input type="text" name="c_postnum" id="sample4_postcode"
						placeholder="우편번호"> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="c_address" id="sample4_roadAddress"
						placeholder="도로명주소"><br> <input type="text"
						name="c_detail_address" id="c_detail_address"
						placeholder="상세주소 입력">
				</div>
			</div>
		</div>
		<div class="box">
			<div class="title">사업자 번호*</div>
			<div class="sub_box">
				<input type="text" name="partner_license_num"
					class="partner_license_num" size="23" maxlength="10"
					placeholder="하이픈(-)은 빼고 입력해주세요.">
			</div>
		</div>
		<div class="box">
			<div class="title">사업자 등록증*</div>
			<div class="sub_box">
				<div class="guide_img">
					<input type="file" id="image_upload" class="image_inputType_file"
						name="partner_license_docs" accept="img/*"
						placeholder="하이픈(-)은 빼고 입력해주세요." onchange="thumbnail(this);" />
					<div id="image_container">
						<!-- 사진을 미리 보여줄 영역 -->
						<img src="#" alt="" />
					</div>
				</div>
				<div class="comment">
					<small>사업자 등록증 사진을 업로드해주세요.</small><br> <small>이미지 규격은
						'*'을 권장합니다.</small>
				</div>
			</div>
		</div>
		<div>아래 버튼을 선택하면 개인정보 동의 및 파트너 약관에 동의하는 것입니다.</div>
		<div class="Btn">
			<button class="submitBtn" type="submit">확인 및 제출</button>
		</div>
	</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>