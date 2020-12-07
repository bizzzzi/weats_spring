package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("LeportsReviewDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class LeportsReviewDTO {
	private String review_id;
	private String leports_id;
	private String reservation_id;
	private String user_id;
	private String review_comments;
	private String review_regidate;
	private String leports_title;
	private String leports_main_img;
	private String user_email;
	private int review_star;
}
