package com.dao;

import com.dto.ReservationDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAO {
    @Autowired
    SqlSessionTemplate template;

    public int reserveAdd(ReservationDTO dto) {
        System.out.println("DAO : "+dto);
        return template.insert("reserveAdd", dto);
    }
}
