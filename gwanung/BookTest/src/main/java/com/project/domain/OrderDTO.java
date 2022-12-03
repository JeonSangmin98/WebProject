package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	/* 주문 번호 */
	private String orderId;
	
	/* 배송 받는이 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String memberId;
	
	/* 우편번호 */
	private String memberAddr1;
	
	/* 회원 주소 */
	private String memberAddr2;
	
	/* 회원 상세주소 */
	private String memberAddr3;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;
	
	/* 배송비 */
	private Long deliveryCost;
	
	/* 사용 포인트 */
	private Long usePoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB에 존재하지 않는 데이터 */
	/* 판매가 */
	private Long orderSalePrice=0L;
	
	/* 적립 포인트 */
	private Long orderSavePoint=0L;
	
	/* 최종 판매 비용 */
	private Long orderFinalSalePrice;
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderItemDTO order : orders) {
				orderSalePrice += order.getTotalPrice();
				orderSavePoint += order.getTotalSavePoint();
			}
		/* 배송비용 */
			if(orderSalePrice >= (long)30000) {
				deliveryCost = 0L;
			} else {
				deliveryCost = 3000L;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}	
}
