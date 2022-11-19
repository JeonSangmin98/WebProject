package com.project.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
//		select * from book_board where bno > 0
		log.info("--------------------");
		mapper.getList();
	}//testGetList
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		mapper.insert(board);
		log.info(board);
	}//testInsert
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie2");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}//testInsertSelectKey
	
	@Test
	public void testRead() {
//		존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);	// bno가 5인 게시물 읽어오기
		log.info(board);
	}//testRead
	
	@Test
	public void testDelete() {
		int count = mapper.delete(1L);	// 1번 게시물 삭제
		log.info("========== " + count);
	}//testDelete
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		
//		2번 게시물 수정
		board.setBno(2L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("admin");
		log.info("======= testUpdate : " + mapper.update(board));
	}//testUpdate
	
	@Test
	public void testPaging() {
		log.info("--------------------");
		mapper.getListWithPaging(new Criteria(2,10));
	}//testPaging
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("TC");
		mapper.getListWithPaging(cri);
	}//testSearch
}