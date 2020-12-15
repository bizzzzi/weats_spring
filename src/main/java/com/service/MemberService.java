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
	public void user_verifyUpdate(String user_email) {
		// TODO Auto-generated method stub
		dao.user_verifyUpdate(user_email);
	}
	
	//회원의 salt키 추출
	public String getSaltMember(String user_email) {
		// TODO Auto-generated method stub
		return dao.getSaltMember(user_email);
	}
	
	//로그인 
	public MemberDTO memberLogin(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.memberLogin(map);
	}

	public void pwUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		dao.pwUpdate(map);
	}
	
	public void memberDelete(String user_email) {
		// TODO Auto-generated method stub
		dao.memberDelete(user_email);
	}

	public int emailCheck(String user_email) {
		int n = dao.emailCheck(user_email);
		return n;
	}


}
