<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="regExpPhone" value="01([0|1|6|7|8|9]?)([0-9]{8,9})"/>
    <section>
        <h2>1:1 문의하기</h2>
        <div class="questionForm">
            <form action="questionWrite" method="post">
                <ul>
                    <li>
                        <strong>문의 유형</strong>
                        <select name="q_type">
                            <option value="이용방법">이용방법</option>
                            <option value="자주 묻는 질문">자주 묻는 질문</option>
                            <option value="파트너 등록 문의">파트너 등록 문의</option>
                            <option value="결제 취소 문의">결제 취소 문의</option>
                            <option value="기타문의">기타문의</option>
                        </select>
                    </li>
                    <li>
                        <strong>이메일 주소</strong>
                        <input type="text" name="user_email" class="user_email"/>
                    </li>
                    <li>
                        <strong>이름</strong>
                        <input type="text" name="user_name" class="user_name"/>
                    </li>
                    <li>
                        <strong>제목</strong>
                        <input type="text" name="q_title" class="q_title"/>
                    </li>
                    <li>
                        <strong>전화번호</strong>
                        <input type="text" name="q_phone" class="q_phone" pattern="${regExpPhone}"
                               title="올바른 전화번호 형식이 아닙니다.(숫자만 입력)" maxlength="11"/>
                    </li>
                    <li>
                        <strong>예약번호</strong>
                        <input type="text" name="q_reservation_id"/>
                    </li>
                    <li>
                        <strong>세부내용</strong>
                        <input type="text" name="q_content" class="q_content"/>
                    </li>
                </ul>
                <div class="qa_submit">
                    <input type="submit" class="questionSubmit" value="문의하기">
                    <input type="reset" value="취소하기">
                </div>
            </form>
        </div>
    </section>
    </section>
