package com.icia.project.controller;

import com.icia.project.dto.LikesDTO;
import com.icia.project.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LikesController {
    @Autowired
    private LikesService likesService;

    @GetMapping("/likes/heart")
    public @ResponseBody int heart(@ModelAttribute LikesDTO likesDTO){
        int result = likesService.heart(likesDTO);
        return result;
    }
}
