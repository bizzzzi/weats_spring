package com.controller;

import com.service.KakaoPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class TestKakaoPay {

    @Autowired
    private KakaoPay kakaopay;

    @RequestMapping("/kakaoPay")
    public String kakaoPay(@RequestParam Map<String, ?> map, @RequestParam(value="item_title") List<String> item_title) {

        System.out.println("Controller kakaoPay()");
        return  "redirect:"+kakaopay.kakaoPayReady(map, item_title);
    }

    @RequestMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        //pg_token : 결제승인 요청을 인증하는 토큰
        //사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);
        model.addAttribute("payInfo", kakaopay.kakaoPayInfo(pg_token));
        return "payment/kakaoPaySuccess";
    }

}
