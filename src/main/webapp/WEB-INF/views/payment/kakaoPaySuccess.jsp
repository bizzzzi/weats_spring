<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
예약이 완료되었습니다.<br>
결제번호 : ${pay_info.tid}<br/>
결제일시:     ${pay_info.approved_at}<br/>
예약번호:    ${pay_info.partner_order_id}<br/>
상품명:    ${pay_info.item_name}<br/>
상품수량:    ${pay_info.quantity}<br/>
결제금액:    ${pay_info.amount.total}<br/>
이름 : ${user_info.rs_name}<br/>
<a href="/weats">메인 페이지로 이동</a>
</body>
</html>
