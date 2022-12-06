package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.BookService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/*")
public class HomesController {
	
	@Autowired
	private BookService service;
	
	@GetMapping("/mainHome")
	public void mainHome(Model model) {
		model.addAttribute("discount", service.discountList());
		model.addAttribute("popular", service.popularList());
	}


}
