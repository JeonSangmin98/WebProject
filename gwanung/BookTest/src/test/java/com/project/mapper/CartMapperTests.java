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
import com.project.domain.Criteria;
import com.project.mapper.BookMapper;
import com.project.mapper.CartMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {

	@Autowired
	private CartMapper mapper;
	
	@Autowired
	private BookMapper bMapper;
	
	@Test
	public void addCart() {
		CartDTO cart = new CartDTO();
		cart.setBno(2L);
//		cart.setCount(2L);
		
		int result = 0;
		result = mapper.addCart(cart);
		System.out.println("test:" + result);
		
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(10);
		
		ArrayList<BookDTO> list = bMapper.getListWithPaging(cri);
		list.forEach(book -> log.info(book.getBno()));
	}
}
