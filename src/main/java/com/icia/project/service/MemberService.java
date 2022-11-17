package com.icia.project.service;

import com.icia.project.dto.MemberDTO;
import com.icia.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if(saveResult>0){
            return true;
        }else {
            return false;
        }
    }

    public String emailDuplicateCheck(String memberEmail) {
        String emailDuplicateResult = memberRepository.emailDuplicateCheck(memberEmail);
        if(emailDuplicateResult==null){
            return "ok";
        } else {
            return "no";
        }
    }

    public String userNameDuplicateCheck(String memberUserName) {
        String userNameDuplicateResult = memberRepository.userNameDuplicateCheck(memberUserName);
        if(userNameDuplicateResult==null){
            return "ok";
        }else {
            return "no";
        }


    }
}
