package com.icia.project.service;

import com.icia.project.dto.BoardDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.repository.BoardRepository;
import com.icia.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
//        int saveResult = memberRepository.save(memberDTO);
//        if(saveResult>0){
//            return true;
//        }else {
//            return false;
//        }
        memberRepository.save(memberDTO);
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

    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginResult = memberRepository.login(memberDTO);
        if(loginResult != null){
            return true;
        }else{
            return false;
        }
    }

    public MemberDTO myPageForm(String memberUserName) {
        return memberRepository.myPageForm(memberUserName);
    }

    public void profileUpdate(MemberDTO memberDTO) throws IOException {
        if(!memberDTO.getMemberFile().isEmpty()){
            MultipartFile memberFile = memberDTO.getMemberFile();
            String originalFileName_profile = memberFile.getOriginalFilename();
            System.out.println("originalFileName_profile = " + originalFileName_profile);
            String storedFileName_profile = System.currentTimeMillis()+"-"+originalFileName_profile;
            System.out.println("storedFileName_profile = " + storedFileName_profile);
            memberDTO.setOriginalFileName_profile(originalFileName_profile);
            memberDTO.setStoredFileName_profile(storedFileName_profile);
            String savePath = "C:\\spring_img_profile\\" + storedFileName_profile;
            memberFile.transferTo(new File(savePath));
            memberDTO.setFileAttached_member(1);

            memberDTO.setMemberProfile(memberDTO.getStoredFileName_profile());

            MemberDTO saveMember = memberRepository.profileUpdate(memberDTO);
            memberRepository.saveFileName(saveMember);
        } else{
            memberDTO.setFileAttached_member(0);
            memberRepository.profileUpdate(memberDTO);
        }
    }

    public MemberDTO memberFindById(Long id) {
        return memberRepository.memberFindById(id);
    }
}
