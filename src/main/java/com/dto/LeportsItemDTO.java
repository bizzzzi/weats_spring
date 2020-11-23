package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("LeportsItemDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class LeportsItemDTO {
	private String leports_id;
	private String leports_item_title;
	private String leports_summary;
	private String leports_price;
	private String leports_max_capacity;
	
	
}
