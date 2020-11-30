package com.controller;

import com.dto.MemberDTO;
import com.dto.ReservationDTO;
import com.service.KakaoPay;
import com.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
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

        MemberDTO mDTO = (MemberDTO) session.getAttribute("login");

        String user_id = mDTO.getUser_id();
        String leports_id = (String)session.getAttribute("leports_id");
        String rs_name  = map.get("rs_name");
        String rs_phone  = map.get("rs_phone");
        String quantity  = map.get("totalPersonnelConut");
        String rs_date = map.get("reserveDay");
        String total_price = map.get("totalPrice");

        //카카오 페이 결제 버튼 클릭 시 db에 insert (결제가 제대로 완료되지 않으면 delete, 예약 번호 때문)
        ReservationDTO dto = new ReservationDTO(null, user_id,leports_id, rs_name, rs_phone,quantity,
                "카카오 페이", rs_date, null, total_price);
        int n = service.reserveAdd(dto);
        Map<String, String> reserveId_search = new HashMap<>();
        reserveId_search.put("user_id", user_id);
        reserveId_search.put("leports_id", leports_id);
        List<String> list = service.reserveId(reserveId_search);
        //같은 사람이 같은 레포츠를 여러개 예약했을 경우
        //가장 최근에 예약한 번호를 넘겨줌
        if(list != null) {
            Collections.sort(list, Collections.reverseOrder());
            String reservation_id = list.get(0);
            map.put("reservation_id", reservation_id);
        }

        session.setAttribute("user_info", map);
        session.setAttribute("item_title", item_title);
        return  "redirect:"+kakaopay.kakaoPayReady(map, item_title);
    }

    @RequestMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        //pg_token : 결제승인 요청을 인증하는 토큰
        //사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);

        Map<String, String> map = (Map<String, String>) session.getAttribute("user_info");
        List<String> item_title =  (List<String>) session.getAttribute("item_title");

        model.addAttribute("pay_info", kakaopay.kakaoPayInfo(pg_token, map, item_title));
        model.addAttribute("user_info", map);
        session.removeAttribute("user_info");
        session.removeAttribute("item_title");
        return "payment/kakaoPaySuccess";
    }
    @RequestMapping("/kakaoPayCancel")
    public String kakaoPayCancel(HttpSession session, RedirectAttributes rttr) {
        //결제가 제대로 완료되지 않았을 때
        System.out.println("kakaoPayCancel");
        Map<String, String> map = (Map<String, String>) session.getAttribute("user_info");
        String reservation_id = map.get("reservation_id");
        service.deleteReserve(reservation_id);
        session.removeAttribute("user_info");
        session.removeAttribute("item_title");
        
        //상품 상세페이지로 이동
        String leports_id = (String)session.getAttribute("leports_id");
        rttr.addAttribute("leports_id", leports_id);
        return "redirect:leportsDetail";
    }

    @RequestMapping("/kakaoPaySuccessFail")
    public String kakaoPaySuccessFail(HttpSession session, RedirectAttributes rttr) {
        System.out.println("kakaoPaySuccessFail");
        Map<String, String> map = (Map<String, String>) session.getAttribute("user_info");
        String reservation_id = map.get("reservation_id");
        service.deleteReserve(reservation_id);
        session.removeAttribute("user_info");
        session.removeAttribute("item_title");

        //상품 상세페이지로 이동
        String leports_id = (String)session.getAttribute("leports_id");
        rttr.addAttribute("leports_id", leports_id);
        return "redirect:leportsDetail";
    }



}
