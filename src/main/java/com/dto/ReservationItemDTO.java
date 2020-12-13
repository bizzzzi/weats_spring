package com.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("ReservationItemDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ReservationItemDTO {
    private String rs_item_id;
    private String rs_item_title;
    private int rs_item_person;
    private int rs_item_price;
    private String reservation_id;
    private String leports_item_id;
}
