package com.project.mapper;

import java.util.List;

import com.project.domain.CartDTO;

public interface CartMapper {
	
	//카트 추가
	public int addCart(CartDTO cart);
	
	//카트 삭제
	public int deleteCart(Long cartBno);
	
	//카트 수량 수정
	public int modifyCount(CartDTO cart);
	
	//카트 목록 
	public List<CartDTO> getCart(String memberId);
	
	//카트 중복 확인
	public CartDTO checkCart(CartDTO cart);
	
	//회원 카트 전체 삭제
	public void deleteMemberCart(String memberId);
	
}
