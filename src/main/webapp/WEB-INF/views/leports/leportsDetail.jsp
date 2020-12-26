<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div style="height: 30px;"></div>

<div class="leports_detail_wrap">
	<div class="contents">
		<form action="loginCheck/leportsReserve" method="post">
			<input type="text" name="main_img" style="display: none" value="${leportsDetail[0].leports_main_img}">
			<input type="text" name="leports_title" style="display: none" value="${leportsDetail[0].leports_title}">
			<input type="text" name="c_address" style="display: none" value="${leportsDetail[0].c_address}">
			<input type="text" name="c_detail_address" style="display: none" value="${leportsDetail[0].c_detail_address}">
			<div class="leports_main_title">${leportsDetail[0].leports_title}</div>
			<div class="leports_review_star">★${leportsDetail[0].review_star} <span class="leports_review_cnt">(${leportsDetail[0].review_cnt})</span></div>
			<hr>
			<div class="leports_img_wrap">
				<div class="leports_items_img mainImg">
					<img src="/weats/display?fileName=${leportsDetail[0].leports_main_img}" style="margin-top: 24px;">
				</div>
				<div class="leports_items_img">
					<c:if test="${leportsDetail[0].leports_sub_img1 eq null}">
						<img src="images/defaultImg.png">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img1 ne null}">
						<img src="/weats/display?fileName=${leportsDetail[0].leports_sub_img1}">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img2 eq null}">
						<img src="images/defaultImg.png">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img2 ne null}">
						<img src="/weats/display?fileName=${leportsDetail[0].leports_sub_img2}">
					</c:if>
				</div>
				<div class="leports_items_img">
					<c:if test="${leportsDetail[0].leports_sub_img3 eq null}">
						<img src="images/defaultImg.png">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img3 ne null}">
						<img src="/weats/display?fileName=${leportsDetail[0].leports_sub_img3}">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img4 eq null}">
						<img src="images/defaultImg.png">
					</c:if>
					<c:if test="${leportsDetail[0].leports_sub_img4 ne null}">
						<img src="/weats/display?fileName=${leportsDetail[0].leports_sub_img4}">
					</c:if>
				</div>
			</div>
			<hr>
			<div class="leports_ticket" id="href_ticket">티켓 선택</div>
			<div class="calendar_wrap">
				<table class="scriptCalendar">
					<thead>
					<tr>
						<td onClick="prevCalendar();" style="cursor: pointer">&#60;&#60;</td>
						<td colspan="5">
							<span id="calYear">YYYY</span>년
							<span id="calMonth">MM</span>월
						</td>
						<td onClick="nextCalendar();" style="cursor: pointer">&#62;&#62;</td>
					</tr>
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
				<input type="text" id="leports_id" name="leports_id" style="display: none" value="${leports_id}">
				<input id="rs_date" class="choiceDay_data" name="reserveDay" type="text" value=""
					   style="display: none">
				<!-- <div class="choiceDay_data"></div> -->
			</div>
			<div class="leports_item_list" id="href_item_list">
				<div class="string_day">선택날짜 : <span class="userSelectDay"></span></div>
				<!-- for문 돌려서 반복 출력 -->
				<c:forEach var="dto" items="${leportsDetail}">
					<div class="list_item_info">
						<div style="width: 33%;">
							<div class="leports_item_title">${dto.leports_item_title}</div>
							<div class="leports_item_summary">${dto.leports_summary}</div>
							<div class="leports_item_mc">예약 가능 인원 : ${dto.leports_max_capacity}</div>
						</div>
						<div>
							<span class="leports_item_price"><fmt:formatNumber value="${dto.leports_price}" pattern="#,###" />원</span><span class="person"> 1인</span>
						</div>
						<div class="list_item">

							<input class="js_itemId" type="text" name="item_id" value="${dto.leports_item_id}" style="display: none">
							<input class="js_itemName" type="text" name="item_title" value="${dto.leports_item_title}" style="display: none">
							<input class="js_maxPerson" type="text" value="${dto.leports_max_capacity}" style="display: none">
							<input class="ajax_maxPerson" type="text" value="${dto.leports_max_capacity}" style="display: none">
							<input class="js_itemPrice" type="text" name="item_price" value="${dto.leports_price}" style="display: none">
							<div class="qty">
								<button type="button" class="js_dwBtn btn"><span class="minus">-</span></button>
								<input class="js_pCount count" type="text" name="personnelConut" value="0" readonly>
								<button type="button" class="js_upBtn btn"><span class="plus">+</span></button>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 여기 까지 -->

				<div class="select_item_list">
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
					<div class="js_selectItem"></div>
				</div>
				<!-- 여기 까지 -->
				<div class="total_price_css">
					총 금액 : <span class="js_total_amount">0</span>원
				</div>
				<input type="text" style="display: none" name="totalPrice" />
				<input class="js_pTotalCount" type="number" name="totalPersonnelConut" style="display: none" value="0">
			</div>
			<div style="height: 100px;">
				<input class="paymentBtn btn btn-primary" type="submit" value="결제하기" />
			</div>
		</form>
		<hr>
		<div id="href_leports_content">
			상품 상세 설명 : ${leportsDetail[0].leports_content}
		</div>
	</div>
	<div class="side_nav">
		<div class="side_nav_contents">
			<div class="current_amount">현재 금액</div>
			<span class="js_total_amount2">0</span>원<br>
		</div>
		<button type="button" class="btn btn-lg btn-primary side_nav_btn" onclick="location.href='#href_ticket'">티켓 선택</button>
	</div>
</div>
