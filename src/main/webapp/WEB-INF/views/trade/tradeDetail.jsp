<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--login 정보 조회하여 user_id 파싱--%>

<section style="margin: 0 auto;">
	<!-- 상품상세정보 -->
	<div class="products_info">
		<div class="item_info_title">
			<h2>${dto.trade_title}</h2>
			<c:if test="${dto.user_id eq login.user_id}">
				<div class="myBoard">
					<a href="loginCheck/TradeUpdate?trade_id=${dto.trade_id}" class="btn btn-secondary">수정</a>
					<a href="loginCheck/TradeDelete?trade_id=${dto.trade_id}" class="btn btn-secondary">삭제</a>
				</div>
			</c:if>
		</div>
		<hr>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  			<ol class="carousel-indicators">
    			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    			<c:if test="${dto.trade_sub_img1 != null}">
    				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    			</c:if>
    			<c:if test="${dto.trade_sub_img2 != null}">
    				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    			</c:if>
    			<c:if test="${dto.trade_sub_img3 != null}">
    				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    			</c:if>
    			<c:if test="${dto.trade_sub_img4 != null}">
    				<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
    			</c:if>
  			</ol>
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img class="trade_main_img d-block w-100" src="/weats/display?fileName=${dto.trade_main_img}">
    			</div>
    			<c:if test="${dto.trade_sub_img1 != null}">
    				<div class="carousel-item">
      					<img class="trade_sub_img1 d-block w-100" src="/weats/display?fileName=${dto.trade_sub_img1}">
    				</div>
    			</c:if>
    			<c:if test="${dto.trade_sub_img2 != null}">
    				<div class="carousel-item">
      					<img class="trade_sub_img2 d-block w-100" src="/weats/display?fileName=${dto.trade_sub_img2}">
    				</div>
    			</c:if>
    			<c:if test="${dto.trade_sub_img3 != null}">
    				<div class="carousel-item">
      					<img class="trade_sub_img3 d-block w-100" src="/weats/display?fileName=${dto.trade_sub_img3}">
    				</div>
    			</c:if>
    			<c:if test="${dto.trade_sub_img4 != null}">
    				<div class="carousel-item">
      					<img class="trade_sub_img4 d-block w-100" src="/weats/display?fileName=${dto.trade_sub_img4}">
    				</div>
    			</c:if>
  			</div>
  			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
  			</a>
  			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
  			</a>
		</div>
		<div class="text_info">
			<ul>
				<li class="item_info_user"><b>판매자 </b>${dto.trade_user_name}</li>
				<hr>
				<li class="item_info_regidate">등록날짜 ${dto.trade_regidate}</li>
				<li class="item_info_price">${dto.trade_price}</li>
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
		<input type="hidden" name="re_user_email" value="user_id">
		<c:forEach var="dto" items="${commentsList}" varStatus="status">
			<c:if test="${dto.trade_depth eq 0}" >
				<div class="comment_cont" id="${dto.trade_comment_id}">
					<strong class="re_user_email">${dto.memberDTO.user_email}</strong>
					<br>
					<div class="commentUpdate">${dto.trade_comment}</div>
					<div class="comment_regidate">${fn:substring(dto.comment_regidate,0,10)}</div>
					<div class="replyBtn">
						<c:if test="${dto.user_id eq login.user_id}">
							<button class="delBtn2 btn btn-secondary" data-commentlevel="${dto.trade_comment_level}">삭제</button>
							<button class="updateBtn btn btn-secondary" data-commentid="${dto.trade_comment_id}" onclick="update(event)" >수정</button>
						</c:if>
						<button class="re_comment_btn btn btn-secondary" value="${dto.trade_comment_id}" onclick="cowrite(event)" >댓글달기</button>
					</div>
					<c:forEach var="dto2" items="${recommentsList}" varStatus="status">
						<c:if test="${dto2.trade_comment_level eq dto.trade_comment_id}">
							<div class="comment_cont re" id="${dto2.trade_comment_id}">
								<span class="re_ico"></span>
								<div class="re_box">
									<strong class="re_user_email">${dto2.memberDTO.user_email}</strong>
									<br>
									<div class="commentUpdate">${dto2.trade_comment}</div>
									<div class="comment_regidate">${fn:substring(dto2.comment_regidate,0,10)}</div>
									<div class="replyBtn">
										<c:if test="${dto2.user_id eq login.user_id}">
											<button class="delBtn btn btn-secondary" data-commentid="${dto2.trade_comment_id}" onclick="del(event)">삭제</button>
											<button class="updateBtn btn btn-secondary" data-commentid="${dto2.trade_comment_id}" onclick="update(event)">수정</button>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<hr>
				</div>
			</c:if>
		</c:forEach>
	</div>
</section>
