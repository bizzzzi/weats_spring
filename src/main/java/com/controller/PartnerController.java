package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.LeportsDTO;
import com.dto.LeportsDetailDTO;
import com.dto.LeportsItemDTO;
import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import com.dto.ReservationControlDTO;
import com.encrypt.UserVerify;
import com.service.PartnerService;
import com.sun.jna.platform.linux.LibC.Sysinfo;

@Controller
public class PartnerController {
	@Autowired
	PartnerService pservice;
    @Autowired
    UserVerify userVerify;
    
    //비밀번호 확인
    @RequestMapping("/CheckPartner")
    public String passwdCheckPage(String page,String leports_id, HttpSession session,PartnerDTO pdto) {
        if(page != null) {
            session.setAttribute("page", page);
            session.setAttribute("partnerUpdate", pdto);
            session.setAttribute("leports_id", leports_id);
        }
        return "passwdCheck/passwdCheckPartner";
    }
    
    @PostMapping("/passwdCheckPartner")
    public String passwdCheck(String user_pw, HttpSession session) {
        String page = (String)session.getAttribute("page");
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String user_email = login.getUser_email();

        MemberDTO dto = userVerify.verify(user_email, user_pw);

        String next = "";
        if(dto != null) { //비번 인증 완료
            if(page.equals("partnerUpdate")) { 
                next = "redirect:/PartnerUpdate";
            } else if(page.equals("partnerDelete")) {
                next = "redirect:/PartnerDelete";
            } else if(page.equals("productDelete")){
                next = "redirect:/ProductDelete";
            }
        } else { //비번 인증 실패 시
            session.setAttribute("mesg", "비밀번호를 잘못 입력하셨습니다.");
            next = "redirect:CheckPartner";
        }
        return next;
    }

	
	//파트너 등록
	@RequestMapping("/PartnerAdd")
	public String partnerAdd(PartnerDTO dto,HttpSession session,RedirectAttributes attr) {
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String user_id=mdto.getUser_id();
		dto.setUser_id(user_id);
		int n=pservice.partnerInsert(dto);
		//승인 대기로 변경
		if(n==1) {
			pservice.partner_verifyUpdate(user_id);
		}
		attr.addFlashAttribute("mesg","승인 완료 후 안내 메일을 전송해드립니다. 다시 로그인해주세요");
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/partnerCheck/MainPartner")
	public String MainPartner(){
		return "redirect:/MainPartner";
	}
	//파트너 마이페이지
	@RequestMapping("/partnerCheck/PartnerMypage")
	public String PartnerMypage(HttpSession session,Model model) {
		MemberDTO mdto=(MemberDTO) session.getAttribute("login");
		String user_id=mdto.getUser_id();
		PartnerDTO pdto=pservice.partnerSelect(user_id);
		model.addAttribute("pdto",pdto);
		return "partnerMypage";
	}

	//마이페이지 수정
	@RequestMapping("/PartnerUpdate")
	public String PartnerUpdate(HttpSession session,RedirectAttributes attr) {
		PartnerDTO dto=(PartnerDTO)session.getAttribute("partnerUpdate");
		pservice.partnerUpdate(dto);
		System.out.println(dto);
		attr.addFlashAttribute("partnermesg", "파트너 정보가 수정되었습니다.");
		return "redirect:/MainPartner";
	}

	//파트너 탈퇴
	@RequestMapping("/PartnerDelete")
	public String PartnerDelete(HttpSession session) {
		PartnerDTO pdto=(PartnerDTO)session.getAttribute("partner");
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String partner_id=pdto.getPartner_id();
		String user_id=mdto.getUser_id();
		pservice.partnerDelete(partner_id);
		pservice.partner_verifyReset(user_id);
		return "redirect:/logout";
	}

	//파트너 키 체크
	@RequestMapping("/PartnerKeyCheck")
	public String PartnerkeyCheck(HttpSession session) {
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		int partner_key=mdto.getPartner_verify();
		String user_id=mdto.getUser_id();
		PartnerDTO pdto=pservice.partnerSelect(user_id);
		if(partner_key==2) {
			session.setAttribute("partner", pdto);
		}
		return "redirect:/";
	}
	
	//레포츠 세션 저장
	@RequestMapping("/LeportsAdd")//레포츠dto 세션저장
	public String LeportsAdd(LeportsDTO ldto,HttpSession session) {
		session.setAttribute("ldto", ldto);
		System.out.println(ldto);
		return "productRegistrationForm_item";
	}
	//레포츠 DB저장
	@RequestMapping("/LeportsAddDB") 
	public String LeportsAddDB(HttpSession session,LeportsItemDTO idto,
			String[] leports_item_title,String[] leports_summary,
			int[] leports_price, int[] leports_max_capacity){
		
		PartnerDTO pdto=(PartnerDTO)session.getAttribute("partner");
		String partner_id=pdto.getPartner_id();
		LeportsDTO ldto=(LeportsDTO)session.getAttribute("ldto");
		ldto.setPartner_id(partner_id);
		pservice.leportsInsert(ldto);		
		System.out.println(ldto);
		for(int i=0; i<leports_item_title.length; i++) {
			session.setAttribute("leports_item_title", leports_item_title);
			session.setAttribute("leports_summary", leports_summary);
			session.setAttribute("leports_price", leports_price);
			session.setAttribute("leports_max_capacity", leports_max_capacity);
		}
		return "redirect:/ItemAddTest";
	}
	//아이템 DB저장
	@RequestMapping("/ItemAddTest")
	public String ItemAddTest(HttpSession session,RedirectAttributes attr) {
		String leports_id=pservice.leportsIdSelect();
		String[] leports_item_title=(String[])session.getAttribute("leports_item_title");
		String[] leports_summary=(String[])session.getAttribute("leports_summary");
		int[] leports_price=(int[])session.getAttribute("leports_price");
		int[] leports_max_capacity=(int[])session.getAttribute("leports_max_capacity");
		for(int i=0; i<leports_item_title.length; i++) {
			LeportsItemDTO idto=new LeportsItemDTO();
			idto.setLeports_id(leports_id);
			idto.setLeports_item_title(leports_item_title[i]);
			idto.setLeports_summary(leports_summary[i]);
			idto.setLeports_price(leports_price[i]);
			idto.setLeports_max_capacity(leports_max_capacity[i]);
			pservice.leportsItemInsert(idto);
		}
		attr.addFlashAttribute("partnermesg","상품이 등록되었습니다.");
		return "redirect:/MainPartner";
	}
	
	//레포츠 등록 리스트
	@GetMapping("/partnerCheck/LeportsAddList")
	public String LeportsAddList(HttpSession session,Model model) {
		PartnerDTO dto=(PartnerDTO)session.getAttribute("partner");
		String partner_id=dto.getPartner_id();
		List<LeportsDTO> list=pservice.ProductControl(partner_id);
		model.addAttribute("leportsAddList",list);
		return "ProductControl";
	}

	//상품 상세페이지
	@GetMapping("/ProductDetail")
	public String ProductDetail(String leports_id,Model model) {
		LeportsDTO ldto=pservice.ProductDetailLeports(leports_id);
		List<LeportsItemDTO> idto=pservice.ProductDetailItem(leports_id);
		model.addAttribute("ldto",ldto);
		model.addAttribute("idto",idto);
		return "productDetailControl";
	}

	//상품 페이지 수정
	@RequestMapping("/ProductUpdate")
	public String ProductUpdate(LeportsDTO ldto,LeportsItemDTO idto,String[] leports_item_title,
			String[] leports_summary,int[] leports_price, int[] leports_max_capacity,
			String[] leports_item_id,RedirectAttributes attr) {
		pservice.ProductUpdateLeports(ldto);
		for(int i=0; i<leports_item_id.length; i++) {
			idto.setLeports_item_id(leports_item_id[i]);
			idto.setLeports_item_title(leports_item_title[i]);
			idto.setLeports_max_capacity(leports_max_capacity[i]);
			idto.setLeports_price(leports_price[i]);
			idto.setLeports_summary(leports_summary[i]);
			pservice.ProductUpdateItem(idto);
		}
		attr.addFlashAttribute("partnermesg","상품정보가 수정되었습니다.");
		return "redirect:/MainPartner";
	}
	//상품 삭제
	@RequestMapping("/ProductDelete")
	public String ProductDelete(HttpSession session,RedirectAttributes attr){
		String leports_id=(String)session.getAttribute("leports_id");
		pservice.leportsDelete(leports_id);
		attr.addFlashAttribute("partnermesg", "상품이 삭제되었습니다.");
		return "redirect:/MainPartner";
	}

	//예약관리	
	@GetMapping("/partnerCheck/ProductResevation")
	public String ProductResevation(HttpSession session,Model model) {
		PartnerDTO dto=(PartnerDTO)session.getAttribute("partner");
		String partner_id=dto.getPartner_id();
		List<LeportsDTO> list=pservice.ProductControl(partner_id);
		model.addAttribute("leportsAddList",list);
		return "reservationControl";
	}
	//예약관리 레포츠 아이템 출력
	@RequestMapping("/DetailResevation")
		public String DetailResevation(String leports_id,Model model,HttpSession session) {
		List<ReservationControlDTO> rdto=pservice.ReservationControl(leports_id);
		model.addAttribute("rdto",rdto);
		return "reservationDetail";
	}
}
