package com.service;

import com.dao.ReserveDAO;
import com.dto.ReservationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveService {
    @Autowired
    ReserveDAO dao;

    public int reserveAdd(ReservationDTO dto){
        System.out.println("Service" + dto);
        return dao.reserveAdd(dto);
    }
}
