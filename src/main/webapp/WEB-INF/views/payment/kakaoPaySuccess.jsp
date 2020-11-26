<%--
  Created by IntelliJ IDEA.
  User: csr96
  Date: 2020-11-26
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
카카오페이 결제가 정상적으로 완료되었습니다.<br>

결제일시:     ${payInfo.approved_at}<br/>
예약번호:    ${payInfo.partner_order_id}<br/>
상품명:    ${payInfo.item_name}<br/>
상품수량:    ${payInfo.quantity}<br/>
결제금액:    ${payInfo.amount.total}<br/>
</body>
</html>
