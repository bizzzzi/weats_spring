package com.service;

import com.dao.AdminDAO;
import com.dto.MemberDTO;
import com.dto.PartnerDTO;
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
    public List<PartnerDTO> PartnerList(){
        List<PartnerDTO> list = dao.PartnerList();
        return list;
    }
}
