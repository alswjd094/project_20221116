package com.icia.project.controller;

import com.icia.project.dto.BoardDTO;
import com.icia.project.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/board/writing")
    public String writingForm(){
        return "/board/writing";
    }

    @PostMapping("/board/writing")
    public String writing(@ModelAttribute BoardDTO boardDTO){
        boolean writingResult = boardService.writing(boardDTO);
        return "/board/main";
    }
}
