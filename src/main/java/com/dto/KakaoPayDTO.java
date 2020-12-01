package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
@Alias("KakaoPayDTO")
//카카오 페이에 정보를 보내고 요청이 성공적으로 이루어지면 오는 응답 정브롤 받을 객체
public class KakaoPayDTO {
    private String tid; //결제 고유번호
    private String next_redirect_pc_url;//요청한 클라이언트가 PC 웹일 경우 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면 Redirect URL
    private Date created_at; //결제 준비 요청 시간
}
