package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BookDTO;
import com.spring.domain.Criteria;
import com.spring.mapper.BookMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookMapper mapper;
//		
//	//책 리스트 
//	@Override
//	public ArrayList<BookDTO> getList() {
//		return mapper.getList();
//	}
	
	//책 api 데이터 등록
	@Override
	public void register(BookDTO dto) {
		mapper.insert(dto);
	}

	//책 상세조회
	@Override
	public BookDTO get(Long bno) {
		return mapper.read(bno); 
	}
	// 책 검색
	@Override
	public BookDTO searchList(String type, String keyword) {
		return mapper.searchList(type, keyword);
	}
	//IT
	@Override
	public ArrayList<BookDTO> categoryList1() {
		return mapper.categoryList1();
	}
	//여행
	@Override
	public ArrayList<BookDTO> categoryList2() {
		return mapper.categoryList2();
	}
	//종교
	@Override
	public ArrayList<BookDTO> categoryList3() {
		return mapper.categoryList3();
	}
	//역사
	@Override
	public ArrayList<BookDTO> categoryList4() {
		return mapper.categoryList4();
	}

	//도서 전체 리스트 페이징 처리
	@Override
	public ArrayList<BookDTO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	//총 도서 개수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	
	




}
