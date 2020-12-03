package com.controller;

import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import com.encrypt.SHA256;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired
    AdminService service;

    @RequestMapping(value="/memberList")
    public String MemberList(RedirectAttributes attr){
        List<MemberDTO> list = service.MemberList();
        attr.addFlashAttribute("memberList",list);
        return "redirect:/AdminMember";
    }
    //파트너 회원 승인여부 구분하기
    @RequestMapping(value="/partnerList")
    public String PartnerList(RedirectAttributes attr){
        List<PartnerDTO> list =service.PartnerList();
        attr.addFlashAttribute("PartnerList",list);
        return "redirect:/AdminPartner";
    }

    @RequestMapping(value="/AdminPartnerDetail")
    public ModelAndView AdminPartnerDetail(String pID){
        System.out.println("파트너 아이디: "+pID);
        ModelAndView mav = new ModelAndView();
        PartnerDTO dto = service.PartnerDetail(pID);
        mav.addObject("dto",dto);
        System.out.println(dto);
        mav.setViewName("AdminPartnerDetail");
        return mav;
    }
    @RequestMapping("/partnerConfirm")
    public String partnerConfirm(String uID,HttpSession session, RedirectAttributes attr){
        String partner_email = service.PartnerEmail(uID);
        String code = SHA256.getEncrypt(partner_email, "cos");
        String title = "weats 파트너 승인이 완료되었습니다.";
        String content = "weats와 함께 해주셔서 감사합니다. 파트너 승인이 완료되었습니다." ;
        session.setAttribute("tomail", partner_email);
        session.setAttribute("code", code);
        attr.addFlashAttribute("content", content);
        attr.addFlashAttribute("title", title);
        attr.addFlashAttribute("uID", uID);
        return "redirect:/partnerSending";
    }
    @RequestMapping("/partnerUpdate")
    public String partnerUpdate(HttpServletRequest request){
        Map<String,?> map = RequestContextUtils.getInputFlashMap(request);
        String user_id = (String)map.get("uID");
        System.out.println("partnerUpdate: "+user_id);
        int result = service.PartnerUpdate(user_id);
        System.out.println("2로 변경"+result);
        return "redirect:/partnerList";
    }
}
