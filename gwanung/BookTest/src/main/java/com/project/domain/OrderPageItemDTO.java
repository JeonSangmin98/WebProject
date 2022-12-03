package com.project.domain;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	/* 뷰로부터 전달받을 값 */
	private Long bno;
	
	private Long bookCount;
	
	/* DB로부터 꺼내올 값 */
	private String title;
	
	private Long price;
	
	private double discount;
	
	/* 만들어 낼 값 */
	private Long salePrice;
	
	private Long totalPrice;
	
	private Long point;
	
	private Long totalPoint;
	
	/* 상품 이미지 */
	private String image;
	
	
	public void initSaleTotal() {
		this.salePrice = (long) (this.price * (1 - (this.discount/100)));
		this.totalPrice = this.salePrice * this.bookCount;
		this.point = (long)(Math.floor(this.salePrice * 0.05));
		this.totalPoint = this.point * this.bookCount;
	}
		
}
