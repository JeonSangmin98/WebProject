package com.project.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BookDTO;
import com.project.domain.CartDTO;
import com.project.mapper.BookMapper;
import com.project.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper mapper;
	@Autowired
	private BookMapper bookMapper;
	
	//장바구니 추가
	@Transactional
	@Override
	public int addCart(CartDTO cart, @Param("bno") Long bno){
		CartDTO checkCart = mapper.checkCart(cart);
		BookDTO bookDto = bookMapper.bookCountTest(bno); 
		
		//도서개수가 0인 경우면 6을 반환 (품절)
		if(bookDto != null) {
			return 6;
		}
		
		//장바구니에 등록하려는 데이터가 DB에 존재하지 않는다면 장바구니에 추가하고 DB에 존재하면 2를 반환
		if(checkCart != null) { 
			return 2;
		}
		
		//장바구니 등록 시 1 반환 / 에러 시 0 반환
		try {
			return mapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

	//장바구니 리스트
	@Override
	public List<CartDTO> getCartList(String memberId) {
		
		//장바구니 총 가격 전달
		List<CartDTO> cart = mapper.getCart(memberId);
		
		for(CartDTO dto : cart) {
			dto.infoPrice();
		}
		return cart;
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
