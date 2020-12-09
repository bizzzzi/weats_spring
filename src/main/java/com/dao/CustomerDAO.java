package com.dao;

import com.dto.CustomerQnADTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAO {
    @Autowired
    SqlSessionTemplate template;

    public int questionWrite(CustomerQnADTO customerQnADTO) {
        return template.insert("questionWrite", customerQnADTO);
    }

    public List<CustomerQnADTO> userQuestionList(String user_id) {
        return template.selectList("userQuestionList", user_id);
    }

    //  관리자 페이지에서 보여줄 1대1 문의 리스트
    public List<CustomerQnADTO> AllQuestionList() {
        return template.selectList("AllQuestionList");
    }


    public List<CustomerQnADTO> questionDetail(String question_group) {
        return template.selectList("questionDetail", question_group);
    }

    public void answerSuccess(String question_group) {
        template.update("answerSuccess", question_group);
    }
}
