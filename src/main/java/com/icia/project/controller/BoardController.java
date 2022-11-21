package com.icia.project.controller;

import com.icia.project.dto.BoardDTO;
import com.icia.project.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/board/writing")
    public String writingForm(){
        return "board/writing";
    }

    @PostMapping("/board/writing")
    public String writing(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.writing(boardDTO);
        return "redirect:/board/list";
    }
    @GetMapping("/board/list")
    public String list(Model model){
        List<BoardDTO> boardList = boardService.list();
        System.out.println("boardList = " + boardList);
        model.addAttribute("boardList",boardList);
        return"board/main";
    }
    @GetMapping("/board/detail")
    public String boardFindById(@RequestParam("id")Long id, Model model){
        BoardDTO boardDTO = boardService.boardFindById(id);
        System.out.println("boardDTO = " + boardDTO);
        model.addAttribute("board",boardDTO);
        return"board/detail";
    }

    @GetMapping("/board/delete")
    public String delete(@RequestParam("id") Long id){
        boardService.delete(id);
        return "redirect:/board/list";
    }

    @GetMapping("/board/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        BoardDTO  updateBoard = boardService.boardFindById(id);
        model.addAttribute("board",updateBoard);
        return "board/update";
    }
    @PostMapping("/board/update")
    public String update(@ModelAttribute BoardDTO boardDTO,Model model){
        boardService.update(boardDTO);
        BoardDTO dto = boardService.boardFindById(boardDTO.getId());
        model.addAttribute("board",dto);
        return "board/detail";
    }
}
