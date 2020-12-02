package com.service;

import com.dao.AdminDAO;
import com.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    AdminDAO dao;

    public List<MemberDTO> MemberList(){
        List<MemberDTO> list = dao.MemberList();
        return list;
    }
}
