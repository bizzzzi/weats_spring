package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("MyReserveDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class MyReserveDTO {
    private String reservation_id;
    private String leports_id;
    private String leports_title;
    private String leports_main_img;
    private String rs_item_name;
    private int rs_persons;
    private String rs_date;
    private int rs_price;
    private String c_phone;
    private String c_address;
    private String c_detail_address;
}
