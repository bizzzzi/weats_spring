package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public int userJoin(MemberDTO dto) {
		// TODO Auto-generated method stub
		return template.insert("userJoin", dto);
	}
	
	public void user_verifyUpdate(String user_email) {
		// TODO Auto-generated method stub
		template.update("user_verifyUpdate", user_email);
	}

	public String getSaltMember(String user_email) {
		// TODO Auto-generated method stub
		
		return template.selectOne("searchSalt", user_email);
	}

	public MemberDTO memberLogin(Map<String, String> map) {
		// TODO Auto-generated method stub
		MemberDTO dto = template.selectOne("memberLogin", map);
		return dto;
	}

	public int pwUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return template.update("pwUpdate", map);
	}

	public int memberDelete(String user_email) {
		// TODO Auto-generated method stub
		return template.delete("memberDelete", user_email);
	}

	public int emailCheck(String user_email) {
		int n = template.selectOne("emailCheck", user_email);
		return n;
	}

}
