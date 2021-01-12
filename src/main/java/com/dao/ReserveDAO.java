package com.dao;

import com.dto.LeportsReviewDTO;
import com.dto.MyReserveDTO;
import com.dto.ReservationDTO;
import com.dto.ReservationItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReserveDAO {
    @Autowired
    SqlSessionTemplate template;

    public int reserveAdd(ReservationDTO dto) {
        return template.insert("reserveAdd", dto);
    }

    public List<String> reserveId(Map<String, String> reserveId_search) {
        return template.selectList("reserveId", reserveId_search);
    }

    public void deleteReserve(Map<String, String> map) {
        template.delete("deleteReserve", map);
    }

    public List<MyReserveDTO> reserveList(String user_id) {
        return template.selectList("reserveList", user_id);
    }

    public void reserveTidAdd(Map<String, String> tidMap) {
        template.update("reserveTidAdd", tidMap);
    }

    public String tidSearch(Map<String, String> map) {
        return template.selectOne("tidSearch", map);
    }

    public int reviewWrite(LeportsReviewDTO LeportsReviewDTO) {
        return template.insert("reviewWrite", LeportsReviewDTO);
    }

    public List<LeportsReviewDTO> reviewList(String user_id) {
        return template.selectList("reviewList", user_id);
    }

    public void reviewVerify(Map<String, String> map) {
        template.update("reviewVerify", map);
    }

    public void reviewDelete(Map<String, String> map) {
        System.out.println(map);
        template.delete("reviewDelete", map);
    }

    public void reserveItemAdd(ArrayList<ReservationItemDTO> itemDTOList) {
        System.out.println(itemDTOList);
        template.insert("reserveItemAdd", itemDTOList);
    }

    public List<HashMap<String,?>> reservePerson(Map<String, String> map) {
        return template.selectList("reservePerson", map);
    }

    public List<ReservationItemDTO> reserveDetailList(String reservation_id) {
        return template.selectList("reserveDetailList",reservation_id);
    }
}
