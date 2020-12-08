package com.controller;

import com.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
    @Autowired
    CustomerService service;

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

    @RequestMapping("/loginCheck/QA_questionList")
    public String MainQuestionList(){
        return "redirect:/MainQuestionList";
    }

}

