<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
<style type="text/css">
	a {
		color: black; /* 임시값 나중에 Css 공통수정 */
	}
</style>
</head>
<body>
	
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
		<input type="button" value="파트너 승인">
		<input type="button" value="파트너 비승인">
	</div>
</body>
</html>