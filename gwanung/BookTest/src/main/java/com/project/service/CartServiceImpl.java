package com.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper mapper;
	
	//장바구니 추가
	@Override
	public void addCart(CartDTO cart) {
			mapper.addCart(cart);
	}

	//장바구니 리스트
	@Override
	public List<CartDTO> getCartList() {
		return mapper.getCart();
	}

	//장바구니 수량 수정
	@Override
	public int modifyCount(CartDTO cart) {
		return mapper.modifyCount(cart);
	}

	//장바구니 삭제
	@Override
	public int deleteCart(Long cartBno) {
		return mapper.deleteCart(cartBno);
	}

}
