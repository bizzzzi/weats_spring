<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div class="content">
		<div class="detail_info">
			<div class="detail">
				<span class="detail_title">업체명</span>
				<span class="detail_content">${dto.c_name}</span>
			</div>
			<div class="detail">
				<span class="detail_title">주소</span>
				<span class="detail_content">${dto.c_postnum} <br> ${dto.c_address} <br> ${dto.c_detail_address}</span>
			</div>
			<div class="detail">
				<span class="detail_title">전화번호</span>
				<span class="detail_content">${dto.c_phone}</span>
			</div>
			<div class="detail">
				<span class="detail_title">사업자 번호</span>
				<span class="detail_content">${dto.partner_license_num}</span>
			</div>
			<div class="detail">
				<span class="detail_title">사업 등록증</span>
				<span class="detail_content"><img src="/weats/display?fileName=${dto.partner_license_docs}"></span>
			</div>
		</div>
		<div class="adminBtn">
			<c:if test="${dto.memberDTO.partner_verify eq 1}">
				<span class="emailBtn"><a href="partnerConfirm?uID=${dto.memberDTO.user_id}">파트너 승인</a></span>
				<span class="emailBtn"><a href="partnerConfirm?uID=${dto.memberDTO.user_id}&reject=reject">파트너 비승인</a></span>
			</c:if>
			<c:if test="${dto.memberDTO.partner_verify eq 2}">
				<h2>승인완료</h2>
			</c:if>
</div>
</div>

