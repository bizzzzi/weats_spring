<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<h2 class="myPageTitle" style="margin-right: 0;">나의예약내역<span class="reservation_detail_main_title">${leports_title}</span></h2>
<div style="margin: 3% 10%;">
	<div class="reservation_detail_title">
		<div>&nbsp;&nbsp;&nbsp;상품명</div>
		<div>예약인원</div>
		<div>가격&nbsp;&nbsp;&nbsp;</div>
	</div>
	<hr>
	<c:forEach var="item" items="${itemList}">
		<div class="reservation_detail_item">
			<div>${item.rs_item_title}</div>
			<div>${item.rs_item_person}명</div>
			<div><fmt:formatNumber value="${item.rs_item_price}" pattern="#,###"/>원</div>
		</div>
		<hr>
	</c:forEach>
</div>