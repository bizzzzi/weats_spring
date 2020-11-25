<%@page import="com.dto.LeportsThumbnailDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String category = (String) session.getAttribute("category");
	String loc = (String)request.getAttribute("loc");
	String type = (String)request.getAttribute("type");
	String align = (String) request.getAttribute("align");
	System.out.println("align : "+align);
	System.out.println(loc+"\t"+type);
	
if (category != null) {
	if (category.equals("byType")) {
%>
<div class="leports_category_selector_wrap">
	<ul class="leports_category_selector">
		<li><a href="leportsList?category=byType&type=all">전체</a></li>
		<li><a href="leportsList?category=byType&type=지상">지상</a></li>
		<li><a href="leportsList?category=byType&type=수상">수상</a></li>
		<li><a href="leportsList?category=byType&type=항공">항공</a></li>
		<li><a href="leportsList?category=byType&type=실내">실내</a></li>
	</ul>
</div>
<%
	} else {
%>
<div class="leports_category_selector_wrap">
	<ul class="leports_category_selector">
		<li><a href="leportsList?category=byLoc&loc=all">전체</a></li>
		<li><a href="leportsList?category=byLoc&loc=서울">서울</a></li>
		<li><a href="leportsList?category=byLoc&loc=인천">인천</a></li>
		<li><a href="leportsList?category=byLoc&loc=경기">경기</a></li>
		<li><a href="leportsList?category=byLoc&loc=강원">강원</a></li>
		<li><a href="leportsList?category=byLoc&loc=충청">충청</a></li>
		<li><a href="leportsList?category=byLoc&loc=경상">경상</a></li>
		<li><a href="leportsList?category=byLoc&loc=부산">부산</a></li>
		<li><a href="leportsList?category=byLoc&loc=전라">전라</a></li>
		<li><a href="leportsList?category=byLoc&loc=기타">기타</a></li>
	</ul>
</div>
<%
	}
}

%>

<!-- 정렬  -->
<div class="leports_list_sort_wrap">
	<form class="form" action="leportsList">
	<input type="hidden" value="<%=category %>" name="category">
	<% if(type!= null ) { %>
		<input type="hidden" value="<%=type %>" name="type">
	<% } else if(loc!=null) { %>
	<input type="hidden" value="<%=loc %>" name="loc">
	<% } %>	
 		<select class="leports_list_sort" name="selectAlign">
			<option value="defalut"<%if("defalut".equals(align)){ %>selected<%} %>>기본순</option>
			<option value="minPrice"<%if("minPrice".equals(align)){ %>selected<%} %>>가격 낮은 순</option>
			<option value="maxPrice"<%if("maxPrice".equals(align)){ %>selected<%} %>>가격 높은 순</option>
			<option value="review"<%if("review".equals(align)){ %>selected<%} %>>리뷰 순</option>
		</select>
	</form>
	
</div>
<div class="leports_items">
	<!-- list for문 돌려서 반복 출력 -->
	<%
		List<LeportsThumbnailDTO> list = (List) request.getAttribute("leportsList");
		System.out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			LeportsThumbnailDTO dto = list.get(i);
			String leports_id = dto.getLeports_id();
			String leports_title = dto.getLeports_title();
			String leports_main_img = dto.getLeports_main_img();
			String leports_loc = dto.getLeports_loc();
			String leports_summary = dto.getLeports_summary();
			int leports_price = dto.getLeports_price();
			int review_cnt = dto.getReview_cnt();
	%>
	<div class="leports_item">
	<a href="leportsDetail?leports_id=<%=leports_id%>">
		<div>
			<img src="images/<%=leports_main_img%>.png">
		</div>
		<div>
			<ul>
				<li style="display: none">상품 아이디: <%=leports_id%></li>
				<li>상품 이름: <%=leports_title%></li>
				<li>한줄 설명: <%=leports_summary%></li>
				<li>지역: <%=leports_loc%></li>
				<li>가격: <%=leports_price%></li>
				<li>리뷰: <%=review_cnt%>개</li>
			</ul>
		</div>
	</a>
</div>
	<%
		}
	%>
</div>
<script>
		const align = document.querySelector(".leports_list_sort");
		const form = document.querySelector(".form");
		align.addEventListener('change', () => {
			console.log(form.getAttribute('action'));
			form.submit();
		})
</script>