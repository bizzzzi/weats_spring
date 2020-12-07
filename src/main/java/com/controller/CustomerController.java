package com.controller;

import com.service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
    @Autowired
    CustomerService service;

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
    public String customerQuestion() {
        System.out.println("bbbb");
        logger.debug("aaaa");
        return null;
    }


}

