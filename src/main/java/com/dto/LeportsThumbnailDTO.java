package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("LeportsThumbnailDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class LeportsThumbnailDTO {
	private String leports_id;
	private String leports_title;
	private String leports_main_img;
	private String leports_loc;
	private String leports_summary;
	private int leports_price;
	private int review_cnt;

	
	
}
