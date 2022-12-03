package com.project.mapper;

import com.project.domain.BookDTO;
import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderItemDTO;
import com.project.domain.OrderPageItemDTO;

public interface OrderMapper {
	
	/* 주문 상품 정보 */
	public OrderPageItemDTO getGoodsInfo(Long bno);
	
	/* 주문 상품 정보(주문 처리) */
	public OrderItemDTO getOrderInfo(Long bno);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 포인트 차감 */
	public int deductPoint(MemberDTO member);
	
	/* 주문 재고 차감 */
	public int deductStock(BookDTO book);
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartDTO dto);
	
	/* 카트가 비었을 시 못넘어가도록 */
	public int checkOrder(OrderPageItemDTO co);
}
