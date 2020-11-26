package com.controller;

import com.dto.MemberDTO;
import com.dto.ReservationDTO;
import com.service.KakaoPay;
import com.service.LeportsService;
import com.service.ReserveService;
import oracle.ucp.proxy.annotation.Signature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class KakaoPayController {

    @Autowired
    private KakaoPay kakaopay;

    @Autowired
    private ReserveService service;



    @RequestMapping("loginCheck/kakaoPay")
    public String kakaoPay(@RequestParam Map<String, String> map, @RequestParam(value="item_title") List<String> item_title, HttpSession session) {
        System.out.println("Controller kakaoPay()");

        session.setAttribute("info", map);
        session.setAttribute("item_title", item_title);
        return  "redirect:"+kakaopay.kakaoPayReady(map, item_title);
    }

    @RequestMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        //pg_token : 결제승인 요청을 인증하는 토큰
        //사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);

        MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
        Map<String, String> map = (Map<String, String>) session.getAttribute("info");
        List<String> list =  (List<String>) session.getAttribute("item_title");

        String user_id = mDTO.getUser_id();
        String leports_id = (String)session.getAttribute("leports_id");
        String rs_name  = map.get("rs_name");
        String rs_phone  = map.get("rs_phone");
        String quantity  = map.get("totalPersonnelConut");
        String rs_date = map.get("reserveDay");
        String total_price = map.get("totalPrice");

        ReservationDTO dto = new ReservationDTO(null, user_id,leports_id, rs_name, rs_phone,quantity,
                "삭제 예정", rs_date, null, total_price);
        int n = service.reserveAdd(dto);

        System.out.println("1은 성공 : " + n);

        model.addAttribute("payInfo", kakaopay.kakaoPayInfo(pg_token, map, list));
        return "payment/kakaoPaySuccess";
    }

}
