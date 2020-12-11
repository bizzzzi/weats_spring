<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section>
		<h1>파트너 관리</h1>
		<hr>
			<div class="qList">
				<ul>	
					<li>멤버ID</li>
					<li>파트너ID</li>
					<li>업체명</li>
					<li>사업자번호</li>
					<li>파트너 승인여부</li>
				</ul>
			</div>
			<div class="qList">
				<c:forEach var="dto" items="${PartnerList}" varStatus="status">
					<ul>
						<li>${dto.user_id}</li>
						<li>${dto.partner_id}</li>
						<li><a href="AdminPartnerDetail?pID=${dto.partner_id}">${dto.c_name}</a></li>
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
</section>
