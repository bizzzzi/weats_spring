package com.controller;

import com.dto.CustomerQnADTO;
import com.dto.MemberDTO;
import com.service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @RequestMapping("/QA_howToUse")
    public String mainHowToUse(){
        return "MainHowToUse";
    }

    @RequestMapping("/loginCheck/QA_question")
    public String MainQuestion(){
        return "redirect:/MainQuestion";
    }
//  1대1 문의하기
    @PostMapping(value = {"/loginCheck/questionWrite", "/adminCheck/questionWrite"})
    public String questionWrite(CustomerQnADTO customerQnADTO, HttpSession session, HttpServletRequest request) {
        logger.debug("해당 uri : {} ", request.getRequestURI());
        logger.debug("{}", customerQnADTO);
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        customerQnADTO.setUser_id(login.getUser_id());
        customerQnADTO.setUser_email(login.getUser_email());
        customerQnADTO.setUser_name(login.getUser_name());

        int n = customerService.questionWrite(customerQnADTO);
        logger.debug("{} insert 갯수 ", n);
        if(request.getRequestURI().contains("adminCheck")) {
            customerService.answerSuccess(customerQnADTO.getQuestion_group());
            return "redirect:../adminCheck/AllQuestionList";
        } else {
            return "redirect:/MainCustomer";
        }
    }

//  나의 문의내역
    @GetMapping("/loginCheck/userQuestionList")
    public String userQuestionList(HttpSession session, Model model) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        List<CustomerQnADTO> customerQnADTOList = customerService.userQuestionList(login.getUser_id());
        logger.debug("나의 문의내역 리스트 : {}", customerQnADTOList);
        model.addAttribute("myQnalist", customerQnADTOList);
        return "MainQuestionList"; //나의 문의내역 테이블로 리턴
    }

    //  관리자 페이지에서 보여줄 1대1 문의 리스트
    @GetMapping("/adminCheck/AllQuestionList")
    public String AllQuestionList(Model model) {
        List<CustomerQnADTO> customerQnADTOList = customerService.AllQuestionList();
        logger.debug("모든 1대1 문의 리스트 : {} ",customerQnADTOList);
        List<CustomerQnADTO> qnaList = new ArrayList<CustomerQnADTO>();
        for(CustomerQnADTO dto: customerQnADTOList) {
            if(dto.getQuestion_id() == dto.getQuestion_group()) {
                qnaList.add(dto);
            }
        }
        model.addAttribute("qnaList", qnaList);
        return "/AdminQuestion";
    }

    //문의 상세 페이지
    @PostMapping("/adminCheck/queationDetail")
    public String AdminQuestionDetail(String question_group, Model model, HttpServletRequest request) {

        logger.debug("해당 uri : {} ", request.getRequestURI());
        List<CustomerQnADTO> customerQnADTOList = customerService.questionDetail(question_group);
//        logger.debug("해당 문의 내용 {} ", customerQnADTO);
        CustomerQnADTO customerQnADTO = customerQnADTOList.get(0); //원 게시글
        customerQnADTOList.remove(0); //리스트에서 원 게시글 삭제
        model.addAttribute("dto", customerQnADTO); //원 게시글
        model.addAttribute("list", customerQnADTOList); //아래 달린 답변 또는 문의
        return "AdminQuestionDetail";
    }



}

