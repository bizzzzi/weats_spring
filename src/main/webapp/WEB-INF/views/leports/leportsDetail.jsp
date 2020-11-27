<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<div>
		<form action="loginCheck/leportsReserve" method="post">
				<input type="text" name="main_img" style="display:none" value="${leportsDetail[0].leports_main_img}">
				<input type="text" name="leports_title" style="display:none" value="${leportsDetail[0].leports_title}">
				<input type="text" name="c_address" style="display:none" value="${leportsDetail[0].c_address}">
				<input type="text" name="c_detail_address" style="display:none" value="${leportsDetail[0].c_detail_address}">
				<input class="js_pTotalCount" type="number" name="totalPersonnelConut" style="display:none" value="0">
				
			<b>${leportsDetail[0].leports_title}</b>
			<div class="leports_items main" >
				<img src="images/${leportsDetail[0].leports_main_img}">
			</div>
			<div class="leports_items sub">
				<img src="images/${leportsDetail[0].leports_sub_img1}">
				<img src="images/${leportsDetail[0].leports_sub_img2}">
				<img src="images/${leportsDetail[0].leports_sub_img3}">
				<img src="images/${leportsDetail[0].leports_sub_img4}">
			</div>
			<div>
				<table class="scriptCalendar">
					<thead>
						<tr>
							<td onClick="prevCalendar();" style="cursor: pointer">&#60;&#60;</td>
							<td colspan="5"><span id="calYear">YYYY</span>년 <span id="calMonth">MM</span>월</td>
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
				<input class="choiceDay_data" name="reserveDay" type="text" value=""
					style="display: none">
				<!-- <div class="choiceDay_data"></div> -->
			</div>
			<div>
				<div>선택날짜</div>
				<div class="userSelectDay"></div>
				<!-- for문 돌려서 반복 출력 -->
				<c:forEach var="dto" items="${leportsDetail}">
				<div>
					<ul>
						<li>예약 가능 인원 : ${dto.leports_max_capacity}</li>
						<li>아이템 이름 : ${dto.leports_item_title}</li>
						<li>아이템 설명 : ${dto.leports_summary}</li>
						<li>1명 <b>${dto.leports_price}</b></li>
					</ul>
					<div class="list_item">
						<input class="js_itemName" type="text" name="item_title" value="${dto.leports_item_title}" style="display: none">  
						<input class="js_maxPerson" type="text" value="${dto.leports_max_capacity}" style="display: none">
						<input class="js_itemPrice" type="text" name="item_price" value="${dto.leports_price}" style="display: none">
						<button type="button" class="js_dwBtn"><img src="#">마이너스 버튼</button>
						<input class="js_pCount" type="text" name="personnelConut" value="0" readonly>
						<button type="button" class="js_upBtn"><img src="#">플러스 버튼</button>
					</div>
				</div>
				</c:forEach>
				<!-- 여기 까지 -->

				<!-- 상품 선택 안했을 땐 없어야되고 선택하면 상품 복수로 선택한 만큼 나와야하는데 어떻게 해야할 지 모르겠음 -->
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
				<div class="js_total_amount"></div>
				<input type="text" style="display: none" name="totalPrice" />
			</div>
			<div>
				<input class="paymentBtn" type="submit" value="결제하기 버튼"/>
			</div>
		</form>
		<div>
			상품 상세 설명(사진 가능) :
			${leportsDetail[0].leports_content}</div>
		<div>
			<b>후기</b>
			<c:forEach var="dto" items="${leportsReview}" varStatus="status">
			<div class="review_list" data-value="${status.index}"
				style='border: 1px solid black; width: 300px'>
				<div>${dto.user_name}</div>
				<div>${dto.review_comments}</div>
				<div>${dto.review_regidate}</div>
			</div>
			</c:forEach>
			<button id="review_list_btn" value="0">후기 전체보기</button>
		</div>
	</div>
	레포츠 등록 일자 :
	${leportsDetail[0].leports_regidate}
	<div>
		<button>티켓 선택</button>
		<div>총 금액</div>
	</div>
</div>
<script>
	
</script>
