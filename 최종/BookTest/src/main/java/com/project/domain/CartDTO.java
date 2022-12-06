package com.project.domain;


import lombok.Data;

@Data
public class CartDTO {

	private Long cartBno; //장바구니 번호 (FK)
	private Long cartCount; //장바구니 품목 수량
	
	//도서테이블 값
	private Long bno; //도서 번호 (PK)
	private String title; //도서 이름
	private Long price; //도서 가격
	private String category; //도서 카테고리
	private String image; //도서 이미지
	private double discount; //도서 할인
	private Long bookCount; //도서 수량
	
	private Long point; // 적립 포인트
	private Long totalPoint; //여러 구매 시 적립 포인트
	
	//회원 값
	private String memberId; // 회원 아이디 (PK)
	
	//총 가격
	private Long totalPrice;
	//할인 가격
	private Long salePrice;
	
	//장바구니 총 가격
	public void infoPrice() {
//		this.totalPrice = this.price * this.cartCount;
		this.salePrice = (long) (this.price * (1 - (this.discount/100))); //할인 가격 = 정가 x (1 - (할인/100)) 
		this.totalPrice = this.salePrice * this.cartCount; // 총 가격 = 카트 개수 x 할인금액
		this.point = (long) Math.floor(this.salePrice * 0.05);
		this.totalPoint = this.point * this.cartCount;
	}
	
}
