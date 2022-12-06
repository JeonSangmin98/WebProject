package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.BookDTO;
import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.service.CartService;
import com.sun.java.swing.plaf.motif.resources.motif;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
	
	//장바구니 리스트
	@GetMapping("/list/{memberId}")
	public String cartListGet(@PathVariable("memberId") String memberId, Model model) {
		model.addAttribute("cartList", service.getCartList(memberId));
		
		return "/cart/list";
	}
	
	//장바구니 추가
	@PostMapping("/addCart")
	@ResponseBody
 	public String addCartPost(CartDTO cart, HttpServletRequest request, @RequestParam("bno") Long bno){
		HttpSession session = request.getSession(); //세션 생성
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		if(dto == null) {
			return "5";
		}
		int result = service.addCart(cart, bno);
		
		return result + "";
		
	}

	//장바구니 수량 수정
	@PostMapping("/update")
	public String updateCartPost(CartDTO cart) {
		service.modifyCount(cart);
		return "redirect:/cart/list/" + cart.getMemberId(); 
	}
	
	//장바구니 삭제
	@PostMapping("/delete")
	public String deleteCartPost(CartDTO cart) {
		service.deleteCart(cart.getCartBno());
		return "redirect:/cart/list/" + cart.getMemberId();
	}
	
}
