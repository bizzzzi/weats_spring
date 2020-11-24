package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("MemberDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class MemberDTO {
	String user_id;
	String user_name;
	String user_email;
	String user_pw;
	String salt;
	int user_verify;
	int partner_verify;
}
