package com.controller;

import com.dto.AttachFileDTO;
import com.dto.MemberDTO;
import com.dto.TradeCommentsDTO;
import com.dto.TradeDTO;
import com.service.TradeService;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class TradeController {
    @Autowired
    TradeService service;

    @RequestMapping(value="/WriteCancel")
    public String WriteCancel(){
        return "redirect:/TradeList";
    }

    @RequestMapping(value="/loginCheck/TradeUpdate")
    public ModelAndView TradeUpdate(String trade_id){
        System.out.println("tradeID"+trade_id);
        TradeDTO dto= service.TradeDetail(trade_id);
        System.out.println("내가 올린 상품 Detail"+dto);
        ModelAndView mav = new ModelAndView();
        mav.addObject("dto",dto);
        mav.setViewName("tradeUpdate");
        return mav;
    }
    @RequestMapping(value="/TradeUpdate")
    public String TradeUpdateSubmit(TradeDTO dto){
        System.out.println("수정 사항: "+dto);
        int result = service.TradeUpdate(dto);
        System.out.println("수정 결과: "+ result);
        return "redirect:/loginCheck/TradeList";
    }

    @RequestMapping(value="/loginCheck/TradeDelete")
    public String TradeDelete(String trade_id){
        TradeDTO dto = service.TradeDetail(trade_id);
        int result = service.TradeDelete(trade_id);
        List<String> list = new ArrayList<>();
        if(dto.getTrade_main_img()!= null){
            list.add(dto.getTrade_main_img());
        }
        if(dto.getTrade_sub_img1()!= null){
            list.add(dto.getTrade_sub_img1());
        }
        if(dto.getTrade_sub_img2()!= null){
            list.add(dto.getTrade_sub_img1());
        }
        if(dto.getTrade_sub_img3()!= null){
            list.add(dto.getTrade_sub_img1());
        }
        if(dto.getTrade_sub_img4()!= null){
            list.add(dto.getTrade_sub_img1());
        }
        FileUpload.fileDelete(list);
        return "redirect:/TradeList";
    }
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
    public String SelectSelf(HttpSession session, Model model){
        List<TradeDTO> list=null;
        MemberDTO dto = (MemberDTO)session.getAttribute("login");
        list = service.SelectSelf(dto.getUser_id());
        model.addAttribute("tradeList",list);
        return "tradeList";
    }

    //중고거래 상품 등록
    @RequestMapping(value="/loginCheck/TradeWrite")
    public String TradeWrite(){
        return "redirect:../tradeWrite";
    }


    //중고거래 상품 등록
    @RequestMapping(value="/TradeWrite")
    public String TradeWriteForm(HttpSession session, TradeDTO dto){
        MemberDTO member = (MemberDTO)session.getAttribute("login");
        dto.setUser_id(member.getUser_id());
        int result = service.TradeWrite(dto);
        System.out.println("중고거래 상품등록"+"\t"+result);
        return "redirect:/TradeList";
    }



    @RequestMapping(value="/TradeDetail")
    public ModelAndView tradeDetail(String trade_id){
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
        mav.setViewName("tradeDetail");
        return mav;
    }
    @RequestMapping(value = "/loginCheck/TradeReply")
    public String TradeReply(HttpSession session,TradeCommentsDTO cDTO){
        System.out.println("댓글");
        MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
        cDTO.setUser_id(mDTO.getUser_id());
        int result = 0;
        String nextPage = null;
        result = service.CommentWrite(cDTO);
        System.out.println("댓글 결과: "+"\t"+result);
        return "redirect:../TradeDetail?trade_id="+cDTO.getTrade_id();
    }

    @RequestMapping(value="/loginCheck/TradeCommentWrite")
    @ResponseBody
    public void TradeComment(HttpSession session, TradeCommentsDTO cDTO, HttpServletResponse response) throws IOException {
        MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
        cDTO.setUser_id(mDTO.getUser_id());
        int result = 0;
        String nextPage = null;
        cDTO.setTrade_comment_level(cDTO.getTrade_comment_id());
        result = service.ReCommentWrite(cDTO);
        String CommentJSON = "{\"trade_comment_id\": \"" + cDTO.getTrade_comment_id() + "\",\"comment_regidate\":\""+service.CommentRegidate(cDTO.getTrade_comment_id())+"\",\"trade_comment\":\""+cDTO.getTrade_comment()+"\",\"user_id\":\""+cDTO.getUser_id()+"\"}";
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(CommentJSON);
    }
    @RequestMapping(value="/loginCheck/TradeCommentDelete")
    @ResponseBody
    public void CommentDelete(String trade_comment_id,String trade_comment_level, HttpSession session){
        MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
        String user_id = mDTO.getUser_id();
        System.out.println("trade_comment_level:"+"\t"+trade_comment_level+"\t"+"trade_comment_id: "+"\t"+trade_comment_id);
        int result = 0;
        if(trade_comment_id!=null){
            result = service.CommentDel(trade_comment_id);
            System.out.println("댓글 삭제: "+result);
        }else if(trade_comment_level != null){
            result = service.CommentDel2(trade_comment_level);
            System.out.println("댓글 삭제 2: "+"\t"+result);
        }
    }
    @RequestMapping("/loginCheck/TradeCommentUpdate")
    @ResponseBody
    public void TradeCommentUpdate(@RequestParam HashMap<String,String> map, HttpServletResponse response) throws IOException {
        int result = 0;
        map.keySet();
        result = service.CommentUpdate(map);
        String comment_regidate = service.CommentRegidate(map.get("trade_comment_id"));
        System.out.println("댓글 수정: "+result);
        response.getWriter().print(comment_regidate);
    }
}

