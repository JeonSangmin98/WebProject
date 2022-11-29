package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ReviewDTO;
import com.project.domain.ReviewVO;
import com.project.mapper.BoardMapper;
import com.project.mapper.BookMapper;
import com.project.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private BookMapper bookMapper;

	@Transactional
	@Override
	public int register(ReviewVO vo) {
		bookMapper.updateReviewCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReviewVO get(Long reviewNo) {
		return mapper.read(reviewNo);
	}

	@Override
	public int modify(ReviewVO vo) {
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long reviewNo) {
		ReviewVO vo = mapper.read(reviewNo);
		bookMapper.updateReviewCnt(vo.getBno(), -1);
		return mapper.delete(reviewNo);
	}

	@Override
	public List<ReviewVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReviewDTO getListPage(Criteria cri, Long bno) {
		return new ReviewDTO(
				mapper.getCountByBno(bno), 
				mapper.getListWithPaging(cri, bno));
	}

}