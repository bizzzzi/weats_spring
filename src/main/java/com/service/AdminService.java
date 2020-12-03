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

    public PartnerDTO PartnerDetail(String partner_id){
        PartnerDTO dto = dao.PartnerDetail(partner_id);
        return dto;
    }

    public String PartnerEmail(String user_id){
        String user_email = dao.PartnerEmail(user_id);
        return user_email;
    }

    public int PartnerUpdate(String user_id){
       int result = dao.PartnerUpdate(user_id);
       return result;
    }
}
