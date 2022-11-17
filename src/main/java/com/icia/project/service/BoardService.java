package com.icia.project.service;

import com.icia.project.dto.BoardDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.repository.BoardRepository;
import com.icia.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    @Autowired
    private MemberRepository memberRepository;

    public boolean writing(BoardDTO boardDTO) {
    int writingResult = boardRepository.writing(boardDTO);
    if(writingResult>0){
        return true;
    }else{
        return false;
    }
    }

}
