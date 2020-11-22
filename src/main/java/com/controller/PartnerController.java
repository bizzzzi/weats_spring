package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.LeportsDTO;
import com.dto.LeportsItemDTO;
import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import com.service.PartnerService;

@Controller
public class PartnerController {
	@Autowired
	PartnerService pservice;
	
	//파트너 등록
	@RequestMapping("/PartnerAdd")
	public String partnerAdd(PartnerDTO dto,HttpSession session) {
		int n=pservice.partnerInsert(dto);
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String user_id=mdto.getUser_id();
		if(n==1) {
			pservice.partner_verifyUpdate(user_id);
		}
		return "main";
	}
	
	//파트너 마이페이지
	@RequestMapping("/PartnerMypage")
	public String PartnerMypage(HttpSession session) {
		MemberDTO mdto=(MemberDTO) session.getAttribute("login");
		String user_id=mdto.getUser_id();
		pservice.partnerSelect(user_id);
		return "";
	}
	
	//마이페이지 수정
	@RequestMapping("/PartnerUpdate")
	public String PartnerUpdate(PartnerDTO dto) {
		pservice.partnerUpdate(dto);
		return "";
	}
	//파트너 탈퇴
	@RequestMapping("/PartnerDelete")
	public String PartnerDelete(String partner_id) {
		pservice.partnerDelete(partner_id);
		return "";
	}
	
	//레포츠 등록
	@RequestMapping("/LeportsAdd")
	public String ProductAdd(LeportsDTO dto) {
		pservice.leportsInsert(dto);
		return "";
	}
	
	//레포츠 아이템 등록
	@RequestMapping("/ItemAdd")
	public String ItemAdd(LeportsItemDTO dto) {
		pservice.leportsItemInsert(dto);
		return "";
	}
	
	//레포츠 등록 리스트
	@RequestMapping("/LeportsAddList")
	public String LeportsAddList(HttpSession session,RedirectAttributes attr) {
		PartnerDTO pdto=(PartnerDTO)session.getAttribute("partner");
		String partner_id=pdto.getPartner_id();
		
		List<LeportsDTO> list=pservice.ProductControl(partner_id);
		attr.addFlashAttribute("leportsAddList",list);
		
		return "";
	}
	
	//상품 상세페이지
	@RequestMapping("/ProductDetail")
	public String ProductDetail(String leports_id) {
		pservice.ProductDetailLeports(leports_id);
		pservice.ProductDetailItem(leports_id);
		
		return "";
	}
	
	//상품 페이지 수정
	@RequestMapping("/ProductUpdate")
	public String ProductUpdate(LeportsDTO ldto,LeportsItemDTO idto) {
		pservice.ProductUpdateLeports(ldto);
		pservice.ProductUpdateItem(idto);
		
		return "";
	}
	//상품 삭제
	@RequestMapping("/ProductDelete")
	public String ProductDelete(String leports_id){
		pservice.leportsDelete(leports_id);
		
		return "";
	}
	
	//예약관리
	@RequestMapping("/ProductResevation")
	public String ProductResevation(HttpSession session) {
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String user_id=mdto.getUser_id();
		pservice.ReservationControl(user_id);
		
		return "";
	}
}
