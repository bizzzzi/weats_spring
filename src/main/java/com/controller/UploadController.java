package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadController {
    @RequestMapping(value="/uploadAjax")
    public void uploadAjax(){
        //uploadAjax.jsp로 포워딩
    }
}
