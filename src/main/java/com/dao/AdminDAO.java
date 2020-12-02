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

}
