<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Weats</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" /><!-- 부트스트랩 -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="kakaoPaySuccess">
      <div class="kakaoPayTitle">예약이 취소되었습니다.</div>
      <div>
      	<div class="kakaoPayName">&nbsp;</div>
      	<div class="kakaoPayName">&nbsp;</div>
        <div class="kakaoPayItemName" style="font-size:24px;">상품명 : ${cancel_info.item_name}</div>
        <div class="kakaoPayTotal">&nbsp;</div>
      </div>
      <button class="btn btn-primary" type="button" onclick="location.href='loginCheck/myReservePage'">예약 내역 페이지로 이동</button>
    </div>
</body>
</html>

