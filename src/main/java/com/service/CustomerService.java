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


    public int questionAdd(CustomerQnADTO customerQnADTO) {
        return dao.questionAdd(customerQnADTO);
    }

    public List<CustomerQnADTO> userQuestionList(String user_id) {

        return dao.userQuestionList(user_id);
    }
}
