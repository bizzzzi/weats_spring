<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="reviewWrap">
	    <div class="rv_leports_title">${leports_title}</div>
	    <form name="reviewform" class="reviewform" action="reviewWrite" method="post">
	        <input type="hidden" name="rate" id="rate" value="0"/>
	        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
	 
	        <div class="review_rating">
	            <div class="rating">
	                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
	                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
	                <label for="rating1"></label>
	                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
	                <label for="rating2"></label>
	                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
	                <label for="rating3"></label>
	                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
	                <label for="rating4"></label>
	                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
	                <label for="rating5"></label>
	            </div>
	        </div>
	        <div class="review_contents">
	             <textarea class="review_textarea" name="review_comments"></textarea> 
	        </div>   
	        <div class="cmd">
	            <input type="submit" name="save" id="save" value="등록">
	        </div>
	        <input type="hidden" class="review_star" name="review_star"/>
	        <input type="hidden" name="leports_id" value="${leports_id}">
			<input type="hidden" name="reservation_id" value="${reservation_id}">
	    </form>

</div>