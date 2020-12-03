package com.controller;

import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

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


}
