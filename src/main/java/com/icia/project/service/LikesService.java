package com.icia.project.service;

import com.icia.project.dto.BoardDTO;
import com.icia.project.dto.LikesDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.repository.BoardRepository;
import com.icia.project.repository.LikesRepository;
import com.icia.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LikesService {
    @Autowired
    private LikesRepository likesRepository;
    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private BoardRepository boardRepository;


    public int heart(LikesDTO likesDTO) {
        int result = 0;
        LikesDTO find = likesRepository.findHeart(likesDTO);
        if (find ==null) {
//           MemberDTO memberDTO = memberRepository.memberFindById(likesDTO.getId());
//            likesDTO.setUserId(memberDTO.getId());
//            BoardDTO boardDTO = boardRepository.boardFindById(likesDTO.getId());
//            likesDTO.setImageId(boardDTO.getId());
            result = likesRepository.heart(likesDTO);
        } else {
            likesRepository.deleteHeart(likesDTO);
        }
        return result;
    }
}
