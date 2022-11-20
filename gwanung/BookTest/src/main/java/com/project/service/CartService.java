package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;

public interface CartService {

	//장바구니 추가
	public void addCart(CartDTO cart);
	
	//장바구니 리스트
	public List<CartDTO> getCartList();
	
	//장바구니 수량 수정
	public int modifyCount(CartDTO cart);
	
	//장바구니 삭제
	public int deleteCart(Long cartBno);
	

}
