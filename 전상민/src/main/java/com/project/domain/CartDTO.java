package com.project.domain;


import lombok.Data;

@Data
public class CartDTO {

	private Long cartBno; //장바구니 번호 (FK)
	private Long cartCount; //장바구니 품목 수량
	
	//도서테이블 값
	private Long bno; //도서 번호 (PK)
	private String title; //도서 이름
	private Long discount; //도서 가격
	private String category; //도서 카테고리
	private String image; //도서 이미지
	
	//회원 값
	private String memberId; // 회원 아이디 (PK)
	
	//총 가격
	private long totalPrice;
	
	//장바구니 총 가격
	public void totalPrice() {
		this.totalPrice = this.discount * this.cartCount;
		
	}
	
}
