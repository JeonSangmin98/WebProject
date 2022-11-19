package com.project.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;
import com.project.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	@Autowired
	private ReplyMapper mapper;
	// book_board 에 있는 게시물 번호 / pk 와 fk로 묶여있기 때문
	private Long[] bnoArr = { 40L, 38L, 37L, 36L, 35L }; 

	@Test
	public void testMapper() {
		log.info("--------------------");
		log.info(mapper);
	}// testMapper

	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			// 게시물 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer " + i);
			mapper.insert(vo);
		});
	}//testCreate
	
	@Test
	public void testRead() {
		Long targetRno = 5L;
		ReplyVO vo = mapper.read(targetRno);
		log.info("----------" + vo);
	}//testRead
	
	@Test
	public void testDelete() {
		Long targetRno = 5L;
		int count = mapper.delete(targetRno);
		log.info("----------" + count);
	}//testDelete
	
	@Test
	public void testUpdate() {
		ReplyVO vo = mapper.read(2L); 
		vo.setReply("Update Reply");
		int count = mapper.update(vo);
		log.info("---------- testUpdate : " + count);
	}//testUpdate
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(3,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}//testList
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 38L);
		replies.forEach(reply -> log.info(reply));
	}
}
