package com.dao;

import com.dto.ReservationDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

    public void deleteReserve(String reservation_id) {
        template.delete("deleteReserve", reservation_id);
    }

    public List<ReservationDTO> reserveList(String user_id) {
        return template.selectList("reserveList", user_id);
    }
}
