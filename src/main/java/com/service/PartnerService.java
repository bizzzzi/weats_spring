package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PartnerDAO;
import com.dto.LeportsDTO;
import com.dto.LeportsItemDTO;
import com.dto.PartnerDTO;
import com.dto.ReservationControlDTO;

@Service
public class PartnerService {
	@Autowired
	PartnerDAO dao;
	
	
		//마이페이지
		public PartnerDTO partnerSelect(String user_id) {			 
			PartnerDTO dto=dao.partnerSelect(user_id);
			return dto;
		}
		//마이페이지 수정
		public int partnerUpdate(PartnerDTO dto) {
			int n=dao.partnerUpdate(dto);
			return n;
		}
		//파트너 탈퇴
		public int partnerDelete(String partner_id) {
			int n=dao.partnerDelete(partner_id);
			return n;
		}
		
		//파트너 탈퇴 키 변경
		public int partner_verifyReset(String user_id) {		 
			int n=dao.partner_verifyReset(user_id);
			return n;
		}
		
		//파트너 등록
		public int partnerInsert(PartnerDTO dto) {			 
			int n=dao.partnerInsert(dto);
			return n;
		}
		//파트너 등록 확인
		public void partner_verifyUpdate(String user_id) {
			int n=dao.partner_verifyUpdate(user_id);
		}

		//레포츠 등록
		public int leportsInsert(LeportsDTO dto) {
			int n=dao.leportsInsert(dto);
			return n;
		}
		//레포츠 아이템 등록
		public int leportsItemInsert(LeportsItemDTO dto) {		 
			int n=dao.leportsItemInsert(dto);
			return n;
		}
		
		//레포츠 삭제
		public int leportsDelete(String leports_id) {	 
			int n=dao.leportsDelete(leports_id);
			return n;
		}
		
		//레포츠 아이디 찾기
		public LeportsDTO leportsIdSelect(String leports_title) {			 
			LeportsDTO dto=dao.leportsIdSelect(leports_title);
			return dto;
		}

		
		//등록상품 리스트
		public List<LeportsDTO> ProductControl(String partner_id){		 
			List<LeportsDTO> list=dao.ProductControl(partner_id);
			return list;
		}
		
		//상품 상세 페이지 레포츠
		public LeportsDTO ProductDetailLeports(String leports_id) {
			LeportsDTO dto=dao.ProductDetailLeports(leports_id);
			return dto;
		}
		//상품 상세 페이지 아이템
		public LeportsItemDTO ProductDetailItem(String leports_id) { 
			LeportsItemDTO dto=dao.ProductDetailItem(leports_id);
			return dto;
		}
		//레포츠 수정
		public int ProductUpdateLeports(LeportsDTO dto) {
			int n=dao.ProductUpdateLeports(dto);
			return n;
		}
		//레포츠 아이템 수정
		public int ProductUpdateItem(LeportsItemDTO dto) {			 
			int n=dao.ProductUpdateItem(dto);
			return n;
		}
		//예약관리
		public List<ReservationControlDTO> ReservationControl(String user_id) {
			List<ReservationControlDTO> list=dao.ReservationControl(user_id);
			return list;
		}
	
}
