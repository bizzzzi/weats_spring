package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("ReservationControlDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class ReservationControlDTO {
	
	private String rs_item_title;
	private String rs_item_person;
	private String rs_item_price;
	private String leports_item_id;	
	private String reservation_id;
	private String rs_name;
	private String rs_phone;
	private String rs_date;
	
}
