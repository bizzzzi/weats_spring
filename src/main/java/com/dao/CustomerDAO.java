package com.dao;

import com.dto.CustomerQnADTO;
import com.dto.CustomerSupportDTO;
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

    public List<CustomerQnADTO> questionList(String user_id) {
        return template.selectList("userQuestionList", user_id);
    }

    //  관리자 페이지에서 보여줄 1대1 문의 리스트
    public List<CustomerQnADTO> questionList() {
        return template.selectList("AllQuestionList");
    }


    public List<CustomerQnADTO> questionDetail(String question_group) {
        return template.selectList("questionDetail", question_group);
    }

    public void answerSuccess(String question_group) {
        template.update("answerSuccess", question_group);
    }

    public void reQuestion(String question_group) {
        template.update("reQuestion", question_group);
    }

    public String questionUseremail(String question_group) {
        return template.selectOne("questionUseremail", question_group);
    }
    public void supportWrite(CustomerSupportDTO supportDTO) {
        template.insert("supportWrite", supportDTO);
    }

    //    관리자 로그인 FAQ List
    public List<CustomerSupportDTO> supportList() {
        return template.selectList("supportList");
    }

    //    사용자 로그인 FAQ List
    public List<CustomerSupportDTO> supportList(String s_type) {
        return template.selectList("supportListByType", s_type);
    }
    //  FAQ 상세
    public CustomerSupportDTO supportDetail(String support_id) {
        return template.selectOne("supportDetail", support_id);
    }

    public void supportUpdate(CustomerSupportDTO supportDTO) {
        System.out.println(supportDTO);
        template.update("supportUpdate", supportDTO);
    }

    public void supportDelete(String support_id) {
        template.delete("supportDelete", support_id);
    }
}
