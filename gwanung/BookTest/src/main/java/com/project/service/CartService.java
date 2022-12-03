package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;

public interface CartService {

	//장바구니 추가
	public int addCart(CartDTO cart, Long bno);
	
	//장바구니 리스트
	public List<CartDTO> getCartList(String memberId);
	
	//장바구니 수량 수정
	public int modifyCount(CartDTO cart);
	
	//장바구니 삭제
	public int deleteCart(Long cartBno);
	
}
