package com.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;

public interface BookMapper {

	public ArrayList<BookDTO> getList(); //도서 전체 리스트
	
	public ArrayList<BookDTO> getListWithPaging(Criteria cir);  //페이징 처리
	
	public void insert(BookDTO dto);  // DB 데이터 저장
	
	public BookDTO read(Long bno); // 책 상세조회
	
	public BookDTO searchList(@Param("type") String type, @Param("keyword") String keyword);//도서 검색
	
	public int getTotalCount(Criteria cri); //총 도서 개수
	

}
