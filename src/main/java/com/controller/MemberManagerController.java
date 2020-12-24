package com.controller;

import com.dto.LeportsReviewDTO;
import com.dto.MemberDTO;
import com.dto.MyReserveDTO;
import com.dto.ReservationItemDTO;
import com.encrypt.SHA256;
import com.encrypt.UserVerify;
import com.service.LeportsService;
import com.service.MemberService;
import com.service.ReserveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberManagerController {

    @Autowired
    MemberService memberService;

    @Autowired
    ReserveService reserveService;

    @Autowired
    LeportsService leportsService;

    @Autowired
    UserVerify userVerify;

    private static final Logger logger = LoggerFactory.getLogger(MemberManagerController.class.getSimpleName());

    @GetMapping("/loginCheck/passwdCheck")
    public String passwdCheckPage(String page, String reservation_id, String leports_id, String rs_price, HttpSession session) {
        if(page != null) {
            session.setAttribute("page", page);
        }
        if(reservation_id != null && rs_price != null) {
            session.setAttribute("reservation_id", reservation_id);
            session.setAttribute("rs_price", rs_price);
        }
        logger.debug("레포츠 아이디 : {} ", leports_id);
        if(leports_id != null) session.setAttribute("leports_id", leports_id);
        return "passwdCheck/passwdCheck";
    }
    @PostMapping("/loginCheck/passwdCheck")
    public String passwdCheck(String user_pw, HttpSession session) {
        String page = (String)session.getAttribute("page");
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String user_email = login.getUser_email();
        MemberDTO dto = userVerify.verify(user_email, user_pw);

        String next = "";
        if(dto != null) { //비번 인증 완료
            System.out.println("비번 인증 완료");

            if(page.equals("delete")) { //회원 탈퇴 클릭시 넘어오는 page 키의 value
                memberService.memberDelete(user_email);
                System.out.println("회원 탈퇴 완료");
                session.removeAttribute("login");
                next = "redirect:/";
            } else if(page.equals("pwchange")) { //비밀번호 변경 버튼 클릭 시
                next = "redirect:/passwdChangeForm";
            } else if(page.equals("reserveCancel")){
                next = "redirect:/kakaopayCancel";
            }
        } else { //비번 인증 실패 시
            session.setAttribute("mesg", "비밀번호를 잘못 입력하셨습니다.");
            next = "redirect:passwdCheck";
        }
        return next;
    }

    @PostMapping("/passwdChange")
    public String passwdChacge(HttpSession session, @RequestParam("new_pw") String pw, String user_email) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String next = "redirect:/";
        if(login != null) {
            user_email = login.getUser_email();
            next = "redirect:/MainAccountManagement";
        }
        System.out.println(user_email);
        String salt = memberService.getSaltMember(user_email);
        System.out.println(user_email);
        System.out.println(salt);
        String new_pw = SHA256.getEncrypt(pw, salt);
        Map<String, String> map = new HashMap<String, String>();
        map.put("user_email", user_email);
        map.put("user_pw",new_pw);
        memberService.pwUpdate(map);

        return next;
    }

    @GetMapping("/loginCheck/myReservePage")
    public String myReservePage(HttpSession session, Model model){
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String user_id = login.getUser_id();
        List<MyReserveDTO> list = reserveService.reserveList(user_id);

        model.addAttribute("myReserve", list);
        return "/MainUserReservation";
    }

    @GetMapping("/loginCheck/myReserveDetail")
    public String myReserveDetail(@ModelAttribute("leports_title") String leports_title ,String reservation_id, Model model){
        logger.debug("상세 페이지 예약 아이디 : {}", reservation_id);
        List<ReservationItemDTO> list = reserveService.reserveDetailList(reservation_id);
        for(ReservationItemDTO dto: list) {
            logger.debug("예약 아이템 {}", dto );
        }
        model.addAttribute("itemList", list);
//        예약 내역에서 예약한 레포츠 하나 클릭하면 아이템별로 보여줄 상세 페이지 return
        return "MainReservationDetail";
    }
    
    @PostMapping("/loginCheck/reviewWriteForm")
    public String reviewWriteForm(@ModelAttribute("leports_title") String leports_title, @ModelAttribute("leports_id") String leports_id
            , @ModelAttribute("reservation_id") String reservation_id){
    	
    	return "MainReviewWriteForm";
    }

    @PostMapping("/loginCheck/reviewWrite")
    public String reviewWrite(String leports_id, String reservation_id, String review_comments, String review_star, HttpSession session, RedirectAttributes rttr) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        LeportsReviewDTO LeportsReviewDTO = new LeportsReviewDTO(null, leports_id, reservation_id, login.getUser_id()
                , review_comments, null, null,null, null, Integer.parseInt(review_star), 0);
        int n = reserveService.reviewWrite(LeportsReviewDTO);
        if(n != 0) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("user_id", login.getUser_id());
            map.put("reservation_id", reservation_id);

            reserveService.reviewVerify(map);
            leportsService.reviewCountUp(leports_id);
            rttr.addFlashAttribute("mesg", "리뷰 작성이 완료되었습니다.");
        }
        else rttr.addFlashAttribute("mesg", "리뷰 작성을 다시 시도해주세요.");
        return "redirect:myReservePage";
    }


    @GetMapping("/loginCheck/myReview")
    public String myReview(HttpSession session, Model model) {
        MemberDTO login = (MemberDTO)session.getAttribute("login");
        List<LeportsReviewDTO> reviewList = reserveService.reviewList(login.getUser_id());
        System.out.println(reviewList);
        model.addAttribute("reviewList", reviewList);
        return "MainMyReview";
    }

    @PostMapping("/loginCheck/reviewDelete")
    public String reviewDelete(String review_id, String leports_id, String reservation_id, String review_verify, HttpSession session) {
        Map<String, String> map = new HashMap<String, String>();
        System.out.println(review_id);
        MemberDTO login = (MemberDTO)session.getAttribute("login");
        map.put("user_id", login.getUser_id());
        map.put("review_id", review_id);
        map.put("reservation_id", reservation_id);
        map.put("review_verify", review_verify);

        reserveService.reviewDelete(map);
        reserveService.reviewVerify(map);
        leportsService.reviewCountDown(leports_id);
        return "redirect:myReview";
    }

}
