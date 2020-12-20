<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
    <section>
            <h2>고객센터 Support</h2>
                <div class="questionForm">
                    <form class="supportForm" action="" method="post">
                        <ul>
                            <li>
                                <strong>문의 유형</strong>
                                <select name="s_type">
                                    <option value="자주 묻는 질문" <c:if test="${support.s_type == '자주 묻는 질문'}">selected</c:if>>자주 묻는 질문</option>
                                    <option value="파트너 등록 문의" <c:if test="${support.s_type == '파트너 등록 문의'}">selected</c:if>>파트너 등록 문의</option>
                                    <option value="결제 취소 문의" <c:if test="${support.s_type == '결제 취소 문의'}">selected</c:if>>결제 취소 문의</option>
                                    <option value="기타 문의" <c:if test="${support.s_type == '기타 문의'}">selected</c:if>>기타문의</option>
                                </select>
                            </li>
                            <li>
                                <strong>질문 제목</strong>
                                <input type="text" name="s_question" value="${support.s_question}"/>
                            </li>
                            <li>
                                <strong>답변 내용</strong>
                                <input type="text" name="s_answer" value="${support.s_answer}"/>
                            </li>
                            <li>
                                <input type="hidden" name="support_id" value="${support.support_id}"/>
                            </li>
                        </ul>
                        <div class="qa_submit">
                            <input class="supportUpdate" type="button" value="수정"/>
                            <input class="supportDelete" type="button" value="삭제"/>
                        </div>
                    </form>
                </div>
    </section>
