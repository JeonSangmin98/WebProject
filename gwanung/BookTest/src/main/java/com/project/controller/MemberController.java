package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인 페이지
	@GetMapping("/login")
	public void loginGet() {
	}
	
	//로그인
	@PostMapping("/login")
	//HttpServletRequest: 로그인 시 회원정보 session 에 저장, RedirectAttributes 로그인 실패 시 로그인 페이지에 실패 데이터 전송
	public String loginPost(HttpServletRequest request, MemberDTO member, RedirectAttributes rttr)throws Exception {
		
		log.info("전달된 데이터: " + member);
		return null;
	}
	
	
	//회원가입 페이지
	@GetMapping("join")
	public void joinGet() {
	}
	
	//회원가입
	@PostMapping("/join")
	public String joinPost(MemberDTO member){
		service.memberJoin(member);
		return "redirect:/mainHome";
	}
	
	//중복 아이디 검사
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheckPost(String memberId) {
		
		int result = service.idCheck(memberId);
		log.info(result);
		
		if(result != 0)
			return "fail";
		else
			return "success";
	}
}
