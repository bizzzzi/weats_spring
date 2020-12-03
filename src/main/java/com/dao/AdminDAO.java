package com.dao;


import com.dto.MemberDTO;
import com.dto.PartnerDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
@Repository
public class AdminDAO {

    @Autowired
    SqlSessionTemplate template;

    public List<MemberDTO> MemberList(){
        List<MemberDTO> list = template.selectList("MemberList");
        return list;
    }
    public List<PartnerDTO> PartnerList(){
        List<PartnerDTO> list = template.selectList("PartnerList");
        return list;
    }

    public PartnerDTO PartnerDetail(String partner_id){
        PartnerDTO dto= template.selectOne("PartnerDetail",partner_id);
        return dto;
    }

    public String PartnerEmail(String user_id){
        String user_email = template.selectOne("PartnerEmail",user_id);
        return user_email;
    }

    public int PartnerUpdate(String user_id){
        int result = template.update("PartnerUpdate",user_id);
        return result;
    }

}
