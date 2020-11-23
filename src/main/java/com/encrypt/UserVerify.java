package com.encrypt;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dto.MemberDTO;
import com.service.MemberService;

@Component
public class UserVerify {
	
	@Autowired
	MemberService service;
	
	public MemberDTO verify(String user_email, String user_pw) {
		System.out.println(user_email);
		String salt = service.getSaltMember(user_email); //이메일로 salt 값 select
		System.out.println(salt);
		user_pw = SHA256.getEncrypt(user_pw, salt);  //입력한 비번 + salt 암호화
		System.out.println(user_pw);
		//map에 담아서 일치하는 계정이 있는지 검사
		Map<String ,String> map = new HashMap<String, String>();
		map.put("user_email", user_email);
		map.put("user_pw", user_pw);
		
		MemberDTO dto = service.memberLogin(map);
		MemberDTO xxx = null;
		if(dto != null) {
			xxx = dto;
		}
		return xxx;
	}

}
