<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

    <section>
        <div id="banner">
            <h2>
                실시간으로 쉽고, 빠르게 검색하고 <br>
                예약할 수 있는<br>
                Weats
            </h2>
        </div>
        <div class="howList">
            <img src="images/howImg.png">
            <ul>
                <li><h3>1</h3></li>
                <li><h4>레포츠 예약</h4></li>
                <li>
                           <span>
                               오늘 당장 즐기고 싶은 레포츠가 생겼나요?
                               그러면 Weats 레포츠프로그램을 검색하세요.
                               Weats에서는 바로 즐길 수 있는 레포츠만 보여드립니다.
                               실시간으로 프로그램을 확인하고 최저가로 예약하세요.
                           </span>
                </li>
            </ul>
        </div>
        <div class="howList">
            <img src="images/howImg.png">
            <ul>
                <li><h3>2</h3></li>
                <li><h4>중고거래</h4></li>
                <li>
                           <span>
                               새로운 레포츠를 즐기려 할 때,
                               장비가 없다면? Weats의 중고거래를 이용하세요.
                               중고거래 페이지에서 원하는 장비를 선택하여
                               판매자와 연락하고, 불필요한 장비를 편하게 판매하세요.
                           </span>
                </li>
            </ul>
        </div>
        <div class="howList">
            <img src="images/howImg.png">
            <ul>
                <li><h3>3</h3></li>
                <li><h4>결제하기</h4></li>
                <li>
                           <span>
                               국내에서 결제하실 때에는 신용카드 일반결제, 실시간 계좌이체,
                               무통장 입금, 카카오 결제가 가능합니다.
                           </span>
                </li>
            </ul>
        </div>
        <div class="how_footer">
            <h2>Weats에 더 궁금한 점이 있으신가요?</h2>
            <a href="${rootPath}/supportList?s_type=자주 묻는 질문">자주 묻는 질문 확인하기</a>
        </div>
    </section>
</div>
