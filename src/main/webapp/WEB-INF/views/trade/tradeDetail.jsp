<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--login 정보 조회하여 user_id 파싱--%>

<section style="margin: 0 auto;">
	<!-- 상품상세정보 -->
	<div class="products_info">
		<div class="imgframe">
			<ul class="trade_img">
				<li><img class="trade_main_img2" src="images/${dto.trade_main_img}"></li>
				<div>
					<li><img class="trade_sub_img1" src="images/${dto.trade_sub_img2}"></li>
					<li><img class="trade_sub_img2" src="images/${dto.trade_sub_img2}"></li>
					<li><img class="trade_sub_img3" src="images/${dto.trade_sub_img3}"></li>
					<li><img class="trade_sub_img4" src="images/${dto.trade_sub_img4}"></li>
				</div>
			</ul>
		</div>
		<div class="text_info">
			<ul>
				<li><b>등록날짜</b> ${dto.trade_regidate}</li>
				<li><h4>${dto.trade_title}</h4></li>
				<li><b>가격</b><strong>${dto.trade_price}</strong></li>
				<li><b>연락처</b>${dto.trade_phone}</li>
				<li><b>작성자</b>${dto.trade_user_name}</li>
			</ul>
		</div>
	</div>
	<div class="contentsdiv">
		<h2>상품설명</h2>
		<br>
		<p class="trade_contents">
			${dto.trade_contents}
		</p>
	</div>
	<!-- 댓글 -->
	<form action="loginCheck/TradeReply" method="POST">
		<strong>Comments</strong>
		<br>
		<input type="hidden"  name="trade_depth" value=0>
		<input type="hidden" name="trade_id" value="${dto.trade_id}"/>
		<input type="hidden" name="user_id" value="user_id" />
		<textarea name="trade_comment" rows="5" cols="100"></textarea>
		<input type="submit" value="댓글 달기" />
	</form>
	<div class="trade_comment_list">
		<input type="hidden" name="re_user_id" value="user_id">
		<c:forEach var="dto" items="${commentsList}" varStatus="status">
			<c:if test="${dto.trade_depth eq 0}">
				<div class="comment_cont">
					<strong style="color:#ff0000">${dto.user_id}</strong>
					<br>
					<span>${dto.trade_comment}</span>
					<p>${dto.comment_regidate}</p>
					<p>depth: ${dto.trade_depth}</p>
					<c:if test="${dto.user_id eq login.user_id}">
						<button class="delBtn2" data-commentlevel="${dto.trade_comment_level}">삭제</button>
						<button class="updateBtn2" data-commentlevel="${dto.trade_comment_level}" >수정</button>
					</c:if>
					<button class="re_comment_btn" value="${dto.trade_comment_id}">댓글달기</button>
					<c:forEach var="dto2" items="${recommentsList}" varStatus="status">
						<c:if test="${dto2.trade_comment_level eq dto.trade_comment_id}">
							<div class="comment_cont re">
								<strong style="color:red">${dto2.user_id}</strong>
								<br>
								<span>${dto2.trade_comment}</span>
								<p>${dto2.comment_regidate}</p>
								<p>depth: ${dto2.trade_depth}</p>
								<c:if test="${dto2.user_id eq login.user_id}">
									<button class="delBtn" data-commentid="${dto2.trade_comment_id}" onclick="del(event)">삭제</button>
									<button class="updateBtn" data-commentid="${dto2.trade_comment_id}">수정</button>
								</c:if>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</c:forEach>
	</div>
</section>