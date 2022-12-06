package com.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.service.BookService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookServiceTests {
	
	@Autowired
	private BookService service;
	
	@Test
	public void testList() {
//		log.info(service.getList());
	}

	@Test
	public void testSearchList() {
//		log.info(service.searchList("교토"));
	}
	
	
	@Test
	public void testBno() {
		log.info(service.get(5L));
	}

}
