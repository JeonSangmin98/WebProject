package com.spring.service;

import java.util.ArrayList;

import com.spring.domain.BookDTO;
import com.spring.domain.Criteria;

public interface BookService {
	
//	public ArrayList<BookDTO> getList(); // 도서 리스트 테스트
	public ArrayList<BookDTO> getList(Criteria cri); //페이징 처리
	
	public void register(BookDTO dto); //도서 등록

	public ArrayList<BookDTO> categoryList1(); // 카테고리 IT
	public ArrayList<BookDTO> categoryList2(); // 카테고리 여행
	public ArrayList<BookDTO> categoryList3(); // 카테고리 종교
	public ArrayList<BookDTO> categoryList4(); // 카테고리 역사
	
	public BookDTO get(Long bno);  // 도서 상세정보
	
	public BookDTO searchList(String type, String keyword); // 도서 검색
	
	public int getTotal(Criteria cri); //총 도서 개수
	
}
