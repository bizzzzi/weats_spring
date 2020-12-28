package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LeportsReserveController {

    @RequestMapping("/loginCheck/leportsReserve")
    public String reserve(Model model,
                          @ModelAttribute("main_img") String main_img, @ModelAttribute("leports_title") String leports_title,
                          @ModelAttribute("c_address") String c_address, @ModelAttribute("c_detail_address") String c_detail_address,
                          @ModelAttribute("totalPrice") String totalPrice, @ModelAttribute("reserveDay") String reserveDay,
                          @ModelAttribute("totalPersonnelConut") String totalPersonnelConut,
                          @RequestParam(value = "item_name") List<String> item_title,
                          @RequestParam(value = "items_price") List<String> item_price,
                          @RequestParam(value = "itemId") List<String> itemId,
                          @RequestParam(value = "reserve_count") List<String> reserve_count) {
        model.addAttribute("item_title", item_title);
        model.addAttribute("item_price", item_price);
        model.addAttribute("itemId", itemId);
        model.addAttribute("reserve_count", reserve_count);
        return "MainPayment";
    }

    //	예약 완료 메일 전송
    @PostMapping("/loginCheck/successMail")
    public String successMail(String reservation_id, String user_email, String user_name, String item_name, String total_price, HttpSession session, RedirectAttributes rttr) {
        System.out.println("예약자 이메일 " + user_email);
        String localhost = "http://125.141.55.162:8080/weats/";
        String title = "weats 예약 완료 메일";
        String content = "<h3>정상적으로 예약이 완료되었습니다.</h3> <br>" +
                "<b>주문 번호 : </b> " + reservation_id + "<br>" +
                "<b>예약자 성함 : </b> " + user_name + "<br>" +
                "<b>예약 상품 : </b> " + item_name + "<br>" +
                "<b>총 결제 금액 : </b> " + total_price + "원<br>" +
                "<a href='" + localhost + "'>weats로 이동</a>";
        System.out.println(user_email);
        session.setAttribute("tomail", user_email);
        rttr.addFlashAttribute("content", content);
        rttr.addFlashAttribute("title", title);

        return "redirect:/mailSending";
    }

//  예약 취소 메일 전송
    @PostMapping("/loginCheck/cancelMail")
    public String cancelMail(String reservation_id, String user_email, String item_name, String total_price, HttpSession session, RedirectAttributes rttr) {
        System.out.println("예약자 이메일 " + user_email);
        String localhost = "http://125.141.55.162:8080/weats/";
        String title = "weats 예약 취소 메일";
        String content = "<h3>정상적으로 예약 취소가 완료되었습니다.</h3> <br>" +
                "<b>주문 번호 : </b> " + reservation_id + "<br>" +
                "<b>예약 취소 상품 : </b> " + item_name + "<br>" +
                "<b>예약 취소 금액 : </b> " + total_price + "원<br>" +
                "<a href='" + localhost + "'>weats로 이동</a>";
        System.out.println(user_email);
        session.setAttribute("tomail", user_email);
        rttr.addFlashAttribute("content", content);
        rttr.addFlashAttribute("title", title);

        return "redirect:/mailSending";
    }
}
