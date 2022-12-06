package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.BookService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/book")
@Log4j
public class BookController {
	
	@Autowired
	private BookService service;
	
	//책 검색
	@GetMapping("/searchList")
	public void searchListGet(@RequestParam(value = "type") String type, @RequestParam(value = "keyword") String keyword, Model model) {
		List<BookDTO> bookDto = service.searchList(type, keyword);
		model.addAttribute("search", bookDto);
	}
	
	//도서 리스트
	@GetMapping("/list")
	public void bookList(Criteria cri, Model model) {
		model.addAttribute("bookList", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//도서 상세정보
	@GetMapping("/get")
	public void bookGet(@RequestParam("bno") Long bno, Criteria cri, Model model) {
		model.addAttribute("info", service.get(bno));
	}
	
	//도서 카테고리
	@GetMapping("/category")
	public void categoryListGet(Model model, String category) {
		model.addAttribute("category", service.categoryList(category));
	}
	
	
}
