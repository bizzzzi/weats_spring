package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.jetbrains.annotations.NotNull;

@Alias("LeportsThumbnailDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class LeportsThumbnailDTO implements Comparable<LeportsThumbnailDTO> {
    private String leports_id;
    private String leports_title;
    private String leports_main_img;
    private String leports_loc;
    private String leports_summary;
    private int leports_price;
    private int review_cnt;
    private int review_star;
    private int reserve_cnt;
    private String leports_regidate;

    // 기본 정렬 : 최신 날짜순
    @Override
    public int compareTo(@NotNull LeportsThumbnailDTO o) {
        return this.leports_regidate.compareTo(o.leports_regidate);
    }
}
