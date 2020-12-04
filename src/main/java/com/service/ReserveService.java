package com.service;

import com.dao.ReserveDAO;
import com.dto.LeportsReviewDTO;
import com.dto.MyReserveDTO;
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

    public void deleteReserve(Map<String, String> map) {
        dao.deleteReserve(map);
    }

    public List<MyReserveDTO> reserveList(String user_id) {
        return dao.reserveList(user_id);
    }

    public String tidSearch(Map<String, String> map) {
        return dao.tidSearch(map);
    }

    public int reviewWrite(LeportsReviewDTO LeportsReviewDTO) {

        return dao.reviewWrite(LeportsReviewDTO);
    }

    public List<LeportsReviewDTO> reviewList(String user_id) {
        return dao.reviewList(user_id);
    }

    public void reviewVerify(Map<String, String> map) {
        dao.reviewVerify(map);
    }
}
