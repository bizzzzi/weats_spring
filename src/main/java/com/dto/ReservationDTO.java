package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("ReservationDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class ReservationDTO {
	
	private String reservation_id;
	private String user_id;
	private String leports_id;
	private String rs_name;
	private String rs_phone;
	private int rs_persons;
	private String rs_paymethod;
	private String rs_date;
	private String rs_payment_date;
	private int rs_price;
	private String rs_item_name;


}
