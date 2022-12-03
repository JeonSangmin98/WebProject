package com.project.domain;

import lombok.Data;

@Data
public class OrderItemDTO {
	
	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
	private Long bno;
	
	/* 주문 수량 */
	private Long bookCount;
	
	/* tbl_orderItem의 기본키 */
	private Long orderItemId;
	
	/* 상품 한 개 가격 */
	private Long price;
	
	/* 상품 할인 율*/
	private double discount;
	
	/* 상품 한개 구매 시 획득 포인트 */
	private Long savePoint;
	
	/* DB에 없는 데이터 */
	
	/* 할인 적용된 가격 */
	private Long salePrice;
	
	/* 총 가격(할인 적용된 가격 * 주문 수량)*/
	private Long totalPrice;
	
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량)*/
	private Long totalSavePoint;
	
	public void initSaleTotal() {
		this.salePrice = (long) (this.price * (1 - (this.discount/100)));
		this.totalPrice = this.salePrice * this.bookCount;
		this.savePoint = (long)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint = this.savePoint * this.bookCount;
	}
}
