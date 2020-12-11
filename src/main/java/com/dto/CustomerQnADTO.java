package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Alias("CustomerQnADTO")
public class CustomerQnADTO {
    private String question_id;
    private String question_group;
    private String user_id;
    private String user_email;
    private String user_name;
    private String q_title;
    private String q_type;
    private String q_content;
    private String q_reservation_id;
    private String q_phone;
    private String q_regidate;
    private int answer_verify;

}
