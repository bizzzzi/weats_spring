package com.controller;

import com.dto.MemberDTO;
import com.dto.TradeCommentsDTO;
import com.dto.TradeDTO;
import com.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TradeController {
    @Autowired
    TradeService service;

    //중고거래 상품 리스트
    @RequestMapping(value="/TradeList")
    public ModelAndView TradeList(String trade_type){
        List<TradeDTO> list=null;
        if(trade_type==null){
            list=service.TradeList("판매");
        }else{
            list= service.TradeList(trade_type);
        }
        ModelAndView mav=new ModelAndView();
        mav.addObject("tradeList",list);
        mav.setViewName("tradeList");
        return mav;
    }

    //내가 올린 상품
    @RequestMapping(value="/loginCheck/TradeList")
    public String SelectSelf(HttpSession session, RedirectAttributes attr){
        List<TradeDTO> list=null;
        MemberDTO dto = (MemberDTO)session.getAttribute("login");
        list = service.SelectSelf(dto.getUser_id());
        attr.addFlashAttribute("tradeList",list);
        return "redirect:../tradeList";
    }

    //중고거래 상품 등록
    @RequestMapping(value="/loginCheck/TradeWrite")
    public String TradeWrite(HttpSession session,TradeDTO dto){
        MemberDTO member = (MemberDTO)session.getAttribute("login");
        dto.setUser_id(member.getUser_id());
        System.out.println(dto);
        return null;
    }

    @RequestMapping(value="/TradeDetail")
    public ModelAndView tradeDetail(String trade_id){
        System.out.println("tradeDetail:"+trade_id);
        TradeDTO dto=service.TradeDetail(trade_id);
        List<TradeCommentsDTO> list=service.CommentList(trade_id);
        ModelAndView mav=new ModelAndView();
        List<TradeCommentsDTO> list2=new ArrayList<>();
        for(TradeCommentsDTO x:list){
            if(x.getTrade_depth()==1){
                list2.add(x);
            }
        }
        mav.addObject("dto",dto);
        mav.addObject("commentsList",list);
        mav.addObject("recommentsList",list2);
        System.out.println(list2);
        mav.setViewName("tradeDetail");
        return mav;
    }
}
