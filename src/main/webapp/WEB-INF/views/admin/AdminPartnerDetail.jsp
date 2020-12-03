<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

	<hr>
	<div class="title">업체명</div>
	<div class="content">${dto.c_name}</div>
	<div class="title">주소</div>
	<div class="content">${dto.c_postnum} - ${dto.c_address} - ${dto.c_detail_address}</div>
	<div class="title">전화번호</div>
	<div class="content">${dto.c_phone}</div>
	<div class="title">사업자 번호</div>
	<div class="content">${dto.partner_license_num}</div>
	<div class="title">사업 등록증</div>
	<div class="content"><img src="${dto.partner_license_docs}"></div>
	<div class="emailBtn">
		<c:if test="${dto.memberDTO.partner_verify eq 1}">
			<a href="partnerConfirm?uID=${dto.memberDTO.user_id}">파트너 승인</a>
			<a href="partnerConfirm?uID=${dto.memberDTO.user_id}&reject=reject">파트너 비승인</a>
		</c:if>
		<c:if test="${dto.memberDTO.partner_verify eq 2}">
			<li>승인완료</li>
		</c:if>

	</div>
