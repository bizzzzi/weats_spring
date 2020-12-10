package com.controller;

import com.dto.CustomerQnADTO;
import com.dto.MemberDTO;
import com.service.CustomerService;
import com.service.MemberService;
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

@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;

    @Autowired
    MemberService memberService;

    private static final Logger logger = LoggerFactory.getLogger(CustomerController.class.getSimpleName());

//    @RequestMapping("/MainCustomer")
//    public String mainCustomer(){
//        return "MainCustomer";
//    }
//
//    @RequestMapping("/QA_howToUse")
//    public String mainHowToUse(){
//        return "MainHowToUse";
//    }

//    @RequestMapping("/loginCheck/QA_question")
//    public String MainQuestion(){
//        return "redirect:/MainQuestion";
//    }
    @RequestMapping("/QA_Support")
    public String MainCustomerSupport(){
        return "MainSupport";
    }

    @RequestMapping("/supportDetail")
    public String SupportDetail(){
        return "MainSupportDetail";
    }

    @RequestMapping("/adminCheck/SupportWrite")
    public String SupportWrite(){
        return "MainSupportWrite";
    }

    @RequestMapping("/adminCheck/SupportList")
    public String SupportList(){
        return "MainSupportList_admin";
    }

//  1대1 문의하기 (글쓰기)
    @PostMapping(value = {"/loginCheck/questionWrite", "/adminCheck/questionWrite"})
    public String questionWrite(CustomerQnADTO customerQnADTO, HttpSession session, HttpServletRequest request) {
        logger.debug("해당 uri : {} ", request.getRequestURI());
        logger.debug("{}", customerQnADTO);
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        customerQnADTO.setUser_id(login.getUser_id());
        customerQnADTO.setUser_email(login.getUser_email());

        if(request.getRequestURI().contains("adminCheck")) { //관리자 답변 시
            customerQnADTO.setUser_name("관리자");
            customerService.questionWrite(customerQnADTO);
            customerService.answerSuccess(customerQnADTO.getQuestion_group());
            return "redirect:AllQuestionList";
        } else {
            customerQnADTO.setUser_name(login.getUser_name());
            customerService.questionWrite(customerQnADTO);
            if(customerQnADTO.getQuestion_group() != null) { //사용자 재 문의 시
                customerService.reQuestion(customerQnADTO.getQuestion_group());
                return "redirect:userQuestionList";
            } else { //문의글 작성 시
                return "redirect:userQuestionList";
            }
        }
    }

    // 문의 내역 리스트
    @GetMapping(value = {"/adminCheck/AllQuestionList", "/loginCheck/userQuestionList"})
    public String AllQuestionList(Model model, HttpServletRequest request, HttpSession session) {
        List<CustomerQnADTO> customerQnADTOList = new ArrayList<CustomerQnADTO>();
        if(request.getRequestURI().contains("adminCheck")) {
            customerQnADTOList = customerService.AllQuestionList();
        } else {
            MemberDTO login = (MemberDTO) session.getAttribute("login");
            customerQnADTOList = customerService.userQuestionList(login.getUser_id());
        }
        logger.debug("모든 1대1 문의 리스트 : {} ",customerQnADTOList);
        List<CustomerQnADTO> qnaList = new ArrayList<CustomerQnADTO>();
        for(CustomerQnADTO dto: customerQnADTOList) {
            if(dto.getQuestion_id().equals(dto.getQuestion_group())) {
                qnaList.add(dto);
            }
        }
        model.addAttribute("qnaList", qnaList);
        return "MainQuestionList";
    }

    //문의 상세 페이지
    @RequestMapping(value = {"/adminCheck/questionDetail", "/loginCheck/questionDetail"})
    public String AdminQuestionDetail(@RequestParam("q_group") String question_group, Model model, HttpServletRequest request) {
        System.out.println("넘어옴");
        List<CustomerQnADTO> customerQnADTOList = customerService.questionDetail(question_group);
        CustomerQnADTO customerQnADTO = customerQnADTOList.get(0); //원 게시글
        customerQnADTOList.remove(0); //리스트에서 원 게시글 삭제

        model.addAttribute("dto", customerQnADTO); //원 게시글
        model.addAttribute("list", customerQnADTOList);
        return "MainQuestionDetail";
    }



}

