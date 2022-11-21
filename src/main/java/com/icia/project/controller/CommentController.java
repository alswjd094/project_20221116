package com.icia.project.controller;

import com.icia.project.dto.CommentDTO;
import com.icia.project.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

@PostMapping("/comment/save")
    public @ResponseBody List<CommentDTO> CommentSave(@ModelAttribute CommentDTO commentDTO){
    commentService.commentSave(commentDTO);
    List<CommentDTO> commentDTOList = commentService.findAllComment(commentDTO.getCommentId());
    return commentDTOList;
}
}
