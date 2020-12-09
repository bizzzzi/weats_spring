package com.service;

import com.dao.CustomerDAO;
import com.dto.CustomerQnADTO;
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

    public List<CustomerQnADTO> userQuestionList(String user_id) {

        return dao.userQuestionList(user_id);
    }
    //  관리자 페이지에서 보여줄 1대1 문의 리스트
    public List<CustomerQnADTO> AllQuestionList() {
        return dao.AllQuestionList();
    }

    public List<CustomerQnADTO> questionDetail(String question_group) {
        return dao.questionDetail(question_group);
    }

    public void answerSuccess(String question_group) {
        dao.answerSuccess(question_group);
    }
}
