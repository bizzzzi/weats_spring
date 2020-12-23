package com.controller;

import com.dto.CustomerQnADTO;
import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import com.encrypt.SHA256;
import com.service.AdminService;
import com.service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String MemberList(Model model){
        List<MemberDTO> list = service.MemberList();
        model.addAttribute("memberList",list);
        return "AdminMember";
    }
    //파트너 회원 승인여부 구분하기
    @RequestMapping(value="/partnerList")
    public String PartnerList(Model model){
        List<PartnerDTO> list =service.PartnerList();
        model.addAttribute("PartnerList",list);
        return "AdminPartner";
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
    @RequestMapping(value="/partnerConfirm")
    public String partnerConfirm(String uID,String reject, HttpSession session, RedirectAttributes attr){
        String partner_email = service.PartnerEmail(uID);
        String code = SHA256.getEncrypt(partner_email, "cos");
        String title = "weats 파트너 승인 결과입니다.";
        String content = "";
        String result = "";
        if(reject != null){//partner 비승인
            content = "weats와 함께 해주셔서 감사합니다. 파트너 승인 결과는 불합격입니다." ;
            result = "reject";
        }else{
            content = "weats와 함께 해주셔서 감사합니다. 파트너 승인이 완료되었습니다." ;
            result = "success";
        }
        session.setAttribute("tomail", partner_email);
        session.setAttribute("code", code);
        attr.addFlashAttribute("title", title);
        attr.addFlashAttribute("uID", uID);
        attr.addFlashAttribute("content", content);
        attr.addFlashAttribute("result", result );
        return "redirect:/partnerSending";
    }
    @RequestMapping("/partnerUpdate")
    public String partnerUpdate(HttpServletRequest request){
        Map<String,?> map = RequestContextUtils.getInputFlashMap(request);
        String user_id = (String)map.get("uID");
        String result = (String)map.get("result");
        MemberDTO dto = new MemberDTO();
        dto.setUser_id(user_id);
        if(result == "success"){
            dto.setPartner_verify(2);
            service.PartnerUpdate(dto);
        }else{
            dto.setPartner_verify(0);
            service.PartnerUpdate(dto);
            service.PartnerDel(user_id);
        }
        return "redirect:/partnerList";
    }


}
