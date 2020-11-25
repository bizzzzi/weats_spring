package com.controller;

import com.service.KakaoPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestKakaoPay {

    @Autowired
    private KakaoPay kakaopay;

    @RequestMapping("/kakaoPay")
    public String kakaoPay() {
        System.out.println("Controller kakaoPay()");
        return  "redirect:"+kakaopay.kakaoPayReady();
    }

    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);
    }

}
