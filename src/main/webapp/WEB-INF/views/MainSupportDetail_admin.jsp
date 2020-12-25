<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weats</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/admin.css">
    <link rel="stylesheet" type="text/css" href="../css/customer.css">
    <link rel="stylesheet" type="text/css" href="../css/customer_nav2.css">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css"/><!-- 부트스트랩 -->
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script src="https://kit.fontawesome.com/400289e08c.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
    <div id="desktop">
        <jsp:include page="common/header_desktop.jsp" flush="true"></jsp:include>
    </div>
    <div id="adminPageWrap">
        <div id="SideMenu">
            <jsp:include page="admin/adminNav.jsp" flush="true"></jsp:include>
        </div>
        <div id="adminContent">
            <jsp:include page="customer/QA_SupportDetail_admin.jsp" flush="true"></jsp:include>
        </div>
    </div>
    <jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</div>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/modal.js"></script>
<script type="text/javascript" src="../js/supportDetail.js"></script>
</body>
</html>
