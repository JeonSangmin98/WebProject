package com.project.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.BookDTO;
import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderItemDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTest {
	
	@Autowired
	private OrderMapper mapper;
	
	/* 상품 정보(주문 처리) */
	@Test
	public void getOrderInfoTest() {
		OrderItemDTO orderInfo = mapper.getOrderInfo(5L);
		
		System.out.println("result : "+orderInfo);
	}
	
	/* tbl_order 테이블 등록 */
	@Test
	public void enrollOrderTest() {
		
		OrderDTO ord = new OrderDTO();
		List<OrderItemDTO> orders = new ArrayList<OrderItemDTO>();
		OrderItemDTO order1 = new OrderItemDTO();
		
		order1.setBno(5L);
		order1.setBookCount(5L);
		order1.setPrice(70000L);
		order1.setDiscount(10);
		order1.initSaleTotal();
		System.out.println(order1.getSavePoint());
		System.out.println(order1.getTotalPrice());
		
		ord.setOrders(orders);
		
		ord.setOrderId("2021_test1");
		ord.setAddressee("test");
		ord.setMemberId("test1");
		ord.setMemberAddr1("test");
		ord.setMemberAddr2("test");
		ord.setMemberAddr3("test");
		ord.setOrderState("배송준비");
		ord.setUsePoint(1000L);
		ord.getOrderPriceInfo();
		
		mapper.enrollOrder(ord);		
		
	}
	
	/* tbl_itemorder 테이블 등록 */
	@Test
	public void enrollOrderItemTest(){
		
		OrderItemDTO oid = new OrderItemDTO();
		
		oid.setOrderId("2021_test1");
		oid.setBno(5L);
		oid.setBookCount(1L);
		oid.setPrice(70000L);
		oid.setDiscount(10);
				
		oid.initSaleTotal();
		
		mapper.enrollOrderItem(oid);
		
	}	
	
	/* 회원 돈, 포인트 정보 변경 */
	@Test
	public void deductMoneyTest() {
		
		MemberDTO member = new MemberDTO();
		
		member.setMemberId("test1");
		member.setPoint(5000L);
		
		mapper.deductPoint(member);
	}
	
	/* 상품 재고 변경 */
	
	@Test
	public void deductStockTest() {
		BookDTO book = new BookDTO();
		
		book.setBno(5L);
		book.setBookCount(10L);
		
		mapper.deductStock(book);
	}
	
	/* 장바구니 제거(주문 처리) */
	@Test
	public void deleteOrderCart() {
		String memberId = "test1";
		long bookId = 2;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		dto.setBno(bookId);
		
		mapper.deleteOrderCart(dto);
		
	}
}
