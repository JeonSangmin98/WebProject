package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.BookDTO;
import com.spring.domain.CartDTO;
import com.spring.service.CartService;
import com.sun.java.swing.plaf.motif.resources.motif;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
	
	//장바구니 리스트
	@GetMapping("/list")
	public void cartList(Model model) {
		model.addAttribute("cartList", service.getCartList());
	}
	
	//장바구니 추가
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
 	public void addCart(CartDTO cart, HttpSession session) throws Exception{
		service.addCart(cart);
	}

	//장바구니 수량 수정
	@PostMapping("/update")
	public String updateCart(CartDTO cart) {
		service.modifyCount(cart);
		return "redirect:/cart/list"; 
	}
	
	//장바구니 삭제
	@PostMapping("/delete")
	public String deleteCart(CartDTO cart) {
		service.deleteCart(cart.getCartBno());
		return "redirect:/cart/list";
	}
	
	
	
	
}
