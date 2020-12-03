package com.dao;

import com.dto.MyReserveDTO;
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
}
