package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.annotation.Annotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderItemDTO;
import com.project.domain.OrderPageDTO;
import com.project.domain.OrderPageItemDTO;
import com.project.service.MemberService;
//import com.project.service.OrderService;
import com.project.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/list/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		
		return "/order/list";
	}
	
	@PostMapping("/list")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		System.out.println(od);
		
		orderService.order(od);
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(od.getMemberId());
		
		HttpSession session = request.getSession();
		
		try {
			MemberDTO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mainHome";
	}
	
}
