package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("LeportsDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class LeportsDTO {
	private String leports_id;
	private String partner_id;
	private String leports_title;
	private String leports_type;
	private String leports_loc;
	private String leports_regidate;
	private String leports_main_img;
	private String leports_sub_img1;
	private String leports_sub_img2;
	private String leports_sub_img3;
	private String leports_sub_img4;
	private String leports_content;
	private int review_cnt;
	
}
