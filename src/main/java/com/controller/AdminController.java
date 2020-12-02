package com.controller;

import com.dto.MemberDTO;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
        System.out.println(list);
        return "redirect:/AdminMember";
    }
}
