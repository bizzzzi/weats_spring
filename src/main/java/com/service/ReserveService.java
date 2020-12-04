package com.service;

import com.dao.ReserveDAO;
import com.dto.MyReserveDTO;
import com.dto.ReservationDTO;
import com.dto.ReservationReviewDTO;
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

    public void deleteReserve(Map<String, String> map) {
        dao.deleteReserve(map);
    }

    public List<MyReserveDTO> reserveList(String user_id) {
        return dao.reserveList(user_id);
    }

    public String tidSearch(Map<String, String> map) {
        return dao.tidSearch(map);
    }

    public int reviewWrite(ReservationReviewDTO reservationReviewDTO) {

        return dao.reviewWrite(reservationReviewDTO);
    }
}
