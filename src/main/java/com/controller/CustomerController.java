package com.controller;

import com.dto.CustomerQnADTO;
import com.dto.CustomerSupportDTO;
import com.dto.MemberDTO;
import com.service.CustomerService;
import com.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @RequestMapping("/QA_Support")
    public String MainCustomerSupport(){
        return "MainSupport";
    }


//  1대1 문의하기 (글쓰기)
    @PostMapping(value = {"/loginCheck/questionWrite", "/adminCheck/questionWrite"})
    public String questionWrite(CustomerQnADTO customerQnADTO, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
        logger.debug("해당 uri : {} ", request.getRequestURI());
        logger.debug("{}", customerQnADTO);
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        customerQnADTO.setUser_id(login.getUser_id());
        if(customerQnADTO.getUser_email() == null) customerQnADTO.setUser_email(login.getUser_email());

        if(request.getRequestURI().contains("adminCheck")) { //관리자 답변 시
            customerQnADTO.setUser_name("관리자");
            customerService.questionWrite(customerQnADTO); //답변 db등록
            customerService.answerSuccess(customerQnADTO.getQuestion_group()); //원 게시글 answer_verify = 1
            rttr.addAttribute("q_group",customerQnADTO.getQuestion_group() );

        } else {
            customerQnADTO.setUser_name(login.getUser_name());
            customerService.questionWrite(customerQnADTO);
            if(customerQnADTO.getQuestion_group() != null) { //사용자 재 문의 시
                customerService.reQuestion(customerQnADTO.getQuestion_group()); //원 게시글 answer_verify = 0
            } else {
                return "redirect:userQuestionList";
            }
        }
                rttr.addAttribute("q_group",customerQnADTO.getQuestion_group() );
        return "redirect:questionDetail";
    }

    @PostMapping("/adminCheck/answerMail")
    public String answerMail(String user_email, HttpSession session, RedirectAttributes rttr) {
        String localhost = "http://localhost:8080/weats/";
        String title = "weats 1대1 문의 답변";
        String content = "1대1 문의에 답변이 달렸습니다. 확인 바랍니다. <a href='"+localhost+"'>weats로 이동</a>" ;
        System.out.println(user_email);
        session.setAttribute("tomail", user_email);
        rttr.addFlashAttribute("content", content);
        rttr.addFlashAttribute("title", title);

        return "redirect:/mailSending";
    }

    //1대1 문의 내역 리스트
    @GetMapping(value = {"/adminCheck/AllQuestionList", "/loginCheck/userQuestionList"})
    public String AllQuestionList(Model model, HttpServletRequest request, HttpSession session) {
        List<CustomerQnADTO> customerQnADTOList = new ArrayList<CustomerQnADTO>();
        if(request.getRequestURI().contains("adminCheck")) { //관리자, 모든 문의내역
            customerQnADTOList = customerService.questionList();
        } else { //사용자, 나의 문의내역
            MemberDTO login = (MemberDTO) session.getAttribute("login");
            customerQnADTOList = customerService.questionList(login.getUser_id());
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

    //1대1 문의 상세 페이지
    @GetMapping(value = {"/adminCheck/questionDetail", "/loginCheck/questionDetail"})
    public String AdminQuestionDetail(@RequestParam("q_group") String question_group, Model model, HttpServletRequest request) {
        System.out.println("넘어옴");
        List<CustomerQnADTO> customerQnADTOList = customerService.questionDetail(question_group);
        CustomerQnADTO customerQnADTO = customerQnADTOList.get(0); //원 게시글
        customerQnADTOList.remove(0); //리스트에서 원 게시글 삭제

        model.addAttribute("dto", customerQnADTO); //원 게시글
        model.addAttribute("list", customerQnADTOList);
        return "MainQuestionDetail";
    }

    //관리자가 FAQ 등록
    @PostMapping("/adminCheck/supportWrite")
    public String SupportWrite(CustomerSupportDTO supportDTO){
        logger.debug("관리자 faq 등록 ==> {}", supportDTO );
        customerService.supportWrite(supportDTO);
        return "redirect:supportList";
    }

//    FAQ List
    @GetMapping(value = {"/adminCheck/supportList", "/supportList"})
    public String SupportList(HttpServletRequest request, Model model, @ModelAttribute("s_type") String s_type){
        String next = "";
        List<CustomerSupportDTO> supportDTOList = new ArrayList<>();
        if(request.getRequestURI().contains("adminCheck")){
            supportDTOList = customerService.supportList();
            next = "MainSupportList_admin";
        } else {
            logger.debug("질문 타입 ===> {}", s_type);
            supportDTOList = customerService.supportList(s_type);
            next = "MainSupport";
        }
        model.addAttribute("supportList", supportDTOList);
        return next;

    }
//    FAQ Detail
    @GetMapping(value = {"/adminCheck/supportDetail", "/supportDetail"})
    public String SupportDetail(HttpServletRequest request, Model model, String support_id){
        logger.debug("질문 ID ===> {} ", support_id);
        CustomerSupportDTO supportDTO = customerService.supportDetail(support_id);
        model.addAttribute("support", supportDTO);
        if(request.getRequestURI().contains("adminCheck")){
            return "MainSupportDetail";
        } else{
            return null;
        }


    }

    //    FAQ Update
    @PostMapping("/adminCheck/supportUpdate")
    public String SupportUpdate(CustomerSupportDTO supportDTO) {
        customerService.supportUpdate(supportDTO);
        return "redirect:supportList";
    }

    //    FAQ Delete
    @PostMapping("/adminCheck/supportDelete")
    public String SupportDelete(String support_id) {
        customerService.supportDelete(support_id);
        return "redirect:supportList";
    }


    // FAQ Search
    @GetMapping("/supportSearch")
    public String supportSearch(String search, Model model) {
        List<CustomerSupportDTO> supportDTOList = customerService.supportSearch(search);
        logger.debug("검색 리스트 : {}", supportDTOList);
        model.addAttribute("supportList", supportDTOList);
        return null;
    }

}

