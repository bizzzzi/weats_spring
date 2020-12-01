package com.controller;

import com.dto.MemberDTO;
import com.encrypt.SHA256;
import com.encrypt.UserVerify;
import com.service.MemberService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberManagerController {

    @Autowired
    MemberService service;

    @Autowired
    UserVerify userVerify;

    @GetMapping("/loginCheck/passwdCheck")
    public String passwdCheckPage(String page, HttpSession session) {
        if(page != null) {
            session.setAttribute("page", page);
        }
        return "passwdCheck/passwdCheck";
    }
    @PostMapping("/loginCheck/passwdCheck")
    public String passwdCheck(String user_pw, HttpSession session) {
        String page = (String)session.getAttribute("page");
        MemberDTO login_dto = (MemberDTO) session.getAttribute("login");
        String user_email = login_dto.getUser_email();

        MemberDTO dto = userVerify.verify(user_email, user_pw);

        String next = "";
        if(dto != null) { //비번 인증 완료
            System.out.println("비번 인증 완료");

            if(page.equals("delete")) { //회원 탈퇴 클릭시 넘어오는 page 키의 value
                service.memberDelete(user_email);
                System.out.println("회원 탈퇴 완료");
                session.removeAttribute("login");
                next = "redirect:/";
            } else if(page.equals("pwchange")) { //비밀번호 변경 버튼 클릭 시
                next = "redirect:/passwdChange";
            } else if(page.equals("reserve")){
                next = "redirect:/MainUserReservation";
            }
        } else { //비번 인증 실패 시
            session.setAttribute("mesg", "비밀번호를 잘못 입력하셨습니다.");
            next = "redirect:passwdCheck";
        }
        return next;
    }

    @PostMapping("/loginCheck/passwdChange")
    public String passwdChacge(HttpSession session, @RequestParam("new_pw") String pw) {
        MemberDTO login_dto = (MemberDTO) session.getAttribute("login");
        String user_email = login_dto.getUser_email();
        String salt = service.getSaltMember(user_email);
        System.out.println(user_email);
        System.out.println(salt);
        String new_pw = SHA256.getEncrypt(pw, salt);
        Map<String, String> map = new HashMap<String, String>();
        map.put("user_email", user_email);
        map.put("user_pw",new_pw);
        service.pwUpdate(map);

        return "redirect:/MainAccountManagement";
    }
}
