package com.service;

import com.dao.CustomerDAO;
import com.dto.CustomerQnADTO;
import com.dto.CustomerSupportDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    @Autowired
    CustomerDAO dao;


    public int questionWrite(CustomerQnADTO customerQnADTO) {
        return dao.questionWrite(customerQnADTO);
    }

    public List<CustomerQnADTO> questionList(String user_id) {

        return dao.questionList(user_id);
    }
    //  관리자 페이지에서 보여줄 1대1 문의 리스트
    public List<CustomerQnADTO> questionList() {
        return dao.questionList();
    }

    public List<CustomerQnADTO> questionDetail(String question_group) {
        return dao.questionDetail(question_group);
    }

    public void answerSuccess(String question_group) {
        dao.answerSuccess(question_group);
    }

    public void reQuestion(String question_group) {
        dao.reQuestion(question_group);
    }

    public void supportWrite(CustomerSupportDTO supportDTO) {
        dao.supportWrite(supportDTO);
    }

    //    관리자 로그인 FAQ List
    public List<CustomerSupportDTO> supportList() {
        return dao.supportList();
    }
    //    사용자 로그인 FAQ List
    public List<CustomerSupportDTO> supportList(String s_type) {
        return dao.supportList(s_type);
    }

    public CustomerSupportDTO supportDetail(String support_id) {
        return dao.supportDetail(support_id);
    }

    public void supportUpdate(CustomerSupportDTO supportDTO) {
        dao.supportUpdate(supportDTO);
    }

    public void supportDelete(String support_id) {
        dao.supportDelete(support_id);
    }
}
