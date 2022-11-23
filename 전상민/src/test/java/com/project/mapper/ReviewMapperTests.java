package com.project.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Autowired
	private ReviewMapper mapper;
	
	private Long[] bnoArr = {1L,2L,3L,4L,5L};
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReviewVO vo = new ReviewVO();
			// 도서 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReview("리뷰 별점 테스트" + i);
			vo.setReviewer("reviewer" + i);
			vo.setRating(3);
			mapper.insert(vo);
		});
	}// testCreate()
}