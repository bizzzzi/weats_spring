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

    public int questionAdd(CustomerQnADTO customerQnADTO) {
        return template.insert("questionAdd", customerQnADTO);
    }

    public List<CustomerQnADTO> userQuestionList(String user_id) {
        return template.selectList("userQuestionList", user_id);
    }
}
