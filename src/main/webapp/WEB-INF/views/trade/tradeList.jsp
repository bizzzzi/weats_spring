<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- div class="Resale_list" -->

<div class="trade_nav">
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link" href="TradeList?trade_type=판매">판매</a></li>
		<li class="nav-item"><a class="nav-link" href="TradeList?trade_type=대여">대여</a></li>
		<li class="nav-item"><a class="nav-link" href="loginCheck/TradeList">내가 등록한 제품</a></li>
		<li class="nav-item"><a class="nav-link" href="loginCheck/TradeWrite">판매/대여 등록</a></li>
	</ul>
</div>

<div class="products">
	<div class="productsList">
		<c:forEach var="x" items="${tradeList}" varStatus="status">
		<div class="trade_list">
			<a href="TradeDetail?trade_id=${x.trade_id}">
				<div class="trade_main_img">
					<img src="/weats/display?fileName=${x.trade_main_img}" />
				</div>
				<ul class="trade_item_info">
					<li class="trade_item_title">${x.trade_title}</li>
					<li class="trade_item_price">${x.trade_price}원</li>
				</ul>
			</a>
		</div>
		</c:forEach>
	</div>
</div>
