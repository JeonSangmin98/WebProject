package com.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.BookService;


@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService service;
	
	
	//책 검색
	@GetMapping("/searchList")
	public void list(@RequestParam(value = "type") String type, @RequestParam(value = "keyword") String keyword, Model model) {
		BookDTO bookDto = service.searchList(type, keyword);
		model.addAttribute("t", bookDto);
	}
	
	//도서 리스트
	@GetMapping("/list")
	public void test(Criteria cri, Model model) {
		model.addAttribute("bookList", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	
	}
	
	//도서 상세정보
	@GetMapping("/get")
	public void test2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("info", service.get(bno));
	}

}
