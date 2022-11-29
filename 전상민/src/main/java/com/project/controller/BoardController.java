package com.project.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.domain.MemberDTO;
import com.project.domain.PageDTO;
import com.project.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService service;

//	목록 처리
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list ----------");
		log.info("cri: " + cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, 123)); // 임의의 값 123
		int total = service.getTotal(cri);
		log.info("total : " + total); 
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}

//	입력 페이지를 보여주는 역할만 함
	@GetMapping("/register")
	public void register() {

	}

//	등록 처리
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("register : " + board);
		HttpSession session = request.getSession();
		MemberDTO writer = (MemberDTO) session.getAttribute("member");
		String memberId = writer.getMemberId();
		board.setWriter(memberId);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoardNo());

		return "redirect:/board/list";
	}

//	조회 처리
	@GetMapping({"/get","/modify"})
	public void get(Long boardNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("get or modify");
		model.addAttribute("board", service.get(boardNo));
	}

//	수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if (service.modify(board) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list" + cri.getListLink();
	}

//	삭제 처리
	@PostMapping("/remove")
	public String remove(Long boardNo, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + boardNo);
		if (service.remove(boardNo) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list" + cri.getListLink();
	}
}