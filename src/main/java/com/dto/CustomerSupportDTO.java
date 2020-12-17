package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("CustomerSupportDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class CustomerSupportDTO {
    private String support_id;
    private String s_type;
    private String s_question;
    private String s_answer;
}
