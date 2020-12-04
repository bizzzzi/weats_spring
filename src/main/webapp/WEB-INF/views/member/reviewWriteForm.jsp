<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<form action="reviewWrite" method="post">
	<div>${leports_title}</div>
	작성자 : <input type="text" name="user_name"><br>
	<textarea name="review_comments" rows="5" cols="33"></textarea>
	<div>
		<button>확인</button>
		<button>취소</button>
	</div>
	<input type="hidden" name="leports_id" value="${leports_id}">
	<input type="hidden" name="reservation_id" value="${reservation_id}">
</form>
