package com.controller;

import com.dto.CustomerQnADTO;
import com.dto.MemberDTO;
import com.service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;

    private static final Logger logger = LoggerFactory.getLogger(CustomerController.class.getSimpleName());

    @RequestMapping("/MainCustomer")
    public String mainCustomer(){
        return "MainCustomer";
    }

    @RequestMapping("/MainHowToUse")
    public String mainHowToUse(){
        return "MainHowToUse";
    }

    @PostMapping("/loginCheck/customer_question")
    public String customerQuestion(CustomerQnADTO customerQnADTO, HttpSession session) {
        logger.debug("{}", customerQnADTO);
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        customerQnADTO.setUser_id(login.getUser_id());

        int n = customerService.questionAdd(customerQnADTO);
        logger.debug("{} insert 갯수 ", n);
        return "redirect:/MainCustomer";
    }

    @GetMapping("/userQuestionList")
    public String userQuestionList(HttpSession session) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        List<CustomerQnADTO> customerQnADTOList = customerService.userQuestionList(login.getUser_id());
        logger.debug("나의 문의내역 리스트 : {}", customerQnADTOList);
        return null; //나의 문의내역 테이블로 리턴
    }


}

