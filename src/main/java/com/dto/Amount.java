package com.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Amount {
    private Integer total; //전체 결제 금액
    private Integer tax_free; //비과세
    private Integer vat; //부가세
    private Integer point;// 사용 포인트
    private Integer discount; //할인 금액
}
