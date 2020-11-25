<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- div class="Resale_list" -->

<div class="trade_nav">
	<ul>
		<li><a href="TradeList?trade_type=판매">판매</a></li>
		<li><a href="TradeList?trade_type=대여">대여</a></li>
	</ul>
	<div class="option_btn">
<%--		<a href="TradeList?trade_type=self&user_id=M3">내가 등록한 제품</a>--%>
		<a href="loginCheck/TradeList">내가 등록한 제품</a>
		<a href="loginCheck/TradeWrite">판매/대여 등록</a>
	</div>
</div>

<div class="products">
	<div class="productsList">
		<c:forEach var="x" items="${tradeList}" varStatus="status">
		<ul class="trade_list">
			<a href="TradeDetail?trade_id=${x.trade_id}">
				<li class="trade_main_img" >
					<img src="images/${x.trade_main_img}.png" >
				</li>
				<li><span class="trade_title">${x.trade_title}</span></li>
				<li><span class="trade_price">${x.trade_price}</span></li>
			</a>
		</ul>
		</c:forEach>
	</div>
</div>
