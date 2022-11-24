package com.icia.project.repository;

import com.icia.project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
        return memberDTO;
    }

    public String emailDuplicateCheck(String memberEmail) {
        return sql.selectOne("Member.emailDuplicateCheck",memberEmail);
    }

    public String userNameDuplicateCheck(String memberUserName) {
        return sql.selectOne("Member.userNameDuplicateCheck",memberUserName);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO myPageForm(String memberUserName) {
        return sql.selectOne("Member.myPageForm",memberUserName);
    }

    public void saveFileName(MemberDTO memberDTO) {
        sql.insert("Member.saveFileName",memberDTO);
    }

    public MemberDTO memberFindById(Long id) {
        MemberDTO memberDTO = sql.selectOne("Member.memberFindById",id);
        if(memberDTO.getFileAttached_member()==1){
            return sql.selectOne("Member.memberFindByFile",id);
        }else{
            return memberDTO;
        }
    }

    public MemberDTO profileUpdate(MemberDTO memberDTO) {
        sql.update("Member.profileUpdate",memberDTO);
        return memberDTO;
    }
}
