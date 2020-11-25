package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
@Alias("KakaoPayDTO")
public class KakaoPayDTO {
    private String tid;
    private String next_redirect_pc_url;
    private Date created_at;
}
