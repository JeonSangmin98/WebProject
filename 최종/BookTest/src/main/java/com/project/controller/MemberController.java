package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder pwEncoder; // 비밀번호 인코딩

	//회원가입 페이지
	@GetMapping("join")
	public void joinGet() {
	}

	//회원가입
	@PostMapping("/join")
	public String joinPost(MemberDTO member) {

		String beforePw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		beforePw = member.getMemberPw(); // 원래 비밀번호
		encodePw = pwEncoder.encode(beforePw); // 비밀번호 인코딩
		member.setMemberPw(encodePw); // 인코딩 된 비밀번호 넣어줌

		service.memberJoin(member);
		return "redirect:/mainHome";
	}

	//로그인 페이지
	@GetMapping("/login")
	public void loginGet() {
	}

	//인코딩 후 로그인
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, MemberDTO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession(); // 세션 사용
		String beforePw = ""; // 사용자 입력 비밀번호
		String encodePw = ""; // 인코딩 비밀번호

		MemberDTO loginDTO = service.memberLogin(member);

		if (loginDTO != null) { // 아이디 일치 시

			// log.info("아이디 일치");
			beforePw = member.getMemberPw();
			encodePw = loginDTO.getMemberPw();

			if (pwEncoder.matches(beforePw, encodePw) == true) { // 비밀번호 인코딩 일치여부 확인
				log.info("beforePw: " + beforePw);
				log.info("encodePw: " + encodePw);
				loginDTO.setMemberPw(""); // 인코딩 비밀번호 정보 삭제
				session.setAttribute("member", loginDTO); // session에 사용자정보 저장
				return "redirect:/mainHome"; // 로그인 성공 시 main 화면으로 이동

			} else { // 비밀번호 불일치 시
				// log.info("비밀번호 불일치");
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; // 비밀번호 인코딩 불일치 시 다시 로그인 페이지로 이동
			}

		} else { // 아이디 불일치 시
			// log.info("아이디 불일치");
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login"; // 아이디 불일치 시 다시 로그인 페이지로 이동
		}
	}

	//비동기 로그아웃 ajax ResponseBody 사용
	@PostMapping("/logout")
	@ResponseBody
	public String logoutGet(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); // 세션 사용
		session.invalidate(); // 세션 무효화 removeAttribute()는 특정 session 객체 삭제 (총 2가지 방법 가능)
		return "redirect:/mainHome";
	}

	//중복 아이디 검사
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheckPost(String memberId) {

		int result = service.idCheck(memberId);
		log.info(result);

		if (result != 0)
			return "fail";
		else
			return "success";
	}

	//회원정보 페이지
	@GetMapping("/info")
	public String infoGet(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션 생성
		MemberDTO memberDto = (MemberDTO) session.getAttribute("member"); //세션 객체의 id값 저장
		
		if(memberDto == null) {
			return "redirect:/mainHome";
		}
		
		String memberId = memberDto.getMemberId();
		log.info(memberId);
		model.addAttribute("info", service.memberInfo(memberId)); // 해당 id memberDTO 객체 값 info로 View에서 사용
		return "/member/info";
	}

	//회원정보 수정
	@PostMapping("/modify")
	public String modifyPost(MemberDTO member, HttpServletRequest request) {
		
		String beforePw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		beforePw = member.getMemberPw(); // 원래 비밀번호
		encodePw = pwEncoder.encode(beforePw); // 비밀번호 인코딩
		member.setMemberPw(encodePw); // 인코딩 된 비밀번호 넣어줌
		
		service.memberModify(member);
		HttpSession session = request.getSession(); // 세션 사용
		session.invalidate(); 
		return "redirect:/mainHome";
	}
	
	//회원정보 삭제
	@PostMapping("/delete")
	public String deletePost(HttpServletRequest request, String memberId) {
		
		service.memberDelete(memberId);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/mainHome";
	}
	
	
}
