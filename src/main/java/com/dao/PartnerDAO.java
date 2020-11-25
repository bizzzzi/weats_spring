package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.LeportsDTO;
import com.dto.LeportsItemDTO;
import com.dto.PartnerDTO;
import com.dto.ReservationControlDTO;

@Repository
public class PartnerDAO {
	@Autowired
	 SqlSessionTemplate template;
	
	//마이페이지
	public PartnerDTO partnerSelect(String user_id) {
		PartnerDTO dto=template.selectOne("partnerSelect",user_id);
		return dto;
	}
	//마이페이지 수정
	public int partnerUpdate(PartnerDTO dto) {
		int n=template.update("partnerUpdate",dto);
		return n;
	}
	//파트너 탈퇴
	public int partnerDelete(String partner_id) {
		int n=template.delete("partnerDelete",partner_id);
		return n;
	}
	
	//파트너 탈퇴 키 변경
	public int partner_verifyReset(String user_id) {
		int n=template.update("partner_verifyReset",user_id);
		return n;
	}
	
	//파트너 등록
	public int partnerInsert(PartnerDTO dto) {
		int n=template.insert("partnerInsert",dto);
		return n;
	}
	
	//파트너 확인
	public int partner_verifyUpdate(String user_id) {
		return template.update("partner_verifyUpdate", user_id);
	}
	
	//레포츠 등록
	public int leportsInsert(LeportsDTO dto) {
		int n=template.insert("leportsInsert",dto);
		return n;
	}

	//레포츠 아이템
	public int leportsItemInsert(LeportsItemDTO dto) {
		int n=template.insert("leportsItemInsert",dto);
		return n;
	}
	
	//레포츠 삭제
	public int leportsDelete(String leports_id) {
		int n=template.delete("leportsDelete",leports_id);
		return n;
	}
	
	//레포츠 아이디찾기
	public LeportsDTO leportsIdSelect(String leports_title) {
		LeportsDTO dto=template.selectOne("leportsIdSelect",leports_title);
		return dto;
	}
	
	//등록상품 리스트
	public List<LeportsDTO> ProductControl(String partner_id) {
		List<LeportsDTO> list=template.selectList("ProductControl",partner_id);
		return list;
	}
	
	//상품 상세 페이지 레포츠
	public LeportsDTO ProductDetailLeports(String leports_id) {
		LeportsDTO dto=template.selectOne("ProductDetailLeports",leports_id);
		return dto;
	}
	//상품 상세 페이지 아이템
	public LeportsItemDTO ProductDetailItem(String leports_id) {
		LeportsItemDTO dto=template.selectOne("ProductDetailItem",leports_id);
		return dto;
	}
	
	//레포츠 수정
	public int ProductUpdateLeports(LeportsDTO dto) {
		int n=template.update("ProductUpdateLeports",dto);
		return n;
	}
	//레포츠 아이템 수정
	public int ProductUpdateItem(LeportsItemDTO dto) {
		int n=template.update("ProductUpdateItem",dto);
		return n;
	}
	//예약관리
	public List<ReservationControlDTO>  ReservationControl(String user_id){
		List<ReservationControlDTO> list=template.selectList("ReservationControl",user_id);
		return list;
	}

}