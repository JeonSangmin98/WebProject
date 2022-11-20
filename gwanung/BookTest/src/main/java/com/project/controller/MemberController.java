package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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