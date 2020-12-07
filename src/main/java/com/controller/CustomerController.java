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

    @RequestMapping("/MainHowToUse")
    public String mainHowToUse(){
        return "MainHowToUse";
    }

}

