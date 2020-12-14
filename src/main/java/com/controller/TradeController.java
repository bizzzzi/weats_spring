package com.controller;

import com.dto.MemberDTO;
import com.dto.TradeCommentsDTO;
import com.dto.TradeDTO;
import com.service.TradeService;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.*;

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
    public String TradeWrite(){
        final Logger logger = LoggerFactory.getLogger(TradeController.class);
        logger.info("uploadForm");
        return "redirect:../tradeWrite";
    }

    //중고거래 상품 등록
    @RequestMapping(value="/TradeWrite")
    public String TradeWriteForm(MultipartFile[] uploadFile, HttpSession session, TradeDTO dto){
        String uploadFolder = "/Users/hhhhbbbb/upload";

        final Logger logger = LoggerFactory.getLogger(TradeController.class);
        System.out.println("trade_main_img: "+uploadFile);
        System.out.println("중고거래 파일 목록:"+dto);
        for (MultipartFile multipartFile : uploadFile){
            logger.info("originalNmae: "+multipartFile.getOriginalFilename());
            logger.info("origianl File Size: "+ multipartFile.getSize());
            String uploadFileName = multipartFile.getOriginalFilename();
            System.out.println("uploadFileName: "+uploadFileName);
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
            System.out.println("uploadFileName2: "+uploadFileName);
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString()+"_"+uploadFileName;
            File savaFile = new File(uploadFolder, uploadFileName);
            try{
                multipartFile.transferTo(savaFile);
            }catch (Exception e){
                logger.error(e.getMessage());
            }
        }
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
        System.out.println("댓글");
        MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
        cDTO.setUser_id(mDTO.getUser_id());
        int result = 0;
        String nextPage = null;
        cDTO.setTrade_comment_level(cDTO.getTrade_comment_id());
        result = service.ReCommentWrite(cDTO);
        System.out.println("대댓글depth: "+cDTO.getTrade_depth());
        System.out.println("대댓글 insert결과: "+result+cDTO);
        String CommentJSON = "{\"trade_comment_id\": \"" + cDTO.getTrade_comment_id() + "\",\"comment_regidate\":\""+service.CommentRegidate(cDTO.getTrade_comment_id())+"\",\"trade_comment\":\""+cDTO.getTrade_comment()+"\",\"user_id\":\""+cDTO.getUser_id()+"\"}";
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

