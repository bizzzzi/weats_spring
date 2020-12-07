package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("KakaoPayCancelDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class KakaoPayCancelDTO {
    private String aid; //요청 고유번호
    private String tid; // 결제 고유번호
    private String cid; // 가맹점 코드
    private String partner_order_id; //가맹점 주문번호, 최대 100자
    private String partner_user_id; //가맹점 회원 id, 최대 100자
    private String payment_method_type; //결제 수단, Card 또는 Money 둘 중 하나
    private Amount amount; //결제 금액 정보(Json)  Amount객체 생성
    private Amount approved_cancel_amount;
    private Amount canceled_amount;
    private String item_name; // 상품 이름, 최대 100자
    private String item_code; //상품 코드, 최대 100자
    private Integer quantity; //상품 수량
    private String payload; //결제 승인 요청에 대한 저장한 값, 요청 시 전달된 내용
    private Date created_at; //결제 준비 요청 시각
    private Date approved_at; //결제 승인 시각
    private Date canceled_at;
}
