package com.icia.project.controller;

import com.icia.project.dto.BoardDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.BoardService;
import com.icia.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class MemberController {
@Autowired
private MemberService memberService;

@Autowired
private BoardService boardService;

    @GetMapping("/member/save")
    public String saveForm(){
        return "/member/save";
    }
    @PostMapping ("/member/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        memberService.save(memberDTO);
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
            session.setAttribute("loginUserName",memberDTO.getMemberUserName());
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

    @GetMapping("/member/myPage")
    public String myPageForm(Model model,HttpSession session){
        String memberUserName = (String) session.getAttribute("loginUserName");
        MemberDTO myPageForm = memberService.myPageForm(memberUserName);
        model.addAttribute("findByEmail",myPageForm);

        //마이페이지에 게시글 가져오기
//        BoardDTO board = new BoardDTO();
//        board.getBoardImage();
//        board.getId();
//        board.getBoardWriter();
//        model.addAttribute("post",board);
        return"member/myPage";
    }

//    프로필 수정화면 요청
    @GetMapping("/member/profileUpdate")
    public String profileUpdateForm(Model model,HttpSession session){
        String memberUserName = (String) session.getAttribute("loginUserName");
        MemberDTO myPageForm = memberService.myPageForm(memberUserName);
        model.addAttribute("findByEmail",myPageForm);
        return "member/profileUpdate";
    }

//    프로필 수정
    @PostMapping("/member/profileUpdate")
    public String profileUpdate(@ModelAttribute MemberDTO memberDTO) throws IOException{
        memberService.profileUpdate(memberDTO);
        return "redirect:/member/myPage?id="+memberDTO.getId();
    }

    @PostMapping("/member/myPage")
    public String memberFindById(@RequestParam("id") Long id, Model model){
        MemberDTO member = memberService.memberFindById(id);
        model.addAttribute("member",member);
        return "layout/footer";
    }
}
