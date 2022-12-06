package com.project.service;

import java.util.ArrayList;
import java.util.List;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;

public interface BookService {

//	public ArrayList<BookDTO> getList(); // 도서 리스트 테스트
	public ArrayList<BookDTO> getList(Criteria cri); // 페이징 처리

	public void register(BookDTO dto); // 도서 등록

	public BookDTO get(Long bno); // 도서 상세정보

	public List<BookDTO> searchList(String type, String keyword); // 도서 검색

	public int getTotal(Criteria cri); // 총 도서 개수

	public List<BookDTO> categoryList(String category); // 도서 카테고리

	public List<BookDTO> discountList(); // 높은 할인도서 리스트
	
	public List<BookDTO> popularList(); //인기도서 리스트
	
}
