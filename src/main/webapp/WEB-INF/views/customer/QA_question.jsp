<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <section>
        <h2>1:1 문의하기</h2>
        <div class="questionForm">
            <form action="questionWrite" method="post">
                <ul>
                    <li>
                        <strong>문의유형</strong>
                        <select name="q_type">
                            <option>이용방법</option>
                            <option>자주묻는질문</option>
                            <option>파트너등록문의</option>
                            <option>결제취소문의</option>
                            <option>기타문의</option>
                        </select>
                    </li>
                    <li>
                        <strong>이메일 주소</strong>
                        <input type="text" name="user_email"/>
                    </li>
                    <li>
                        <strong>제목</strong>
                        <input type="text" name="q_title"/>
                    </li>
                    <li>
                        <strong>전화번호</strong>
                        <input type="text" name="q_phone"/>
                    </li>
                    <li>
                        <strong>예약번호</strong>
                        <input type="text" name="q_reservation_id"/>
                    </li>
                    <li>
                        <strong>세부내용</strong>
                        <input type="text" name="q_content"/>
                    </li>
                </ul>
                <div class="qa_submit">
                    <input type="submit" value="문의하기">
                    <input type="reset" value="취소하기">
                </div>
            </form>
        </div>
    </section>
</div>
