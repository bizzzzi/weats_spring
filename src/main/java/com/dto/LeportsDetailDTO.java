package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("LeportsDetailDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class LeportsDetailDTO {
	private String leports_id;
	private String leports_title;
	private String leports_main_img;
	private String leports_sub_img1;
	private String leports_sub_img2;
	private String leports_sub_img3;
	private String leports_sub_img4;
	private String leports_regidate;
	private String leports_item_id;
	private String leports_item_title;
	private String leports_summary;
	private String leports_price;
	private String leports_max_capacity;
	private String c_address;
	private String c_detail_address;
	private String c_phone;
	private String leports_content;
	private int review_cnt;
	private int review_star;
}
