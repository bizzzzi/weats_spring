<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
 <link rel="stylesheet" href="css/admin.css">
	<div class="sideMenu">
		<ul>
			<li><a href="memberList">회원관리</a></li>
			<li><a href="partnerList">파트너 관리</a></li>
		</ul>
	</div>	
	<div class="content">
	<div class="borderLine">
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
			<span class="detail_content"><img src="${dto.partner_license_docs}"></span>
		</div>
		</div>	
		<div class="emailBtn">
			<c:if test="${dto.memberDTO.partner_verify eq 1}">
				<input type="button" value="파트너 승인">
				<input type="button" value="파트너 비승인">
			</c:if>
			<c:if test="${dto.memberDTO.partner_verify eq 2}">
				<li>승인완료</li>
			</c:if>
	
		</div>

	</div>
