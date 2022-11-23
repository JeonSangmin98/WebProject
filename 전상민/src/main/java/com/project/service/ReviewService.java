package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ReviewDTO;
import com.project.domain.ReviewVO;

public interface ReviewService {
	// 등록
	public int register(ReviewVO vo);
	
	// 조회
	public ReviewVO get(Long reviewNo);
	
	// 수정
	public int modify(ReviewVO vo);
	
	// 삭제
	public int remove(Long reviewNo);
	
	// 목록
	public List<ReviewVO> getList(Criteria cri, Long bno);
	
	// 리뷰 목록
	public ReviewDTO getListPage(Criteria cri, Long bno);
}