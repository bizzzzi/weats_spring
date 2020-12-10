package com.controller;

import com.dto.KakaoPayCancelDTO;
import com.dto.MemberDTO;
import com.dto.ReservationDTO;
import com.dto.ReservationItemDTO;
import com.service.KakaoPay;
import com.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class KakaoPayController {

    @Autowired
    private KakaoPay kakaopay;

    @Autowired
    private ReserveService service;

    @PostMapping("loginCheck/kakaoPay")
    public String kakaoPay(@RequestParam Map<String, String> map, @RequestParam(value="item_title") List<String> item_title
            , @RequestParam(value="rs_item_id") List<String> item_id, @RequestParam(value="rs_item_person") List<String> item_person
            , @RequestParam(value="rs_item_price") List<String> item_price, HttpSession session) {
        System.out.println("Controller kakaoPay()");

        MemberDTO mDTO = (MemberDTO) session.getAttribute("login");

        String user_id = mDTO.getUser_id();
        String leports_id = (String)session.getAttribute("leports_id");
        String rs_name  = map.get("rs_name");
        String rs_phone  = map.get("rs_phone");
        int quantity  = Integer.parseInt(map.get("totalPersonnelConut"));
        String rs_date = map.get("reserveDay");
        int total_price = Integer.parseInt(map.get("totalPrice"));
        String item_name = "";
        if(item_title.size() > 1) {
            item_name = item_title.get(0).replaceAll("[\\[\\]]", "") +" 외 "+ (item_title.size()-1);
        } else {
            item_name = item_title.get(0).replaceAll("[\\[\\]]", "");
        }

        //카카오 페이 결제 버튼 클릭 시 db에 insert (결제가 제대로 완료되지 않으면 delete, 예약 번호 때문)
        ReservationDTO dto = new ReservationDTO(null, user_id,leports_id, rs_name, rs_phone,quantity,
                "카카오 페이", rs_date, null, total_price, item_name, null, 0);
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
            ReservationItemDTO itemDTO = null;
            List<ReservationItemDTO> itemList = new ArrayList<ReservationItemDTO>();
            for(int i=0; i<item_title.size(); i++) {
                itemDTO = new ReservationItemDTO(null, item_title.get(i).replaceAll("[\\[\\]]", "")
                        , Integer.parseInt(item_person.get(i).replaceAll("[\\[\\]]", "")), Integer.parseInt(item_price.get(i).replaceAll("[\\[\\]]", "")
                ), reservation_id, item_id.get(i).replaceAll("[\\[\\]]", ""));
                service.reserveItemAdd(itemDTO);

                //list로 넘겨서 insert하는거 수정해야되는데 막혔음
//                itemDTO = new ReservationItemDTO(null, item_title.get(i).replaceAll("[\\[\\]]", "")
//                        , Integer.parseInt(item_person.get(i).replaceAll("[\\[\\]]", "")), Integer.parseInt(item_price.get(i).replaceAll("[\\[\\]]", "")
//                ), reservation_id, item_id.get(i).replaceAll("[\\[\\]]", ""));
//                itemList.add(itemDTO);
//                service.reserveItemAdd(itemList);

            }
        }

        session.setAttribute("user_info", map);
        session.setAttribute("item_name", item_name);
        return  "redirect:"+kakaopay.kakaoPayReady(map, item_name);
    }

    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        //pg_token : 결제승인 요청을 인증하는 토큰
        //사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달

        Map<String, String> map = (Map<String, String>) session.getAttribute("user_info");
        String item_name =  (String)session.getAttribute("item_name");

        model.addAttribute("pay_info", kakaopay.kakaoPayInfo(pg_token, map));
        model.addAttribute("user_info", map);
        session.removeAttribute("user_info");
        session.removeAttribute("item_title");
        return "payment/kakaoPaySuccess";
    }
    @GetMapping(value = {"/kakaoPayReadyCancel",  "/kakaoPaySuccessFail"})
    public String kakaoPayFailOrCancel(HttpSession session, RedirectAttributes rttr) {
        //결제가 제대로 완료되지 않았을 때
        Map<String, String> map = (Map<String, String>) session.getAttribute("user_info");
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
        String user_id = memberDTO.getUser_id();
        String reservation_id = map.get("reservation_id");

        map.put("user_id", user_id);
        map.put("reservation_id", reservation_id);
        service.deleteReserve(map);
//        service.deleteReserveItem(reservation_id);
        session.removeAttribute("user_info");
        session.removeAttribute("item_title");
        
        //상품 상세페이지로 이동
        String leports_id = (String)session.getAttribute("leports_id");
        rttr.addAttribute("leports_id", leports_id);
        return "redirect:leportsDetail";
    }


    @GetMapping("/kakaopayCancel")
    public String kakaopayCancel(HttpSession session, Model model) {
        System.out.println("kakaopay Cancel");
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
        String rs_price = (String) session.getAttribute("rs_price");
        String reservation_id = (String) session.getAttribute("reservation_id");

        Map<String,String> map = new HashMap<String,String>();
        map.put("user_id", memberDTO.getUser_id());
        map.put("reservation_id", reservation_id);
        String tid = service.tidSearch(map); //tid 검색
        if(tid != null) {
            model.addAttribute("cancel_info", kakaopay.kakaopayCancel(tid, rs_price));
            service.deleteReserve(map);
            session.removeAttribute("reservation_id");
            session.removeAttribute("rs_price");
        }
        return "payment/kakaoPayCancel";
    }
}
