package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("ReservationReviewDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class ReservationReviewDTO {
    private String review_id;
    private String leports_id;
    private String reservation_id;
    private String user_id;
    private String user_name;
    private String review_comments;
    private String review_regidate;
}
