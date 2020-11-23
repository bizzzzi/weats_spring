package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	//회원가입
	public int userJoin(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.userJoin(dto);
	}
	
	//이메일 인증 검증
	public int user_verifyUpdate(String user_email) {
		// TODO Auto-generated method stub
		return dao.user_verifyUpdate(user_email);
	}
	
	//회원의 salt키 추출
	public String getSaltMember(String user_email) {
		// TODO Auto-generated method stub
		String salt = null;
		return salt;
	}
	
	//로그인 
	public MemberDTO memberLogin(Map<String, String> map) {
		// TODO Auto-generated method stub
		MemberDTO dto = null; 
		return dto;
	}

	public void pwUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		int n;
	}
	
	public void memberDelete(String user_email) {
		// TODO Auto-generated method stub
		
	}

	public int emailCheck(String user_email) {
		int n = dao.emailCheck(user_email);
		return n;
	}
}
