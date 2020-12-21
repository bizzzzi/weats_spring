<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <section>
        <h2 class="admin_title">고객센터 Support</h2>
        <div class="questionForm">
            <form action="supportWrite" method="post">
                <ul>
                    <li>
                        <strong>문의 유형</strong>
                        <select name="s_type">
                            <option value="자주 묻는 질문">자주 묻는 질문</option>
                            <option value="파트너 등록 문의">파트너 등록 문의</option>
                            <option value="결제 취소 문의">결제 취소 문의</option>
                            <option value="기타 문의">기타문의</option>
                        </select>
                    </li>
                    <li>
                        <strong>질문 제목</strong>
                        <input type="text" name="s_question" class="s_question"/>
                    </li>
                    <li>
                        <strong>답변 내용</strong>
                        <input type="text" name="s_answer" class="s_answer"/>
                    </li>
                </ul>
                <div class="qa_submit adminBtn">
                    <input type="submit" class="answerSubmit" value="등록하기">
                    <input type="reset" value="취소하기">
                </div>
            </form>
        </div>
    </section>
