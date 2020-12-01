package com.service;

import com.dao.ReserveDAO;
import com.dto.ReservationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReserveService {
    @Autowired
    ReserveDAO dao;

    public int reserveAdd(ReservationDTO dto){
        return dao.reserveAdd(dto);
    }

    public List<String> reserveId(Map<String, String> reserveId_search) {
        return dao.reserveId(reserveId_search);
    }

    public void deleteReserve(String reservation_id) {
        dao.deleteReserve(reservation_id);
    }

    public List<ReservationDTO> reserveList(String user_id) {
        return dao.reserveList(user_id);
    }
}
