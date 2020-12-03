<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <link rel="stylesheet" href="css/admin.css">
	<h1>파트너 관리</h1>
	<hr>
	<div class="content">
		<div class="subject">
			<ul>
				<li>업체명</li>
				<li>주소</li>
				<li>사업자번호</li>
				<li>파트너 승인여부</li>
			</ul>
		</div>
		<div class="list">
			<c:forEach var="dto" items="${PartnerList}" varStatus="status">
				<ul>
					<li><a href="AdminPartnerDetail?pID=${dto.partner_id}">${dto.c_name}</a></li>
					<li>${dto.c_postnum} ${dto.c_address} ${dto.c_detail_address}</li>
					<li>${dto.partner_license_num}</li>
					<c:if test="${dto.memberDTO.partner_verify eq 1}">
						<li>승인대기</li>
					</c:if>
					<c:if test="${dto.memberDTO.partner_verify eq 2}">
						<li>승인완료</li>
					</c:if>
				</ul>
			</c:forEach>
		</div>	
	</div>