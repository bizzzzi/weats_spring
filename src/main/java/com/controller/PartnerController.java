package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.LeportsDTO;
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
    
    @RequestMapping("/loginCheck/CheckPartner")
    public String passwdCheckPage(String page,String leports_id, HttpSession session,PartnerDTO pdto) {
        if(page != null) {
            session.setAttribute("page", page);
            session.setAttribute("partnerUpdate", pdto);
            session.setAttribute("leports_id", leports_id);
        }
        return "passwdCheck/passwdCheckPartner";
    }
    
    @PostMapping("/loginCheck/passwdCheckPartner")
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
            next = "redirect:passwdCheck";
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
		attr.addFlashAttribute("mesg","승인 완료 후 안내 메일을 전송해드립니다.");
		return "redirect:/";
	}
	@RequestMapping(value="/partnerCheck/MainPartner")
	public String MainPartner(){
		return "redirect:/MainPartner";
	}
	//파트너 마이페이지
	@RequestMapping("/partnerCheck/PartnerMypage")
	public String PartnerMypage(HttpSession session,RedirectAttributes attr) {
		MemberDTO mdto=(MemberDTO) session.getAttribute("login");
		String user_id=mdto.getUser_id();
		PartnerDTO pdto=pservice.partnerSelect(user_id);
		//session.setAttribute("partner", pdto);
		attr.addFlashAttribute("pdto",pdto);
		return "redirect:/partnerMypage";
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

	//레포츠 등록
	@RequestMapping("/LeportsAdd")
	public String ProductAdd(@ModelAttribute("LeportsForm")LeportsDTO dto,HttpSession session,RedirectAttributes attr) {
		PartnerDTO pdto=(PartnerDTO) session.getAttribute("partner");
		String partner_id=pdto.getPartner_id();
		dto.setPartner_id(partner_id);
		pservice.leportsInsert(dto);
		session.setAttribute("leports",dto);
		attr.addFlashAttribute("LeportsForm",dto);
		return "redirect:/LeportsIdSelect";
	}
	//레포츠 이름 중복검사
	@RequestMapping(value = "/titleDuplicateCheck",produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String titleDuplicateCheck(@RequestParam("title")String leports_title) {
		LeportsDTO ldto=pservice.leportsIdSelect(leports_title);
		String mesg="";
		if(ldto!=null) {
			mesg="중복된 상품명입니다.";
		}
		return mesg;
	}

	//레포츠 아이디찾기
	@RequestMapping("/LeportsIdSelect")
	public String LeportsIdSelect(@ModelAttribute("LeportsForm")LeportsDTO dto,RedirectAttributes attr) {
		String leports_title=dto.getLeports_title();
		LeportsDTO ldto=pservice.leportsIdSelect(leports_title);
		attr.addFlashAttribute("dto", ldto);
		return "redirect:/productRegistrationForm_item";
	}

	//레포츠 아이템 등록
	@RequestMapping("/ItemAdd")
	public String ItemAdd(LeportsItemDTO dto,String[] leports_item_title, String[] leports_summary,
			int[] leports_price, int[] leports_max_capacity,String leports_id,RedirectAttributes attr) {
		
		for(int i=0; i<leports_item_title.length; i++) {
			dto.setLeports_item_title(leports_item_title[i]);
			dto.setLeports_summary(leports_summary[i]);
			dto.setLeports_price(leports_price[i]);
			dto.setLeports_max_capacity(leports_max_capacity[i]);
			pservice.leportsItemInsert(dto);
		}
		attr.addFlashAttribute("partnermesg", "상품이 등록되었습니다.");
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
			int n=pservice.ProductUpdateItem(idto);
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
	@RequestMapping("/partnerCheck/ProductResevation")
	public String ProductResevation(HttpSession session,Model model) {
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String user_id=mdto.getUser_id();
		List<ReservationControlDTO>list=pservice.ReservationControl(user_id);
		model.addAttribute("leportsList", list);
		return "reservationControl";
	}
}
