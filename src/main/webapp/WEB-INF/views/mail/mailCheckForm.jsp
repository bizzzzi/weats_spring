<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String tomail = (String) session.getAttribute("tomail");
		System.out.println("maliCheckForm.jsp/tomail -> " + tomail);
		String mesg = (String) session.getAttribute("mesg");
		if (mesg != null) {
	%>

	<script type="text/javascript">
	alert("<%=mesg%>");
	</script>


	<%
		}
		session.removeAttribute("mesg");
	%>
	<div id="mailCheckForm">
		<div class="mailCheckTitle">이메일 인증</div>
		<p>
			인증 메일이 <span class="mailCheckFormEmail"><%=tomail%></span> (으)로
			전송되었습니다.
		</p>
		<p>메일을 확인해주세요.</p>
		<button onclick="location.href='/weats/'">확인</button>
	</div>
</body>
</html>
