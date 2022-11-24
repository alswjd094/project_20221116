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
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    @Autowired
    private MemberRepository memberRepository;

    public void writing(BoardDTO boardDTO) throws IOException {
//    int writingResult = boardRepository.writing(boardDTO);
//    if(writingResult>0){
//        return true;
//    }else{
//        return false;
//    }
        if (!boardDTO.getBoardFile().isEmpty()) {
            MultipartFile boardFile = boardDTO.getBoardFile();
            String originalFileName_board = boardFile.getOriginalFilename();
            System.out.println("originalFileName_board = " + originalFileName_board);
            String storedFileName_board = System.currentTimeMillis() + "-" + originalFileName_board;
            System.out.println("storedFileName_board = " + storedFileName_board);
            boardDTO.setOriginalFileName_board(originalFileName_board);
            boardDTO.setStoredFileName_board(storedFileName_board);
            String savePath = "C:\\spring_img\\" + storedFileName_board;
            boardFile.transferTo(new File(savePath));
            boardDTO.setFileAttached_board(1);
//            boardImage에 값 넣기
            boardDTO.setBoardImage(boardDTO.getStoredFileName_board());
//            boardId에 값 넣기
            MemberDTO dto = memberRepository.myPageForm(boardDTO.getBoardWriter());
            boardDTO.setBoardId(dto.getId());

            BoardDTO saveBoard = boardRepository.writing(boardDTO);
            boardRepository.saveFileName(saveBoard);
        } else {
            boardDTO.setFileAttached_board(0);
            boardRepository.writing(boardDTO);
        }
    }


    public List<BoardDTO> list() {
        return boardRepository.list();
    }

    public BoardDTO boardFindById(Long id) {
        return boardRepository.boardFindById(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public List<BoardDTO> search(String type, String q) {
        Map<String, String> searchParams = new HashMap<>();
        searchParams.put("type",type);
        searchParams.put("q",q);
        List<BoardDTO> searchList = boardRepository.search(searchParams);
        return searchList;

    }
}
