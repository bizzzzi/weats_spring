<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <link rel="stylesheet" href="css/admin.css">
	<h1>회원관리</h1>
	<hr>
	<div class="content">
		<div class="subject">
			<ul>
				<li>ID</li>
				<li>회원이름</li>
				<li>EMAIL</li>
				<li>이메일 인증여부</li>
				<li>파트너 등록여부</li>
			</ul>
		</div>
		<div class="list">
		<c:forEach var="dto" items="${memberList}" varStatus="status">
			<ul>
	 			<li>${dto.user_id}</li>
				<li>${dto.user_name}</li>
				<li>${dto.user_email}</li>
				<li>${dto.user_verify}</li>
				<li>${dto.partner_verify}</li>
			</ul>
		</c:forEach>
		</div>
	</div>
	