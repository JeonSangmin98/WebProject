package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.ReviewVO;
import com.project.domain.UpdateReviewDTO;

public interface ReviewMapper {
	public int insert(ReviewVO vo);	// 리뷰등록
	
	public ReviewVO read(Long reviewNo); // 특정 리뷰 읽기(조회)
	
	public int delete(Long reviewNo);	// 특정 리뷰 삭제
	
	public int update(ReviewVO vo);	// 특정 리뷰 수정
	
	// 리뷰 목록, 한 도서의 리뷰들만 대상으로 하기 때문에 도서의 번호도 필요
	public List<ReviewVO> getListWithPaging(
			@Param("cri")Criteria cri,
			@Param("bno")Long bno); 
	
	// 게시글 번호 카운트
	public int getCountByBno(Long bno);
	
	// 평점 평균 구하기
	public Double getRatingAvg(Long bno);
		
	// 평점 평균 반영
	public int updateRating(UpdateReviewDTO dto);
}
