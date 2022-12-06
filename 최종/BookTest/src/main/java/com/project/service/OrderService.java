package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderPageItemDTO;


public interface OrderService {
	
	/* 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	/* 주문 */
	public void order(OrderDTO orw);
	
}
