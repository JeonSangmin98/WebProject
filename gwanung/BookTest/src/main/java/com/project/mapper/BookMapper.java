package com.project.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;

public interface BookMapper {

	public ArrayList<BookDTO> getList(); //도서 전체 리스트
	
	public ArrayList<BookDTO> getListWithPaging(Criteria cri);  //페이징 처리
	
	public void insert(BookDTO dto);  // DB 데이터 저장
	
	public BookDTO read(Long bno); // 책 상세조회
	
	public List<BookDTO> searchList(@Param("type") String type, @Param("keyword") String keyword);//도서 검색
	
	public int getTotalCount(Criteria cri); //총 도서 개수
	
	public List<BookDTO> categoryList(String category); //도서 카테고리
	
	// 도서의 리뷰가 추가/삭제 될때마다 댓글 수 업데이트
	public void updateReviewCnt(@Param("bno") Long bno, @Param("amount") int amount); 
	
	public List<BookDTO> discountList(); // 높은 할인율 리스트

	public List<BookDTO> popularList(); // 인기도서 리스트
	
	public BookDTO bookCountTest(Long bno); //도서개수 검사
}
