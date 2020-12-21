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
				<li><img class="trade_main_img" src="/weats/display?fileName=${dto.trade_main_img}"></li>
				<div>
					<c:if test="${dto.trade_sub_img1 != null}">
						<li><img class="trade_sub_img1" src="/weats/display?fileName=${dto.trade_sub_img1}"></li>
					</c:if>
					<c:if test="${dto.trade_sub_img2 != null}">
						<li><img class="trade_sub_img2" src="/weats/display?fileName=${dto.trade_sub_img2}"></li>
					</c:if>
					<c:if test="${dto.trade_sub_img3 != null}">
						<li><img class="trade_sub_img3" src="/weats/display?fileName=${dto.trade_sub_img3}"></li>
					</c:if>
					<c:if test="${dto.trade_sub_img4 != null}">
						<li><img class="trade_sub_img4" src="/weats/display?fileName=${dto.trade_sub_img4}"></li>
					</c:if>
				</div>
			</ul>
		</div>
		<div class="text_info">
			<ul>
				<li class="item_info_user"><b>판매자 </b>${dto.trade_user_name}</li>
				<hr>
				<li class="item_info_title">${dto.trade_title}</li>
				<li class="item_info_regidate">등록날짜 ${dto.trade_regidate}</li>
				<li class="item_info_price">${dto.trade_price}원</li>
				<li class="item_info_phone"><b>연락처&nbsp;</b>${dto.trade_phone}</li>
			</ul>
		</div>
	</div>
	<div class="contentsdiv">
		<p class="trade_contents">
			${dto.trade_contents}
		</p>
	</div>
	<hr>
	<!-- 댓글 -->
	<form action="loginCheck/TradeReply" method="POST">
		<strong>Comments</strong>
		<br>
		<input type="hidden"  name="trade_depth" value=0>
		<input type="hidden" name="trade_id" value="${dto.trade_id}"/>
		<input type="hidden" name="user_id" value="user_id" />
		<textarea name="trade_comment" rows="5" cols="100" style="width: 100%;"></textarea>
		<div style="height: 40px;">
			<input type="submit" value="댓글 달기" class="commentBtn btn btn-secondary"/>
		</div>
	</form>
	<div class="trade_comment_list">
		<hr>
		<input type="hidden" name="re_user_id" value="user_id">
		<c:forEach var="dto" items="${commentsList}" varStatus="status">
			<c:if test="${dto.trade_depth eq 0}" >
				<div class="comment_cont" id="${dto.trade_comment_id}">
					<strong>${dto.user_id}</strong>
					<br>
					<div class="commentUpdate">${dto.trade_comment}</div>
					<div class="comment_regidate">${fn:substring(dto.comment_regidate,0,10)}</div>
					<c:if test="${dto.user_id eq login.user_id}">
						<button class="delBtn2 btn btn-secondary" data-commentlevel="${dto.trade_comment_level}">삭제</button>
						<button class="updateBtn btn btn-secondary" data-commentid="${dto.trade_comment_id}" onclick="update(event)" >수정</button>
					</c:if>
					<button class="re_comment_btn btn btn-secondary" value="${dto.trade_comment_id}" onclick="cowrite(event)" >댓글달기</button>
					<c:forEach var="dto2" items="${recommentsList}" varStatus="status">
						<c:if test="${dto2.trade_comment_level eq dto.trade_comment_id}">
							<div class="comment_cont re" id="${dto2.trade_comment_id}">
								<strong>${dto2.user_id}</strong>
								<br>
								<div class="commentUpdate">${dto2.trade_comment}</div>
								<div class="comment_regidate">${fn:substring(dto2.comment_regidate,0,10)}</div>
								<c:if test="${dto2.user_id eq login.user_id}">
									<button class="delBtn btn btn-secondary" data-commentid="${dto2.trade_comment_id}" onclick="del(event)">삭제</button>
									<button class="updateBtn btn btn-secondary" data-commentid="${dto2.trade_comment_id}" onclick="update(event)">수정</button>
								</c:if>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr>
			</c:if>
		</c:forEach>
	</div>
</section>
