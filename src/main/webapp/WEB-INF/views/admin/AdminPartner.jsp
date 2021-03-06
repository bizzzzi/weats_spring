<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section>
		<h2 class="admin_title">파트너 관리</h2>
			<div class="qList subject">
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
					<a href="AdminPartnerDetail?pID=${dto.partner_id}">
						<ul>
							<li>${dto.user_id}</li>
							<li>${dto.partner_id}</li>
							<li>${dto.c_name}</li>
							<li>${dto.partner_license_num}</li>
							<c:if test="${dto.memberDTO.partner_verify eq 1}">
								<li class="admin_confirm">승인대기</li>
							</c:if>
							<c:if test="${dto.memberDTO.partner_verify eq 2}">
								<li>승인완료</li>
							</c:if>
						</ul>
					</a>	
				</c:forEach>
			</div>	
</section>
