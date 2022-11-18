package com.icia.project.controller;

import com.icia.project.dto.MemberDTO;
import com.icia.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
@Autowired
private MemberService memberService;

    @GetMapping("/member/save")
    public String saveForm(){
        return "/member/save";
    }
    @PostMapping ("/member/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        boolean saveResult = memberService.save(memberDTO);
        return "member/login";
    }

    @PostMapping("/member/duplicate-check-email")
    public @ResponseBody String emailDuplicateCheck(@RequestParam("memberEmail") String memberEmail){
        System.out.println("memberEmail = " + memberEmail);
        String emailDuplicateResult = memberService.emailDuplicateCheck(memberEmail);
        return emailDuplicateResult;
    }

    @PostMapping("/member/duplicate-check-userName")
    public @ResponseBody String userNameDuplicateCheck(@RequestParam("memberUserName") String memberUserName){
        System.out.println("memberUserName = " + memberUserName);
        String userNameDuplicateResult = memberService.userNameDuplicateCheck(memberUserName);
        return userNameDuplicateResult;
    }

    @GetMapping("/member/login")
    public String loginForm(){
        return "member/login";
    }

    @PostMapping("/member/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        boolean loginResult = memberService.login(memberDTO);
        if(loginResult){
            session.setAttribute("loginEmail",memberDTO.getMemberEmail());
            System.out.println("loginResult = " + loginResult);
            model.addAttribute("modelUserName",memberDTO.getMemberUserName());
            return"redirect:/board/list";
        }else{
            return"member/login";
        }
    }
    @GetMapping("/member/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return"index";
    }
}
